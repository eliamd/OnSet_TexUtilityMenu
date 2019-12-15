AddRemoteEvent("caissemenu",function(player, model)
	if (model == nil) then
		return AddPlayerChat(player, "Usage: /v <model>")
	end

	model = tonumber(model)

	if (model < 1 or model > 25) then
		return AddPlayerChat(player, "Vehicle model "..model.." does not exist.")
	end

	local x, y, z = GetPlayerLocation(player)
	local h = GetPlayerHeading(player)

	local vehicle = CreateVehicle(model, x, y, z, h)	
	if (vehicle == false) then
		return AddPlayerChat(player, "Failed to spawn your vehicle")
	end

	SetVehicleLicensePlate(vehicle, "ONSET")
	AttachVehicleNitro(vehicle, true)

	if (model == 8) then
		-- Set Ambulance blue color and license plate text
		SetVehicleColor(vehicle, RGB(0.0, 60.0, 240.0))
		SetVehicleLicensePlate(vehicle, "EMS-02")
	end

    -- Set us in the driver seat
	SetPlayerInVehicle(player, vehicle)

	AddPlayerChat(player, "Vehicle spawned! (New ID: "..vehicle..")")
end)

AddRemoteEvent("OnKeyPressRP",function(player)

   local voiture = GetPlayerVehicle(player)
   local x, y, z = GetPlayerLocation(player)

   if (voiture == 0 ) then
	AddPlayerChat(player, "Vous n'etes pas dans un vehicule !")
   else
   SetVehicleHealth(voiture, 5000)
   SetVehicleLocation(voiture, x, y, z + 150)
   SetVehicleRotation(voiture, 0, 0, 0)
   StartVehicleEngine(voiture)
   SetVehicleDamage(voiture, 1, 0)
   SetVehicleDamage(voiture, 2, 0)
   SetVehicleDamage(voiture, 3, 0)
   SetVehicleDamage(voiture, 4, 0)
   SetVehicleDamage(voiture, 5, 0)
   SetVehicleDamage(voiture, 6, 0)
   SetVehicleDamage(voiture, 7, 0)
   SetVehicleDamage(voiture, 8, 0)   
   AddPlayerChat(player, "Vehicule réparé et débloqué !")  
   end
end)

AddRemoteEvent("skinmenu",function(player, clothing)
	if (clothing == nil) then
		return AddPlayerChat(player, "Utilité / model < id > .") 
	end
	clothing = tonumber(clothing) 
		if (clothing < 1 or clothing > 25) then
	return AddPlayerChat(player, "Vous devez choisir un chiffre entre 1 et 25 !") 
	end
CallRemoteEvent(player, "modelmodif", player, clothing) end)



AddRemoteEvent("headsizemenu",function(player, size)
	size = tonumber(size) 
	if (size < 1 or size > 6) then
	AddPlayerChat(player, "non")
	else
	SetPlayerHeadSize(player, size)
	end	
end)

function viremenudemerde(player)
	CallRemoteEvent(player, "ToggleMapEditorUI")
end
AddEvent("OnPlayerJoin", viremenudemerde )


AddRemoteEvent("armemenu",function(player, weapon)
	if (weapon == nil) then
		return AddPlayerChat(player, "Usage: /w <weapon> <slot> <ammo>")
	end

	SetPlayerWeapon(player, weapon, 500, true, 1, true)
end)


AddRemoteEvent("centviemenu",function(player)
	SetPlayerHealth(player, 100)
end)

AddRemoteEvent("centarmuremenu",function(player)
	SetPlayerArmor(player, 100)
end)