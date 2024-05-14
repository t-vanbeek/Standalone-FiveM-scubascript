--[Config]--

DiveMinutes = 20

--[Code]--

divetimeS = DiveMinutes*60
scubaTog = false



RegisterCommand('dive', function()
    dive()
end, false)


function dive()
    if not scubaTog then
        scubaTog = true
            Citizen.Wait(5)
    
            SetPedDiesInWater(PlayerPedId(), false)
            Citizen.Wait(divetimeS*1000)

            scubaTog = false

            SetPedDiesInWater(PlayerPedId(), true)

        end
end