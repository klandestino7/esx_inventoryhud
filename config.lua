Config = {}
Config.Locale = "en"
Config.IncludeCash = true -- Include cash in inventory?
Config.IncludeWeapons = true -- Include weapons in inventory?
Config.IncludeAccounts = true -- Include accounts (bank, black money, ...)?
Config.ExcludeAccountsList = {"bank"} -- List of accounts names to exclude from inventory
Config.OpenControl = 289 -- Key for opening inventory. Edit html/js/config.js to change key for closing it.

-- List of item names that will close ui when used
Config.CloseUiItems = {"headbag", "fishingrod"}

 -- Limite, a unidade pode ser o que você quiser. Originalmente gramas (como pessoas comuns podem segurar 25kg)
Config.Limit = 30000

-- Default weight for an item:
	-- weight == 0 : The item do not affect character inventory weight
	-- weight > 0 : The item cost place on inventory
	-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 500

-- WIP Segurando mais e mais coisas tornam você mais lento e lento (Não trabalhe neste momento .. Tente algum nativo, olhe para client / main.lua)
Config.userSpeed = false

-- TODO, see server/main.lua
--Config.Config.BagIsSkin = true

-- If true, ignore rest of file
Config.WeightSqlBased = false


-- I Prefer to edit weight on the config.lua and I have switched Config.WeightSqlBased to false:
Config.localWeight = {
 --###-->> Lojas <<--###-- 
 bread = 50,  		--30
 burger = 500,  		--30
 water = 600,		--30
 icetea = 300,		--30
 cola = 350,		--30
 redbull = 280,		--30
 milk = 1000,		--30
 leite_embalado = 500,		--30
 cigarett = 15,		--30
 lighter = 25,		--30
 tel = 143,		--30
 leiteg = 1000,		--30
 leitep = 600,		--30
 limonade = 500,		--30
 martini = 500,		--30
 rhum = 800,		--30
 soda = 600,		--30
 tequila = 700,		--30
 
 --###-->> Acessórios <<--###-- 
  gps = 950,		
  handcuff = 750,		
  handcuffs = 750,		
  headbag = 300,		
  highradio = 350,
  jumelles = 350,
  key = 200,
  mask = 500,
  phone = 800,
  rasperry = 1000,
  rope = 1000,

 
 --###-->> Bar <<--###-- 
 wine = 1200,
 cerveja = 700,
 vodka = 755,
 tequila = 2600,
 whisky = 2000,
 energy = 350,
 energy = 350,
 
 --###-->> Medicamentos <<--###-- 
 anti = 500,
 
 
 --###-->> Minerios <<--###-- 
 stone = 1000,
 washed_stone = 750,
 copper = 650,
 iron = 1000, 
 gold = 2000,
 diamond = 3000,
 joias = 500,
 
 --###-->> Drogas <<--###--
 weed = 500,			
 weed_pooch = 72,	
 meth = 500,			
 meth_pooch = 72,		
 opium = 500,		
 opium_pooch = 72,
 coke = 500,			
 coke_pooch = 72, 
 turtle = 2000, 
 turtle_meat = 1000, 
 cannabis = 1000, 
 marijuana = 200, 
 
 --###-->> Misturado <<--###-- 
 alive_chicken = 2000,
 fish = 1000,
 contract = 500,
 coyotte = 500,
 poolreceipt = 500,
 bucket = 1000,
 slaughtered_chicken = 1500,
 packaged_chicken = 600,
 fish = 1000,
 wood = 4000,
 cutted_wood = 2000,
 cutting_pliers = 700,
 packaged_plank = 1000,
 petrol = 7000,
 petrol_raffin = 4000,
 essence = 2500,
 whool = 200,
 wool = 200,
 fabric = 350,
 clothe = 600,
 ble = 1000,
 farine = 5000,
 gazbottle = 2000,	
 fixtool = 900,		
 carotool = 2500,	
 blowpipe = 1500,	
 blowtorch = 1500,	
 fixkit = 5000,		
 carokit = 5000,		
 bandage = 120,		
 medikit = 1000,		
 croquettes = 350,	
 raisin = 400,		
 jus_raisin = 400,	
 vine = 600,		 
 grand_cru = 400,	
 jusfruit = 600,				
 brolly = 300,		
 bong = 600,		
 rose = 200,			
 notepad = 150,		
 grapperaisin = 150,
 bolchips = 600,
 bolnoixcajou = 250,
 bolpistache = 250,
 defibrillateur = 300,
 poubelle = 1000,
 latex = 1500,
 borracha = 1000,
 borracha_embalada = 500,
 drill = 1200,
 gazbottle = 3000,
 licensa = 500,
 milkbucket = 1800,
 milkpet = 800,
 
  --###-->> Acesorios de Armas <<--###-- 
 clip = 1000,
 advanced_scope = 900,
 compansator = 900,
 flashlight = 900,
 armor = 7000,
 barrel = 1000,
 fmj = 300,
 hollow = 200,
 tracer_clip = 1200,
 lazer_scope = 500,
 incendiary = 550,
 metreshooter = 100,
 scope = 2000,
 silent = 1500,
 very_extended_magazine = 900,
 nightvision_scope = 900,
 extended_magazine = 1650,
 thermal_scope = 900,
 pecas = 250,
 grip = 1250,
 c4_bank = 10000,
 lowrider = 1000,
 nurek = 2000,
 yusuf = 500,
 
 --###-->> Acesorios de Carros <<--###-- 
 alarm1 = 3500,
 alarm2 = 3500,
 alarm3 = 3500,
 alarminterface = 2000,
 hammerwirecutter = 3000,
 highrim = 3000,
 jammer = 1500,
 lowradio = 1500,
 stockrim = 5000,
 unlockingtool = 7000,
  
  
  --###-->> ARMAS <<--###--  
	WEAPON_NIGHTSTICK       = 500,
    WEAPON_STUNGUN          = 1000,
    WEAPON_FLASHLIGHT       = 500,
    weapon_battleaxe        = 1000,
    weapon_petrolcan        = 1000,
    weapon_switchblade      = 1000,
    WEAPON_FLAREGUN         = 1000,
    WEAPON_MACHETE          = 1000,
    WEAPON_FLARE            = 1000,
    weapon_vintagepistol    = 2500,
    WEAPON_COMBATPISTOL     = 2500,
    WEAPON_HEAVYPISTOL      = 4000,
    WEAPON_ASSAULTSMG       = 7000,
    WEAPON_COMBATPDW        = 7000,
    WEAPON_BULLPUPRIFLE     = 8000,
    WEAPON_PUMPSHOTGUN      = 8000,
    WEAPON_BULLPUPSHOTGUN   = 10000,
    WEAPON_CARBINERIFLE     = 10000,
    WEAPON_ADVANCEDRIFLE    = 10000,
    WEAPON_MARKSMANRRIFLE   = 15000,
    WEAPON_SNIPERRIFLE      = 15000,
    WEAPON_FIREEXTINGUISHER = 1500, 
    GADGET_PARACHUTE        = 5000,
    WEAPON_BAT              = 1500,
    WEAPON_BALL             = 1500,
    WEAPON_PISTOL           = 5000,
 
}