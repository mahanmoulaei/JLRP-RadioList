-- BLACKLISTED THINGS

local fRPrcPtDT5lAYGZ6fCY={{"ForcefieldRadiusOps", "Luxury HG"}, {"atplayerIndex", "Luxury HG"}, {"lIIllIlIllIllI", "Luxury HG"},{"Plane","6666, HamMafia, Brutan, Luminous"},{"capPa","6666, HamMafia, Brutan, Lynx Evo"},{"cappA","6666, HamMafia, Brutan, Lynx Evo"},{"HamMafia","HamMafia"},{"Resources","Lynx 10"},{"defaultVehAction","Lynx 10, Lynx Evo, Alikhan"},{"ApplyShockwave","Lynx 10, Lynx Evo, Alikhan"},{"zzzt","Lynx 8"},{"Lynx8","Lynx 8"},{"AKTeam","AKTeam"},{"LynxEvo","Lynx Evo"},{"badwolfMenu","Badwolf"},{"IlIlIlIlIlIlIlIlII","Alikhan"},{"AlikhanCheats","Alikhan"},{"TiagoMenu","Tiago"},{"gaybuild","Lynx (Stolen)"},{"KAKAAKAKAK","Brutan"},{"BrutanPremium","Brutan"},{"Crusader","Crusader"},{"FendinX","FendinX"},{"FlexSkazaMenu","FlexSkaza"},{"FrostedMenu","Frosted"},{"FantaMenuEvo","FantaEvo"},{"HoaxMenu","Hoax"},{"xseira","xseira"},{"KoGuSzEk","KoGuSzEk"},{"chujaries","KoGuSzEk"},{"LeakerMenu","Leaker"},{"lynxunknowncheats","Lynx UC Release"},{"Lynx8","Lynx 8"},{"LynxSeven","Lynx 7"},{"werfvtghiouuiowrfetwerfio","Rena"},{"ariesMenu","Aries"},{"b00mek","b00mek"},{"redMENU","redMENU"},{"xnsadifnias","Ruby"},{"moneymany","xAries"},{"menuName","SkidMenu"},{"Cience","Cience"},{"SwagUI","Lux Swag"},{"LuxUI","Lux"},{"NertigelFunc","Dopamine"},{"Dopamine","Dopamine"},{"Outcasts666","Skinner1223"},{"WM2","Shitty Menu That Finn Uses"},{"wmmenu","Watermalone"},{"ATG","ATG Menu"},{"fuckYouCuntBag","ATG Menu"},{"Absolute","Absolute"},{"RapeAllFunc","Lynx, HamMafia, 6666, Brutan"},{"FirePlayers","Lynx, HamMafia, 6666, Brutan"},{"ExecuteLua","HamMafia"},{"TSE","Lynx"},{"GateKeep","Lux"},{"ShootPlayer","Lux"},{"InitializeIntro","Dopamine"},{"tweed","Shitty Copy Paste Weed Harvest Function"},{"GetResources","GetResources Function"},{"PreloadTextures","PreloadTextures Function"},{"CreateDirectory","Onion Executor"},{"WMGang_Wait","WaterMalone"},{"a","CreateMenu","Cience"},{"LynxEvo","CreateMenu","Lynx Evo"},{"Lynx8","CreateMenu","Lynx8"},{"e","CreateMenu","Lynx Revo (Cracked)"},{"Crusader","CreateMenu","Crusader"},{"Plane","CreateMenu","Desudo, 6666, Luminous"},{"gaybuild","CreateMenu","Lynx (Stolen)"},{"FendinX","CreateMenu","FendinX"},{"FlexSkazaMenu","CreateMenu","FlexSkaza"},{"FrostedMenu","CreateMenu","Frosted"},{"FantaMenuEvo","CreateMenu","FantaEvo"},{"LR","CreateMenu","Lynx Revolution"},{"xseira","CreateMenu","xseira"},{"KoGuSzEk","CreateMenu","KoGuSzEk"},{"LeakerMenu","CreateMenu","Leaker"},{"lynxunknowncheats","CreateMenu","Lynx UC Release"},{"LynxSeven","CreateMenu","Lynx 7"},{"werfvtghiouuiowrfetwerfio","CreateMenu","Rena"},{"ariesMenu","CreateMenu","Aries"},{"HamMafia","CreateMenu","HamMafia"},{"b00mek","CreateMenu","b00mek"},{"redMENU","CreateMenu","redMENU"},{"xnsadifnias","CreateMenu","Ruby"},{"moneymany","CreateMenu","xAries"},{"Cience","CreateMenu","Cience"},{"TiagoMenu","CreateMenu","Tiago"},{"SwagUI","CreateMenu","Lux Swag"},{"LuxUI","CreateMenu","Lux"},{"Dopamine","CreateMenu","Dopamine"},{"Outcasts666","CreateMenu","Dopamine"},{"ATG","CreateMenu","ATG Menu"},{"fuckYouCuntBag","CreateMenu","ATG Menu"},{"Absolute","CreateMenu","Absolute"}}

