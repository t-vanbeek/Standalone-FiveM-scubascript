local DiveGearEnabled = N_0xfec9a3b1820f3331(GetPlayerPed())

local DivingSeconds = BottleTime*60
local scubaToggle = false
local DivingTime = DivingSeconds


RegisterCommand('dive', function()
    Dive()
end, false)
RegisterKeyMapping('dive', "Enables O2Bottle", 'keyboard', 'F11')

RegisterCommand('+gearlight', function()
    Light()
end, false)
RegisterKeyMapping('+gearlight', "Enables ScubaLight", 'keyboard', 'F12')

function Dive()
    if not scubaToggle then
        scubaToggle = true
        Citizen.Wait(5)

        SetEnableScuba(PlayerPedId(), true)
        SetPedDiesInWater(PlayerPedId(), false)
        SetPedScubaGearVariation(PlayerPedId())

        TriggerEvent('chat:addMessage', {
            color = { 224, 96, 4 },
            multiline = true,
            args = {"ScubaScript", "~b~OxygenTank ~g~Activated!"}
        })

        while (DivingTime ~= 0) do
            Citizen.Wait(1000)
            if (DivingTime == 120) then
                TriggerEvent('chat:addMessage', {
                    color = { 224, 96, 4 },
                    multiline = true,
                    args = {"ScubaScript", "~b~OxygenTank ~w~has ~r~2 minutes left~w~! ~y~Surface Now!"}
                })
                DivingTime = (DivingTime - 1)
            elseif (DivingTime == 1) then
                DivingTime = (DivingTime - 1)
                scubaToggle = false
                SetEnableScuba(PlayerPedId(), false)
                SetPedDiesInWater(PlayerPedId(), true)
                ClearPedScubaGearVariation(PlayerPedId())
                TriggerEvent('chat:addMessage', {
                    color = { 224, 96, 4 },
                    multiline = true,
                    args = {"ScubaScript", "~b~OxygenTank ~r~Empty!"}
                })
            else
                DivingTime = (DivingTime - 1)
            end
        end
    end
end

function Light()
    if not gearLight then
        gearLight = true
        SetEnableScubaGearLight(PlayerPedId(), false)
        TriggerEvent('chat:addMessage', {
            color = { 224, 96, 4 },
            multiline = true,
            args = {"ScubaScript", "~r~Light Deactivated~w~!"}
        })
    else
        gearLight = false
        SetEnableScubaGearLight(PlayerPedId(), true)
        TriggerEvent('chat:addMessage', {
            color = { 224, 96, 4 },
            multiline = true,
            args = {"ScubaScript", "~g~Light Activated~w~!"}
        })
    end
end