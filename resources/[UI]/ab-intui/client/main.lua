RegisterNetEvent('ab-ui:ShowUI')
AddEventHandler('ab-ui:ShowUI', function(action, text)
	SendNUIMessage({
		action = action,
		text = text,
	})
end)

RegisterNetEvent('ab-ui:HideUI')
AddEventHandler('ab-ui:HideUI', function()
	SendNUIMessage({
		action = 'hide'
	})
end)