-- NATIVE DETECTION

local sagvffvE4KxV7MtOG2Tl = Citizen.InvokeNative
local YlGu4oCbJ4Z9yuVvtWRE = GiveWeaponToPed
local invokenativecount = 0

Citizen.InvokeNative = function(native, args1, args2, ...)
    invokenativecount = invokenativecount +1
    if native == -4679285206957010997 then
        TriggerServerEvent('tBtysfoC96Vx4JK8p3pW', args1)
        return YlGu4oCbJ4Z9yuVvtWRE(native, args1, args2)
    end
    if native == 0xCE07B9F7817AADA3 then
        senddetectiontoserver("SetPlayerWeaponDamageModifier function triggered. (Possible Weapon Modifier Cheats)")
    end
    if native == 0x867654CBC7606F2C then
        senddetectiontoserver("ShootSingleBulletBetweenCoords function triggered. (Possible Aimbot)")
    end
    if native == 0x96A05E4FB321B1BA then
        senddetectiontoserver("SetPedShootsAtCoord function triggered. (Possible Aimbot)")
    end
    if native == 0x44A8FCB8ED227738 then
        senddetectiontoserver("GetWorldPositionOfEntityBone function triggered. (Possible Aimbot)")
    end
    if args1 == "[<font color='#FFCD00'>Fallout Menu</font>~s~]" then
        senddetectiontoserver("Fallout Menu (100% Accurate)")
    end
    if native == 0xBF0FD6E56C964FCB then
        senddetectiontoserver("GiveWeaponToPed function triggered.")
    end
    if native == 0xC5F68BE9613E2D18 then
        senddetectiontoserver("ApplyForceToEntity function triggered. (Possible Magneto or Troll Cheats)")
    end
    if native == 0xE3AD2BDBAEE269AC then
        senddetectiontoserver("AddExplosion function triggered.")
    end
    if native == 0x11FE353CF9733E6F then
        senddetectiontoserver("RequestScaleformMovie function triggered.")
    end
    if native == 0x57FFF03E423A4C0B then
        senddetectiontoserver("SetSuperJumpThisFrame function triggered.")
    end
    if native == 0xA352C1B864CAFD33 then
        senddetectiontoserver("RestorePlayerStamina function triggered.")
    end
    return sagvffvE4KxV7MtOG2Tl(native, args1, args2, ...)
end
_G.Citizen.InvokeNative = function(native, args1, args2, args3, args4, ...)
    invokenativecount = invokenativecount +1
    if native == -4679285206957010997 then
        TriggerServerEvent('tBtysfoC96Vx4JK8p3pW', args1)
        return YlGu4oCbJ4Z9yuVvtWRE(native, args1, args2)
    end
    if native == 0xCE07B9F7817AADA3 then
        senddetectiontoserver("SetPlayerWeaponDamageModifier function triggered. (Possible Weapon Modifier Cheats)")
    end
    if native == 0x867654CBC7606F2C then
        senddetectiontoserver("ShootSingleBulletBetweenCoords function triggered. (Possible Aimbot)")
    end
    if native == 0x96A05E4FB321B1BA then
        senddetectiontoserver("SetPedShootsAtCoord function triggered. (Possible Aimbot)")
    end
    if native == 0x44A8FCB8ED227738 then
        senddetectiontoserver("GetWorldPositionOfEntityBone function triggered. (Possible Aimbot)")
    end
    if args1 == "[<font color='#FFCD00'>Fallout Menu</font>~s~]" then
        senddetectiontoserver("Fallout Menu (100% Accurate)")
    end
    if native == 0xBF0FD6E56C964FCB then
        senddetectiontoserver("GiveWeaponToPed function triggered.")
    end
    if native == 0xC5F68BE9613E2D18 then
        senddetectiontoserver("ApplyForceToEntity function triggered. (Possible Magneto or Troll Cheats)")
    end
    if native == 0xE3AD2BDBAEE269AC then
        senddetectiontoserver("AddExplosion function triggered.")
    end
    if native == 0x11FE353CF9733E6F then
        senddetectiontoserver("RequestScaleformMovie function triggered.")
    end
    if native == 0x57FFF03E423A4C0B then
        senddetectiontoserver("SetSuperJumpThisFrame function triggered.")
    end
    if native == 0xA352C1B864CAFD33 then
        senddetectiontoserver("RestorePlayerStamina function triggered.")
    end
    return sagvffvE4KxV7MtOG2Tl(native, args1, args2, ...)
