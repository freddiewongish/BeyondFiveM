--script by devilkkw
local maxSpeed= 120.0
local minSpeed= 0.0
local info ="nope"


function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		  if IsControlPressed(1, 217)then
		    local pos = GetEntityCoords(GetPlayerPed(-1))
			 local carM = GetClosestVehicle(pos['x'], pos['y'], pos['z'], 10.0,0,70)
			 if carM ~=nil then
			      local plate=GetVehicleNumberPlateText(carM)
			      local herSpeedKm= GetEntitySpeed(carM)*3.6
			      local herSpeedMph= GetEntitySpeed(carM)*2.236936

			 if herSpeedKm > minSpeed then

			    if herSpeedKm < maxSpeed then

				  info = string.format("~y~Plate~w~: %s ~y~Km/h~w~: %s ~y~Mph~w~: %s",plate,math.ceil(herSpeedKm),math.ceil(herSpeedMph) )
				 else

				  info = string.format("~y~Plate~w~: %s ~y~Km/h~w~: %s ~y~Mph~w~: %s",plate,math.ceil(herSpeedKm),math.ceil(herSpeedMph) )

				end


                 drawTxt(0.55,0.5,0.700,0.500, 0.40, info, 255,255,255,255)

			 end
			 end

	   end
	 end
end)
