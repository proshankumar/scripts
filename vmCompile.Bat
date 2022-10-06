:: code to compile, run and capture results from linux machine over ssh.
:: the script copies the code folder from windows machine to linux vm through ssh over keys
:: the code is compiled, executed and the results are 
:: entery of set of parameters. do not put empty spaces between = and the start charecter.
:: code from the local folder \src is copied into the linux. the program is executed and then 
:: server data

set serverAddress= <add server address>
set port= <add the port number>
:: user id 
set user= <user id >
set setCompileScript = <script to run on the linux machine>
:: set the code compilation path at destination
set codePath=    /home/master/devEnv
:: set the local code path in the windows machine.
set localCodePath= C:\other_drive\research\jad\roshan\cppLearn\ews007\string_test_2\src

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


:: code to copy the local foldes onto vm
scp -r -P %port% %localCodePath%  %user%@%serverAddress%:%codePath%
::scp -r -P 3022 %localCodePath%\ master@127.0.0.1:%codePath%

:: compile based on the make file on the windows machine.
ssh -p %port% %user%@%serverAddress% < %localCodePath%\%setCompileScript%

:: copy the results file from the vm back to real machine.
scp -P %port% %user%@%serverAddress%:%codePath%/src/log.txt log.txt

:: copy the results file from the vm back to real machine.
scp -P %port% %user%@%serverAddress%:%codePath%/src/compile.txt compile.txt