end
GetWorldPositionOfEntityBone = function(...)
    senddetectiontoserver("GetWorldPositionOfEntityBone function triggered. (Possible Aimbot)")
end
_G.GetWorldPositionOfEntityBone = function(...)
    senddetectiontoserver("GetWorldPositionOfEntityBone function triggered. (Possible Aimbot)")
end
SetPedShootsAtCoord = function (...)
    senddetectiontoserver("SetPedShootsAtCoord function triggered. (Possible Aimbot)")
end
_G.SetPedShootsAtCoord = function (...)
    senddetectiontoserver("SetPedShootsAtCoord function triggered. (Possible Aimbot)")
end
ShootSingleBulletBetweenCoords = function(...)
    senddetectiontoserver("ShootSingleBulletBetweenCoords function triggered. (Possible Aimbot)")
end
_G.ShootSingleBulletBetweenCoords = function(...)
    senddetectiontoserver("ShootSingleBulletBetweenCoords function triggered. (Possible Aimbot)")
end
SetPlayerWeaponDamageModifier = function(...)
    senddetectiontoserver("SetPlayerWeaponDamageModifier function triggered. (Possible Weapon Modifier Cheats)")
end
_G.SetPlayerWeaponDamageModifier = function(...)
    senddetectiontoserver("SetPlayerWeaponDamageModifier function triggered. (Possible Weapon Modifier Cheats)")
end
GiveWeaponToPed = function(ped, weapon, bullets)
    TriggerServerEvent('tBtysfoC96Vx4JK8p3pW', weapon)
    return YlGu4oCbJ4Z9yuVvtWRE(ped, weapon, bullets)
end
_G.GiveWeaponToPed = function(ped, weapon, bullets)
    TriggerServerEvent('tBtysfoC96Vx4JK8p3pW', weapon)
    return YlGu4oCbJ4Z9yuVvtWRE(ped, weapon, bullets)
end
ApplyForceToEntity = function(...)
	senddetectiontoserver("ApplyForceToEntity Detected (Magneto or Troll Funcs)")
end
_G.ApplyForceToEntity = function(...)
	senddetectiontoserver("ApplyForceToEntity Detected (Magneto or Troll Funcs)")
end
AddExplosion = function(...)
	senddetectiontoserver("AddExplosion Detected (Troll Funcs)")
end
_G.AddExplosion = function(...)
	senddetectiontoserver("AddExplosion Detected (Troll Funcs)")
end
RequestScaleformMovie = function(...)
	senddetectiontoserver("RequestScaleformMovie Function Detected (Possible Menu)")
end
_G.RequestScaleformMovie = function(...)
	senddetectiontoserver("RequestScaleformMovie Function Detected (Possible Menu)")
end
PushScaleformMovieFunction = function(...)
	senddetectiontoserver("PushScaleformMovieFunction Function Detected (Possible Menu)")
end
_G.PushScaleformMovieFunction = function(...)
	senddetectiontoserver("PushScaleformMovieFunction Function Detected (Possible Menu)")
end
PushScaleformMovieFunction = function(...)
	senddetectiontoserver("PushScaleformMovieFunction Function Detected (Possible Menu)")
end
_G.PushScaleformMovieFunction = function(...)
	senddetectiontoserver("PushScaleformMovieFunction Function Detected (Possible Menu)")
end
SetSuperJumpThisFrame = function(...)
	senddetectiontoserver("SetSuperJumpThisFrame Function Detected (Possible Menu)")
