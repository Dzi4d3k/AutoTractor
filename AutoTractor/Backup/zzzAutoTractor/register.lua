
AutoTractorRegister = {};
AutoTractorRegister.isLoaded = true;
AutoTractorRegister.g_currentModDirectory = g_currentModDirectory;

if SpecializationUtil.specializations["AutoTractor"] == nil then
	SpecializationUtil.registerSpecialization("AutoTractor", "AutoTractor", g_currentModDirectory.."AutoTractor.lua")
	AutoTractorRegister.isLoaded = false;
end;

function AutoTractorRegister:loadMap(name)	
  if not AutoTractorRegister.isLoaded then	
		AutoTractorRegister:add();
    AutoTractorRegister.isLoaded = true;
  end;
end;

function AutoTractorRegister:deleteMap()
  --AutoTractorRegister.isLoaded = false;
end;

function AutoTractorRegister:mouseEvent(posX, posY, isDown, isUp, button)
end;

function AutoTractorRegister:keyEvent(unicode, sym, modifier, isDown)
end;

function AutoTractorRegister:update(dt)
end;

function AutoTractorRegister:draw()
end;

function AutoTractorRegister:add()
	local searchTable = { "Autopilot", "AutoTractor" };	
	
	for k, v in pairs(VehicleTypeUtil.vehicleTypes) do
		local modName             = string.match(k, "([^.]+)");
		local AutoTractorRegister = true;
		local correctLocation     = false;
		
		for _, search in pairs(searchTable) do
			if SpecializationUtil.specializations[modName .. "." .. search] ~= nil then
				AutoTractorRegister = false;
				break;
			end;
		end;
		
		for i = 1, table.maxn(v.specializations) do
			local vs = v.specializations[i];
			if      vs ~= nil 
					and vs == SpecializationUtil.getSpecialization("aiTractor") then
				correctLocation = true;
				break;
			end;
		end;
		
		if AutoTractorRegister and correctLocation then
			table.insert(v.specializations, SpecializationUtil.getSpecialization("AutoTractor"));
		  print("  AutoTractor was inserted on " .. k);
		elseif correctLocation and not AutoTractorRegister then
			print("  Failed to inserting AutoTractor on " .. k);
		end;
	end;
	
	-- make l10n global 
	g_i18n.globalI18N.texts["AUTO_TRACTOR_START"]                = g_i18n:getText("AUTO_TRACTOR_START");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_STOP"]                 = g_i18n:getText("AUTO_TRACTOR_STOP");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_WORKWIDTH"]            = g_i18n:getText("AUTO_TRACTOR_WORKWIDTH");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_ACTIVESIDELEFT"]       = g_i18n:getText("AUTO_TRACTOR_ACTIVESIDELEFT");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_ACTIVESIDERIGHT"]      = g_i18n:getText("AUTO_TRACTOR_ACTIVESIDERIGHT");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_WAITMODE_ON"]              = g_i18n:getText("AUTO_TRACTOR_WAITMODE_ON");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_WAITMODE_OFF"]             = g_i18n:getText("AUTO_TRACTOR_WAITMODE_OFF");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_COLLISIONTRIGGERMODE_ON"]  = g_i18n:getText("AUTO_TRACTOR_COLLISIONTRIGGERMODE_ON");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_COLLISIONTRIGGERMODE_OFF"] = g_i18n:getText("AUTO_TRACTOR_COLLISIONTRIGGERMODE_OFF");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_TEXTHELPPANELOFF"]         = g_i18n:getText("AUTO_TRACTOR_TEXTHELPPANELOFF");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_TEXTHELPPANELON"]          = g_i18n:getText("AUTO_TRACTOR_TEXTHELPPANELON");
--g_i18n.globalI18N.texts["AUTO_TRACTOR_STARTSTOP"]                = g_i18n:getText("AUTO_TRACTOR_STARTSTOP");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_COLLISION_OTHER"]          = g_i18n:getText("AUTO_TRACTOR_COLLISION_OTHER");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_COLLISION_BACK"]           = g_i18n:getText("AUTO_TRACTOR_COLLISION_BACK");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_UTURN_ON"]                 = g_i18n:getText("AUTO_TRACTOR_UTURN_ON");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_UTURN_OFF"]                = g_i18n:getText("AUTO_TRACTOR_UTURN_OFF");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_REVERSE_ON"]               = g_i18n:getText("AUTO_TRACTOR_REVERSE_ON");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_REVERSE_OFF"]              = g_i18n:getText("AUTO_TRACTOR_REVERSE_OFF");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_WIDTH_OFFSET"]             = g_i18n:getText("AUTO_TRACTOR_WIDTH_OFFSET");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_TURN_OFFSET"]              = g_i18n:getText("AUTO_TRACTOR_TURN_OFFSET");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_ERROR"]                    = g_i18n:getText("AUTO_TRACTOR_ERROR");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_NEXTTURNSTAGE"]        = g_i18n:getText("AUTO_TRACTOR_NEXTTURNSTAGE");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_CP_ON"]                = g_i18n:getText("AUTO_TRACTOR_CP_ON");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_CP_OFF"]               = g_i18n:getText("AUTO_TRACTOR_CP_OFF");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_STEER"]                = g_i18n:getText("AUTO_TRACTOR_STEER");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_STEER_ON"]             = g_i18n:getText("AUTO_TRACTOR_STEER_ON");
	g_i18n.globalI18N.texts["AUTO_TRACTOR_STEER_OFF"]            = g_i18n:getText("AUTO_TRACTOR_STEER_OFF");
	
end;

addModEventListener(AutoTractorRegister);