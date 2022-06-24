AddRemoteEvent("modelmodif",function(player,clothing)
	SetPlayerClothingPreset(player, clothing)
end)

function f3f4menu(key)
	if key == 'F3' then
		local Dialog = ImportPackage("dialogui")

		local f3 = Dialog.create("MENU ACTIONS", nil, "Réparer & débloquer un véhicule", "Taille de la tete", "100 de vie","100 de armure", "Fermer	")
		
		Dialog.show(f3)
		
		AddEvent("OnDialogSubmit", function(dialog, button, firstName, lastName, gender)
		  if dialog ~= f3 then
			return
		  end
		  if button == 1 then
			CallRemoteEvent("OnKeyPressRP")
		end
		  if button == 2 then
			local f32 = Dialog.create("Menu Tete", nil, "Confirmer")
			Dialog.addTextInput(f32, 1, "Taille de la tete :")
			Dialog.show(f32)
			AddEvent("OnDialogSubmit", function(dialog, button, size, lastName, gender)
				if dialog ~= f32 then
				  return
				end
				CallRemoteEvent("headsizemenu", size)
			  end)		end
		  if button == 3 then
			CallRemoteEvent("centviemenu")
		end
		if button == 4 then
			CallRemoteEvent("centarmuremenu")
		end
		end)
	end
	if key == 'F4' then
		local Dialog = ImportPackage("dialogui")

		local f4 = Dialog.create("MENU SPAWN", nil, "Voitures", "Armess", "Skin","Fermer")
		
		Dialog.show(f4)
		
		AddEvent("OnDialogSubmit", function(dialog, button, firstName, lastName, gender)
		  if dialog ~= f4 then
			return
		  end
		  if button == 1 then
			local f4v = Dialog.create("Menu Voitures", nil, "Confirmer")
			Dialog.addTextInput(f4v, 1, "Model de la voiture:")
			Dialog.show(f4v)
			AddEvent("OnDialogSubmit", function(dialog, button, model, lastName, gender)
				if dialog ~= f4v then
				  return
				end
				CallRemoteEvent("caissemenu", model)
			  end)
		end
		  if button == 2 then
			local f4a = Dialog.create("Menu Amres", nil, "Confirmer")
			Dialog.addTextInput(f4a, 1, "Model de l'arme:")
			Dialog.show(f4a)
			AddEvent("OnDialogSubmit", function(dialog, button, weapon, lastName, gender)
				if dialog ~= f4a then
				  return
				end
				CallRemoteEvent("armemenu", weapon)
			  end)		  end
		  if button == 3 then
			local f4s = Dialog.create("Menu Skin", nil, "Confirmer")
			Dialog.addTextInput(f4s, 1, "Model du skinn:")
			Dialog.show(f4s)
			AddEvent("OnDialogSubmit", function(dialog, button, skin, lastName, gender)
				if dialog ~= f4s then
				  return
				end
				CallRemoteEvent("skinmenu", skin)
			  end)		  end
		end)
	end

end
AddEvent("OnKeyPress", f3f4menu )




