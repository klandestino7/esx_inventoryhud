## esx_inventoryhud 1.0.0

Inventário Original: https://github.com/Trsak/esx_inventoryhud

Inventário HUD para ESX. Você pode abrir ef echar o usando F2. Parte do código foi tirada de es_extended.

## Requerimentos
* [es_extended](https://github.com/ESX-Org/es_extended)
* [pNotify](https://forum.fivem.net/t/release-pnotify-in-game-js-notifications-using-noty/20659)

## Características
- Arrastar e soltar
- Using items
- Usar itens
- Dar itens
- Dinheiro incluído
- Suporte de contas (banco, dinheiro preto, ...)
- Apoio de armas
- Sistema de Peso por KG

## Screens
* [https://media.discordapp.net/attachments/526437955217391616/591086080921567259/inventari.png](https://media.discordapp.net/attachments/526437955217391616/591086080921567259/inventari.png)

### INSTALAÇÃO
- DOWNLOAD https://github.com/Trsak/esx_inventoryhud/archive/master.zip
- Extrair e colocar nos resources

## Installation
Check [wiki page](https://github.com/Trsak/esx_inventoryhud/wiki)


#Primeiro, você precisa remover o inventário padrão es_extended:

* Abra es_extended, então encontre e remova este código em client / main.lua

```
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		if IsControlJustReleased(0, Keys['F2']) and IsInputDisabled(0) and not isDead and not ESX.UI.Menu.IsOpen('default', 'es_extended', 'inventory') then
			ESX.ShowInventory()
		end

	end
end)
```


#Em seguida, basta iniciar o recurso no seu server.cfg
```
start esx_inventoryhud
```
