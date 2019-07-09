ESX = nil

local arrayWeight = Config.localWeight

TriggerEvent(
	"esx:getSharedObject",
	function(obj)
		ESX = obj
	end
)


TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)

AddEventHandler('onMySQLReady', function ()
  if Config.WeightSqlBased == true then
    MySQL.Async.fetchAll(
      'SELECT * FROM item_weight',
      {},
      function(result)
        for i=1, #result, 1 do
          arrayWeight[result[i].item] = result[i].weight
        end

      end
    )
  end
end)

-- Return the sum of all item in pPlayer inventory
function getInventoryWeight(pPlayer)
  local weight = 0
  local itemWeight = 0

  if #pPlayer.inventory > 0 then
	  for i=1, #pPlayer.inventory, 1 do
	    if pPlayer.inventory[i] ~= nil then
	      itemWeight = Config.DefaultWeight
	      if arrayWeight[pPlayer.inventory[i].name] ~= nil then
	        itemWeight = arrayWeight[pPlayer.inventory[i].name]
	      end
	      weight = weight + (itemWeight * pPlayer.inventory[i].count)
	    end
	  end
  end

  return weight
end

-- Get user speed
-- https://runtime.fivem.net/doc/reference.html#_0x6DB47AA77FD94E09

RegisterServerEvent('esx_inventoryhud:FUpdate')
AddEventHandler('esx_inventoryhud:FUpdate', function(xPlayer)
  local source_ = source
  local weight = getInventoryWeight(xPlayer)
  TriggerClientEvent('esx_inventoryhud:change',source_,weight)
end)


RegisterServerEvent('esx_inventoryhud:Update')
AddEventHandler('esx_inventoryhud:Update', function(source)
  local source_ = source
  local xPlayer = ESX.GetPlayerFromId(source_)
  local weight = getInventoryWeight(xPlayer)
  TriggerClientEvent('esx_inventoryhud:change',source_,weight)
end)



RegisterServerEvent('esx:onAddInventoryItem')
AddEventHandler('esx:onAddInventoryItem', function(source, item, count)
  local source_ = source
  local xPlayer = ESX.GetPlayerFromId(source_)
  local currentInventoryWeight = getInventoryWeight(xPlayer)
  TriggerEvent('esx_inventoryhud:Update',source_)
  if currentInventoryWeight > Config.Limit then
    local xPlayer = ESX.GetPlayerFromId(source_)
    local itemWeight = Config.DefaultWeight

    -- Get weight if it exists of current item
    if arrayWeight[item.name] then
      itemWeight = arrayWeight[item.name]
    end
    local qty = 0
    local weightTooMuch = 0
    weightTooMuch = currentInventoryWeight - Config.Limit
    qty = math.floor(weightTooMuch / itemWeight) + 1

    -- Should be false all the time. But can be true on fresh install
    if qty > count then
      qty = count
    end
  ESX.CreatePickup('item_standard', item.name, qty, item.label..'['..qty..']', source_)
    TriggerClientEvent('esx:showNotification', source_, '~s~Caiu ~r~' .. qty .. 'x ' .. item.label .. '~s~ do seu inventario')
    xPlayer.removeInventoryItem(item.name, qty)
    TriggerEvent('esx_inventoryhud:Update',source_)
  end
end)

RegisterServerEvent('esx:onRemoveInventoryItem')
AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
  TriggerEvent('esx_inventoryhud:Update',source)
    if Config.userSpeed == true then
      local source_ = source
      local xPlayer = ESX.GetPlayerFromId(source_)
      local currentInventoryWeight = getInventoryWeight(xPlayer)
      local speed = getUserSpeed(currentInventoryWeight)
    end
end)


ESX.RegisterServerCallback(
	"esx_inventoryhud:getPlayerInventory",
	function(source, cb, target)
		local targetXPlayer = ESX.GetPlayerFromId(target)

		if targetXPlayer ~= nil then
			cb({inventory = targetXPlayer.inventory, money = targetXPlayer.getMoney(), accounts = targetXPlayer.accounts, weapons = targetXPlayer.loadout})
		else
			cb(nil)
		end
	end
)

RegisterServerEvent("esx_inventoryhud:tradePlayerItem")
AddEventHandler(
	"esx_inventoryhud:tradePlayerItem",
	function(from, target, type, itemName, itemCount)
		local _source = from

		local sourceXPlayer = ESX.GetPlayerFromId(_source)
		local targetXPlayer = ESX.GetPlayerFromId(target)

		if type == "item_standard" then
			local sourceItem = sourceXPlayer.getInventoryItem(itemName)
			local targetItem = targetXPlayer.getInventoryItem(itemName)

			if itemCount > 0 and sourceItem.count >= itemCount then
				if targetItem.limit ~= -1 and (targetItem.count + itemCount) > targetItem.limit then
				else
					sourceXPlayer.removeInventoryItem(itemName, itemCount)
					targetXPlayer.addInventoryItem(itemName, itemCount)
				end
			end
		elseif type == "item_money" then
			if itemCount > 0 and sourceXPlayer.getMoney() >= itemCount then
				sourceXPlayer.removeMoney(itemCount)
				targetXPlayer.addMoney(itemCount)
			end
		elseif type == "item_account" then
			if itemCount > 0 and sourceXPlayer.getAccount(itemName).money >= itemCount then
				sourceXPlayer.removeAccountMoney(itemName, itemCount)
				targetXPlayer.addAccountMoney(itemName, itemCount)
			end
		elseif type == "item_weapon" then
			if not targetXPlayer.hasWeapon(itemName) then
				sourceXPlayer.removeWeapon(itemName)
				targetXPlayer.addWeapon(itemName, itemCount)
			end
		end
	end
)

RegisterCommand(
	"openinventory",
	function(source, args, rawCommand)
		if IsPlayerAceAllowed(source, "inventory.openinventory") then
			local target = tonumber(args[1])
			local targetXPlayer = ESX.GetPlayerFromId(target)

			if targetXPlayer ~= nil then
				TriggerClientEvent("esx_inventoryhud:openPlayerInventory", source, target, targetXPlayer.name)
			else
				TriggerClientEvent("chatMessage", source, "^1" .. _U("no_player"))
			end
		else
			TriggerClientEvent("chatMessage", source, "^1" .. _U("no_permissions"))
		end
	end
)



-- WIP: Someone to contribute ? Extend user max weight when skin having a bag ?

--	-- skin based solution (Config.BagIsSkin = true)

		--RegisterServerEvent('esx_skin:save')
		--AddEventHandler('esx_skin:save', function(skin)
		--	-- TODO: If skin, increase player max weight
		-- 	-- 		Do not forget to bind on esx:onRemoveInventoryItem when removing the bag.
		--end)


--	-- item bag based solution (Config.BagIsSkin = false)

		-- esx:onAddInventoryItem if item = bag
		-- esx:onRemoveInventoryItem if item = bag


-- TDB: If player throw, sell, give is bag (item or skin), need algo to throw randomly items ?