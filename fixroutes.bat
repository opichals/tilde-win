@echo off
rem verify the wifi is connected
for /F "tokens=1,2,3,4,5" %%A in ('"route print |grep "0\.0\.0\.0[ \t]*0\.0\.0\.0[ \t]*10.20""') DO (
  echo WiFi seems to be connected as 10.20.*.
  goto :haveWiFi
)
echo ERROR: WiFi does not seem to be connected as 10.*... 
echo Connect to the hpeguest WiFi and try again.
goto :eof


:haveWiFi
rem resolve 10.39.* gateway address as %%C
for /F "tokens=1,2,3,4,5" %%A in ('"route print |grep "0\.0\.0\.0[ \t]*0\.0\.0\.0[ \t]*10.39""') DO (
  echo Using intranet gateway %%C
  echo Deleting default intranet route to route internet traffic via WiFi.
  route delete 0.0.0.0 %%C
  echo Adding intranet route with a mask.
  route add 10.0.0.0 MASK 255.0.0.0 %%C
  route add 15.0.0.0 MASK 255.0.0.0 %%C
  route add 16.0.0.0 MASK 255.0.0.0 %%C
  echo Done.
  goto :eof
)
