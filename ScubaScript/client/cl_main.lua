--[Config]--

DiveMinutes = 20

--[Code]--

divetimeS = DiveMinutes*60
scubaTog = false
local DivingTime = divetimeS


RegisterCommand('dive', function()
    dive()
end, false)


function dive()
    if not scubaTog then
        scubaTog = true        
        Citizen.Wait(5)

        SetPedDiesInWater(PlayerPedId(), false)
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
                    args = {"ScubaScript", "~b~OxygenTank ~w~Running On ~r~Empty! ~y~Surface Now!"}
                })
                DivingTime = (DivingTime - 1)
            elseif (DivingTime == 1) then
            DivingTime = (DivingTime - 1)
            scubaTog = false
        
            SetPedDiesInWater(PlayerPedId(), true)
            TriggerEvent('chat:addMessage', {
                color = { 224, 96, 4 },
                multiline = true,
                args = {"ScubaScript", "~b~OxygenTank ~r~Empty! ~o~Change ~d~Tank!"}
            })
            else
                DivingTime = (DivingTime - 1)
            end
        end
    end
end