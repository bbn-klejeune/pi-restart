Echo off
CLS & Color 9B

Echo.
Echo.   Restart Station Pi via SSH
Echo.
Echo.   Updated 04 April 2025 - Kyle Lejeune
Echo.
Echo.
Echo.               How would you like to connect to the Pi?
Echo.               ------------------------------------------
Echo.                 1. Enter Station Call Letters
Echo.                 2. Enter IP Address manually
Echo.                 3. Exit
Echo.
Set /p "Selection=.               :  "
CLS

IF "%Selection%" == ""  exit
IF "%Selection%" == "1" goto stationCallLetters
IF "%Selection%" == "2" goto IPaddress
IF "%Selection%" == "3" exit

:stationCallLetters
Echo.
Echo.
Echo.
Echo.               Which Pi would you like to reboot? (Default: ID Pi)
Echo                ------------------------------------------------------
Echo.                 1. ID PI
Echo.                 2. Music PI
Echo.                 NOTE: Enter port number to set a custom port
Echo.
Echo.
Set /p "Pi=.               :"
CLS
Set "Port=0"
IF "%Pi%" == ""  Set "Port=22"
IF "%Pi%" == "1" Set "Port=22248"
IF "%Pi%" == "2" Set "Port=22249"
IF "%Port%" == "0" Set "Port=%Pi%"
Echo.
Echo.
Echo.
Echo.
Set /p "Station= Please enter the station call letters:"
Echo.
Echo.
ssh pi@%Station%.dyndns.org -p %Port% "sudo reboot now"
Echo.
Echo.
Echo.
Echo.

:IPaddress
Echo.
Echo.
Echo.
Echo.              Which Pi would you like to reboot? (Default: ID Pi)
Echo               ----------------------------------------------------------
Echo.                 1. ID PI
Echo.                 2. Music PI
Echo.                 NOTE: Enter port number to set a custom port
Echo.
Set /p "Pi=.               :"
CLS
Set "Port=0"
IF "%Pi%" == ""  Set "Port=22"
IF "%Pi%" == "1" Set "Port=22248"
IF "%Pi%" == "2" Set "Port=22249"
IF "%Port%" == "0" Set "Port=%Pi%"
ELSE Set "Port=%Pi%"
Echo.
Echo.
Echo.
Echo.
Set /p "Station= Please enter the station IP Address:"
Echo.
Echo.
ssh pi@%Station% -p %Port% "sudo reboot now"
Echo.
Echo.
Echo.
Echo.