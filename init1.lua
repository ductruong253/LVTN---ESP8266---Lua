--init.lua
gpio.mode(5, gpio.INPUT)
wifi.setmode(wifi.STATION)
wifi.sta.config("Truong","12345678")
wifi.sta.connect()
tmr.alarm(1, 1000, 1, function()
if wifi.sta.getip()== nil then
    print("Waiting for IP...")
else
    tmr.stop(1)
    print("Your IP is "..wifi.sta.getip())
    if (gpio.read(5)==1) then
        dofile("script2.lua")
    end
end
end)
