// Get Config items

import {Config} from "../shared/config";



// Math

const DiveMinutes = Config.Minutes;

const DiveSeconds = (DiveMinutes*60);

let DiveTog = false;

let DiveTime = DiveSeconds;

// Register Commands

RegisterCommand('O2', (source: number, args: string[], raw: string[]) => {
    
        DiveTog = true
        Wait(10);
        emit('chat:addMessage', {
            color: [ 224, 96, 4],
            args: ["~b~O2 Tank ~g~enabled"]
        });
        Diving(DiveTog);
    }, false
);

// Run Funtion if Toggle has been run

function Diving(DiveTog:Boolean) {
    if (DiveTog) {
        Wait(5);

        SetPedDiesInWater(PlayerPedId(), false);
        while (DiveTime != 0) {
            Wait(1000)
            if (DiveTime == 300) {
                emit('chat:addMessage', {
                color: [ 224, 96, 4],
                args: ["~b~O2 Tank ~o~ Running out of Air ~w~ | ~r~5M Remaining! ~h~RETURN TO SURFACE"]
                });
                DiveTime = (DiveTime - 1);
            }else if (DiveTime == 120) {
                emit('chat:addMessage', {
                    color: [ 224, 96, 4],
                    args: ["~b~O2 Tank ~o~ Running out of Air ~w~ | ~r~2M Remaining! ~h~RETURN TO SURFACE NOW!!"]
                    });
                    DiveTime = (DiveTime - 1);
            }else if (DiveTime == 60) {
                emit('chat:addMessage', {
                    color: [ 224, 96, 4],
                    args: ["~b~O2 Tank ~o~ Running out of Air ~w~ | ~r~1M Remaining! ~h~RETURN TO SURFACE FAST!!!"]
                    });
                    DiveTime = (DiveTime - 1);
            }else if (DiveTime == 30) {
                emit('chat:addMessage', {
                    color: [ 224, 96, 4],
                    args: ["~b~O2 Tank ~o~ Running out of Air ~w~ | ~r~30s Remaining! ~h~RETURN TO SURFACE IMMEDIATLY!!"]
                    });
                    DiveTime = (DiveTime - 1);
            }else if (DiveTime == 1) {
                emit('chat:addMessage', {
                    color: [ 224, 96, 4],
                    args: ["~b~O2 Tank ~o~ Running out of Air ~w~ | ~r~0s Remaining!"]
                    });
                    DiveTime = (DiveTime - 1);
                SetPedDiesInWater(PlayerPedId(), true)
                    DiveTog = false;
            }else {
                DiveTime = (DiveTime - 1);
            }
        }
    }
};