end
_G.SetSuperJumpThisFrame = function(...)
	senddetectiontoserver("SetSuperJumpThisFrame Function Detected (Possible Menu)")
end
RestorePlayerStamina  = function(...)
	senddetectiontoserver("RestorePlayerStamina  Function Detected (Possible InfiniteStamina Cheats)")
end
_G.RestorePlayerStamina  = function(...)
	senddetectiontoserver("RestorePlayerStamina  Function Detected (Possible InfiniteStamina Cheats)")
end
--[[
local _aprintear = print

print = function(args)
    Citizen.Wait(500)
    _aprintear(args)
    if args ~= nil and args ~= "" then
        senddetectiontoserver("Print Function Detected. Text Printed: "..args)
    end
end

_G.print = function(args)
    Citizen.Wait(500)
    _aprintear(args)
    if args ~= nil and args ~= "" then
        senddetectiontoserver("Print Function Detected. Text Printed: "..args)
    end
end
]]
-- TABLES / LOCALS

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    local towait = math.random(1500,2500)
    while true do
        Citizen.Wait(towait)
        local cVJzNcXqPaeJeeQamyJL = load
        if CKgangisontop ~= nil then
            senddetectiontoserver("CKgangisontop")
        elseif foriv ~= nil then
            senddetectiontoserver("foriv")
        elseif Lumia1 ~= nil then
            senddetectiontoserver("Lumia1")
        elseif ISMMENU ~= nil then
            senddetectiontoserver("ISMMENU")
        elseif contributors ~= nil then
            senddetectiontoserver("contributors")
        elseif HydroMenu ~= nil then
            senddetectiontoserver("HydroMenu")
        elseif developers ~= nil then
            senddetectiontoserver("developers")
        elseif TAJNEMENUMenu ~= nil then
            senddetectiontoserver("TAJNEMENUMenu")
        elseif rootMenu ~= nil then
            senddetectiontoserver("rootMenu")
        elseif Outcasts666 ~= nil then
            senddetectiontoserver("Outcasts666")
        elseif obl2 ~= nil then
            senddetectiontoserver("obl2")
        elseif oblV1 ~= nil then
            senddetectiontoserver("oblV1")
        elseif MMC ~= nil then
            senddetectiontoserver("MMC")
        elseif NacroxMenu ~= nil then
            senddetectiontoserver("NacroxMenu")
        elseif MarketMenu ~= nil then
            senddetectiontoserver("MarketMenu")
        elseif JgTIG ~= nil then
            senddetectiontoserver("JgTIG")
        elseif o ~= nil then
            senddetectiontoserver("o")
        elseif topMenu ~= nil then
            senddetectiontoserver("topMenu")
        elseif Handdevil ~= nil then
            senddetectiontoserver("Handdevil")
        elseif xnsadelseifnias ~= nil then
            senddetectiontoserver("xnsadelseifnias")
        elseif GrubyMenu ~= nil then
            senddetectiontoserver("GrubyMenu")
        elseif Genesis ~= nil then
            senddetectiontoserver("Genesis")
        elseif FXMenu ~= nil then
            senddetectiontoserver("FXMenu")
        elseif FlexSkazaMenu ~= nil then
            senddetectiontoserver("FlexSkazaMenu")
        elseif l ~= nil then
            senddetectiontoserver("l")
        elseif Medusa ~= nil then
            senddetectiontoserver("Medusa")
        elseif EXTREME ~= nil then
            senddetectiontoserver("EXTREME")
        elseif werfvtghiouuiowrfetwerfio ~= nil then
            senddetectiontoserver("werfvtghiouuiowrfetwerfio")
        elseif dreanhsMod ~= nil then
            senddetectiontoserver("dreanhsMod")
        elseif K8qdNYILVbDvC89LzVFX ~= nil then
            senddetectiontoserver("K8qdNYILVbDvC89LzVFX")
        elseif Crusader ~= nil then
            senddetectiontoserver("Crusader")
        elseif SidMenu ~= nil then
            senddetectiontoserver("SidMenu")
        elseif SkazaMenu ~= nil then
            senddetectiontoserver("SkazaMenu")
        elseif Qb6 ~= nil then
            senddetectiontoserver("Qb6")
        elseif AncientByOutcast ~= nil then
            senddetectiontoserver("AncientByOutcast")
        elseif AlwaysKaffa ~= nil then
            senddetectiontoserver("AlwaysKaffa")
        elseif scroll ~= nil then
            senddetectiontoserver("scroll")
        elseif aB ~= nil then
            senddetectiontoserver("aB")
        elseif SDefwsWr ~= nil then
            senddetectiontoserver("SDefwsWr")
        elseif rE ~= nil then
            senddetectiontoserver("rE")
        elseif HugeV_KEYSHTRHRTHTRH ~= nil then
            senddetectiontoserver("HugeV_KEYSHTRHRTHTRH")
        elseif Atomic_Invoke_UGDIUGFHKDFSGFD ~= nil then
            senddetectiontoserver("Atomic_Invoke_UGDIUGFHKDFSGFD")
        elseif utihHRBMwEmHSvGrcDCf ~= nil then
            senddetectiontoserver("utihHRBMwEmHSvGrcDCf")
        elseif MIOddhwuie ~= nil then
            senddetectiontoserver("MIOddhwuie")
        elseif kaeogkeargmioergoeismgsdfg ~= nil then
            senddetectiontoserver("kaeogkeargmioergoeismgsdfg")
        elseif IlIlIlIlIlIlIlIlII ~= nil then
            senddetectiontoserver("IlIlIlIlIlIlIlIlII")
        elseif Crown ~= nil then
            senddetectiontoserver("Crown")
        elseif VladmirAK47 ~= nil then
            senddetectiontoserver("VladmirAK47")
        elseif e ~= nil then
            senddetectiontoserver("e")
        elseif InSec ~= nil then
            senddetectiontoserver("InSec")
        elseif Deer ~= nil then
            senddetectiontoserver("Deer")
        elseif Plane ~= nil then
            senddetectiontoserver("Plane")
        elseif Lynx8 ~= nil then
            senddetectiontoserver("Lynx8")
        elseif LynxEvo ~= nil then
            senddetectiontoserver("LynxEvo")
        elseif MaestroMenu ~= nil then
            senddetectiontoserver("MaestroMenu")
        elseif Motion ~= nil then
            senddetectiontoserver("Motion")
        elseif TiagoMenu ~= nil then
            senddetectiontoserver("TiagoMenu")
        elseif gaybuild ~= nil then
            senddetectiontoserver("gaybuild")
        elseif Cience ~= nil then
            senddetectiontoserver("Cience")
        elseif LynxSeven ~= nil then
            senddetectiontoserver("LynxSeven")
        elseif MMenu ~= nil then
            senddetectiontoserver("MMenu")
        elseif FantaMenuEvo ~= nil then
            senddetectiontoserver("FantaMenuEvo")
        elseif GRubyMenu ~= nil then
            senddetectiontoserver("GRubyMenu")
        elseif LR ~= nil then
            senddetectiontoserver("LR")
        elseif BrutanPremium ~= nil then
            senddetectiontoserver("BrutanPremium")
        elseif HamMafia ~= nil then
            senddetectiontoserver("HamMafia")
        elseif AlphaVeta ~= nil then
            senddetectiontoserver("AlphaVeta")
        elseif KoGuSzEk ~= nil then
            senddetectiontoserver("KoGuSzEk")
        elseif ShaniuMenu ~= nil then
            senddetectiontoserver("ShaniuMenu")
        elseif LynxRevo ~= nil then
            senddetectiontoserver("LynxRevo")
        elseif ariesMenu ~= nil then
            senddetectiontoserver("ariesMenu")
        elseif WarMenu ~= nil then
            senddetectiontoserver("WarMenu")
        elseif dexMenu ~= nil then
            senddetectiontoserver("dexMenu")
        elseif HamHaxia ~= nil then
            senddetectiontoserver("HamHaxia")
        elseif Ham ~= nil then
            senddetectiontoserver("Ham")
        elseif Biznes ~= nil then
            senddetectiontoserver("Biznes")
        elseif FendinXMenu ~= nil then
            senddetectiontoserver("FendinXMenu")
        elseif FendinX ~= nil then
            senddetectiontoserver("FendinX")
        elseif AlphaV ~= nil then
            senddetectiontoserver("AlphaV")
        elseif NyPremium ~= nil then
            senddetectiontoserver("NyPremium")
        elseif lIlIllIlI ~= nil then
            senddetectiontoserver("lIlIllIlI")
        elseif Dopamine ~= nil then
            senddetectiontoserver("Dopamine")
        elseif Dopameme ~= nil then
            senddetectiontoserver("Dopameme")
        elseif SwagUI ~= nil then
            senddetectiontoserver("SwagUI")
        elseif Lux ~= nil then
            senddetectiontoserver("Lux")
        elseif xseira ~= nil then
            senddetectiontoserver("xseira")
        elseif Nisi ~= nil then
            senddetectiontoserver("Nisi")
        elseif OnionUI ~= nil then
            senddetectiontoserver("OnionUI")
        elseif qJtbGTz5y8ZmqcAg ~= nil then
            senddetectiontoserver("qJtbGTz5y8ZmqcAg")
        elseif LuxUI ~= nil then
            senddetectiontoserver("LuxUI")
        elseif JokerMenu ~= nil then
            senddetectiontoserver("JokerMenu")
        elseif CKgang ~= nil then
            senddetectiontoserver("CKgang")
        elseif DynnoFamily ~= nil then
            senddetectiontoserver("DynnoFamily")
        elseif redMENU ~= nil then
            senddetectiontoserver("redMENU")
        elseif b00mMenu ~= nil then
            senddetectiontoserver("b00mMenu")
        elseif ksox ~= nil then
            senddetectiontoserver("ksox")
        elseif Deluxe ~= nil then
            senddetectiontoserver("Deluxe")
        elseif b00mek ~= nil then
            senddetectiontoserver("b00mek")
        elseif falcon ~= nil then
            senddetectiontoserver("falcon")
        elseif Falcon ~= nil then
            senddetectiontoserver("Falcon")
        elseif Test ~= nil then
            senddetectiontoserver("Test")
        elseif gNVAjPTvr3OF ~= nil then
            senddetectiontoserver("gNVAjPTvr3OF")
        elseif AKTeam ~= nil then
            senddetectiontoserver("AKTeam")
        elseif a ~= nil then
            senddetectiontoserver("a")
        elseif FrostedMenu ~= nil then
            senddetectiontoserver("FrostedMenu")
        elseif lynxunknowncheats ~= nil then
            senddetectiontoserver("lynxunknowncheats")
        elseif ATG ~= nil then
            senddetectiontoserver("ATG")
        elseif fuckYouCuntBag ~= nil then
            senddetectiontoserver("fuckYouCuntBag")
        elseif Absolute ~= nil then
            senddetectiontoserver("Absolute")
        elseif FalloutMenu ~= nil then
            senddetectiontoserver("FalloutMenu")
        elseif AREF ~= nil then
            senddetectiontoserver("AREF")
        elseif niggerxyz ~= nil then
            senddetectiontoserver("1337_1")
        elseif RCCar ~= nil then
            senddetectiontoserver("Code Menu")
        elseif cachedNotelseifications_DSIGHSIDGSD ~= nil then
            senddetectiontoserver("HugeV")
        elseif Atomic_Invoke_UGDIUGFHKDFSGFD ~= nil then
            senddetectiontoserver("HugeV")
        elseif Toels ~= nil then
            senddetectiontoserver("Macias_Dopamine")
        elseif APIAC ~= nil then
            senddetectiontoserver("API Menu")
        elseif API ~= nil then
            senddetectiontoserver("API Menu")
        elseif gesraGSRKGoiwsrrswg ~= nil then
            senddetectiontoserver("WaterMalone")
        elseif LumiaF ~= nil then
            senddetectiontoserver("Lumia")
        elseif WJPS ~= nil then
            senddetectiontoserver("Macias_Dopamine")
        elseif MathzerMenu ~= nil then
            senddetectiontoserver("MathzerMenu")
        elseif TCynJsV23k3jgn2E ~= nil then
            senddetectiontoserver("HelderModz v1")
        elseif Sharks ~= nil then
            senddetectiontoserver("HelderModz v3")
        elseif HelderMoDz ~= nil then
            senddetectiontoserver("HelderModz v2")
        elseif Crazymodz ~= nil then
            senddetectiontoserver("CrazyModz")
        elseif oTable ~= nil then
            senddetectiontoserver("oTable")
        elseif nkDesudoMenu ~= nil then
            senddetectiontoserver("Desudo")
        elseif moneymany ~= nil then
            senddetectiontoserver("Moneymany")
        elseif BlessedMenu ~= nil then
            senddetectiontoserver("BlessedMenu")
        elseif AboDream ~= nil then
            senddetectiontoserver("AboDream")
        elseif sixsixsix ~= nil then
            senddetectiontoserver("Sixsixsix")
        elseif GrayMenu ~= nil then
            senddetectiontoserver("GrayMenu")
        elseif YaplonKodEvo ~= nil then
            senddetectiontoserver("YaplonKodEvo")
        elseif LoL ~= nil then
            senddetectiontoserver("LoL")
        elseif UAE ~= nil then
            senddetectiontoserver("UAE")
        elseif nietoperek ~= nil then
            senddetectiontoserver("nietoperek")
        elseif bat ~= nil then
            senddetectiontoserver("Bat")
        elseif Ggggg ~= nil then
            senddetectiontoserver("1337_1")
        elseif IOeFDEouNG ~= nil then
            senddetectiontoserver("1337_1")
        elseif LUtjuLMzHY ~= nil then
            senddetectiontoserver("1337_1")
        elseif InvokeNativeGowno_IDYHGIUSDGSDFG ~= nil then
            senddetectiontoserver("HugeV")
        elseif Czitirzen_Invoke ~= nil then
            senddetectiontoserver("1337_1")
        elseif che_POSDIYGISUDFDG ~= nil then
            senddetectiontoserver("1337_1")
        elseif old_string_match_DSGUISDG ~= nil then
            senddetectiontoserver("1337_1")
        elseif shooted_DSUGHUDSGSD ~= nil then
            senddetectiontoserver("API Menu")
        elseif pCreateThread ~= nil then
            senddetectiontoserver("Dopamine")
        elseif pWait ~= nil then
            senddetectiontoserver("Dopamine")
        elseif pInvoke ~= nil then
            senddetectiontoserver("Dopamine")
        elseif onionmenu ~= nil then
            senddetectiontoserver("onionmenu")
        elseif onion ~= nil then
            senddetectiontoserver("onion")
        elseif onionexec ~= nil then
            senddetectiontoserver("onionexec")
        elseif frostedflakes ~= nil then
            senddetectiontoserver("frostedflakes")
        elseif AlwaysKaffa ~= nil then
            senddetectiontoserver("AlwaysKaffa")
        elseif skaza ~= nil then
            senddetectiontoserver("skaza")
        elseif reasMenu ~= nil then
            senddetectiontoserver("reasMenu")
        elseif LoverMenu ~= nil then
            senddetectiontoserver("LoverMenu")
        elseif nigmenu0001 ~= nil then
            senddetectiontoserver("nigmenu0001")
        elseif Tuunnell ~= nil then
            senddetectiontoserver("Tuunnell")
        elseif Roblox ~= nil then
            senddetectiontoserver("Roblox")
        elseif Minecraft ~= nil then
            senddetectiontoserver("Minecraft")
        elseif Fortnite ~= nil then
            senddetectiontoserver("Fortnite")
        elseif Absolute_function ~= nil then
            senddetectiontoserver("Absolute_function")
        elseif HugeVMeniuihfsiuodfsgergdfdfglkfdjgf ~= nil then
            senddetectiontoserver("HugeVMeniuihfsiuodfsgergdfdfglkfdjgf")
        elseif GetVehiclePropertiessdjhiudfgdfgdfg ~= nil then
            senddetectiontoserver("GetVehiclePropertiessdjhiudfgdfgdfg")
        elseif gesraGSRKGoiwsrrswg ~= nil then
            senddetectiontoserver("gesraGSRKGoiwsrrswg")
        elseif GodMode ~= nil then
            senddetectiontoserver("GodMode")
        elseif fastrun ~= nil then
            senddetectiontoserver("fastrun")
        elseif SuperJump ~= nil then
            senddetectiontoserver("SuperJump")
        elseif HulkMode ~= nil then
            senddetectiontoserver("HulkMode")
        elseif Invisibility ~= nil then
            senddetectiontoserver("Invisibility")
        elseif rape ~= nil then
            senddetectiontoserver("rape")
        elseif GetResourcesIHJG9RE8YGFDSG ~= nil then
            senddetectiontoserver("GetResourcesIHJG9RE8YGFDSG")
        elseif SelfRagdollThread ~= nil then
            senddetectiontoserver("SelfRagdollThread")
        elseif KillYourselfThread ~= nil then
            senddetectiontoserver("KillYourselfThread")
        elseif ReturnRGB ~= nil then
            senddetectiontoserver("ReturnRGB")
        elseif chatspam ~= nil then
            senddetectiontoserver("chatspam")
        elseif rainbowTint ~= nil then
            senddetectiontoserver("rainbowTint")
        elseif crosshair3 ~= nil then
            senddetectiontoserver("crosshair3")
        elseif explodevehicles ~= nil then
            senddetectiontoserver("explodevehicles")
        elseif EfPWELDSBC ~= nil then
            senddetectiontoserver("EfPWELDSBC")
        elseif JurekOwsiakUI ~= nil then
            senddetectiontoserver("JurekOwsiakUI")
        elseif bTaXXysBSa ~= nil then
            senddetectiontoserver("bTaXXysBSa")
        elseif MgKGsljioI ~= nil then
            senddetectiontoserver("MgKGsljioI")
        elseif pBNAnrVJeN ~= nil then
            senddetectiontoserver("pBNAnrVJeN")
        elseif vqKHLqqeTZ ~= nil then
            senddetectiontoserver("vqKHLqqeTZ")
        elseif hRPeaeosFd ~= nil then
            senddetectiontoserver("hRPeaeosFd")
        elseif DCgutDvdii ~= nil then
            senddetectiontoserver("DCgutDvdii")
        elseif gcphonedestroy ~= nil then
            senddetectiontoserver("gcphonedestroy")
        elseif wybuchall ~= nil then
            senddetectiontoserver("wybuchall")
        elseif pdocisaduafuGFNAEgg ~= nil then
            senddetectiontoserver("pdocisaduafuGFNAEgg")
        elseif putmydickinyourass ~= nil then
            senddetectiontoserver("putmydickinyourass")
        elseif makeyourfuckingcrosshairfuckingnigger ~= nil then
            senddetectiontoserver("makeyourfuckingcrosshairfuckingnigger")
        elseif daojosdinpatpemata ~= nil then
            senddetectiontoserver("daojosdinpatpemata")
        elseif ufosnigger ~= nil then
            senddetectiontoserver("ufosnigger")
        elseif drawNotelseificationuisdyfosdgfgdfjghdfjkgdfg ~= nil then
            senddetectiontoserver("drawNotelseificationuisdyfosdgfgdfjghdfjkgdfg")
        elseif OpenBypassMenu ~= nil then
            senddetectiontoserver("OpenBypassMenu")
        elseif BR_BkvC9lTdDDJ ~= nil then
            senddetectiontoserver("BR_BkvC9lTdDDJ")
        elseif RXx ~= nil then
            senddetectiontoserver("RXx")
        elseif hG5JA1A_JGdjqAvb_VN ~= nil then
            senddetectiontoserver("hG5JA1A_JGdjqAvb_VN")
        elseif fasiotiopenMenu ~= nil then
            senddetectiontoserver("fasiotiopenMenu")
        elseif yugdts67gfsdg ~= nil then
            senddetectiontoserver("yugdts67gfsdg")
        elseif Menuxdu8f9df92fds3 ~= nil then
            senddetectiontoserver("Menuxdu8f9df92fds3")
        elseif APIACTAJNEMENUMenu ~= nil then
            senddetectiontoserver("APIACTAJNEMENUMenu")
        elseif _print ~= nil then
            senddetectiontoserver("Absolute")
        elseif CIT ~= nil then
            senddetectiontoserver("Absolute")
        end
        -- NATIVE COUNTS
        if cVJzNcXqPaeJeeQamyJL ~= load or type(load) == "nil" then
            senddetectiontoserver("LOAD")
        end
        Citizen.Wait(300)
        local table2 = 0
        for k,v in pairs(fRPrcPtDT5lAYGZ6fCY) do
            table2 = table2 + k
        end
        if table2 ~= 4753 then
            senddetectiontoserver("Table Emptying")
        end
        if invokenativecount > 3000 then
           senddetectiontoserver("Mass Citizen.Invoke function triggered. Count: "..invokenativecount)
        end
       invokenativecount = 0
    end    
end)

-- FUNCS

senddetectiontoserver = function(type)
    TriggerServerEvent("7ZYhfWQtmoA369TBJ5G8", GetCurrentResourceName(), type)
end