gpio.mode(1, gpio.INPUT)
print("Attemp to run Script in 10 seconds...")
read5 = gpio.read(1)
print(read5)
wifi.setmode(wifi.STATION)
wifi.sta.config("Truong","12345678")
wifi.sta.connect()
tmr.delay(10000000)
if (read5==1) then
    
    print("Autorun aborted!")
else
    print("Running Script...")
    tmr.alarm(1, 1000, 1, function()
        if (wifi.sta.status() == 5) then
            print("ready")
            dofile("script.lua")
            tmr.stop(1)
        else
            print("Error code: "..wifi.sta.status())
        end
    end)
end
