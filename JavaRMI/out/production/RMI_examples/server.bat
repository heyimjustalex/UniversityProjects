::The IP address of this host
SET myIP=192.168.0.10

::The server's codebase URL and port

SET HTTPserverIP=%myIP%
SET HTTPserverPort=80


::Logging activity of default RMIClassLoader provider
::SET LOG=-Dsun.rmi.loader.logLevel=SILENT
SET LOG=-Dsun.rmi.loader.logLevel=BRIEF


::Delete all existing .class files
del /S client\*.class
del /S server\*.class
del /S common\*.class



::Start the RMI registry

@echo.

@echo RMIregistry cannot have a CLASSPATH to the bytecode of the remote object
cd server
start rmiregistry -J-Djava.rmi.server.useCodebaseOnly=false -J-Djava.rmi.server.logCalls=true -J%LOG%
cd ..


::Compile the server-side code
javac server/ComputeEngine.java


::Make the server-side bytecode available via an HTTP server
::We assume that an HTTP server is running on the same host as the server app 
start /B hfs.exe common

@echo Wait until the HTTP server is ready before starting ComputeEngine!
@echo.
@pause

::Run the server app
java -Djava.rmi.server.codebase=http://%HTTPserverIP%:%HTTPserverPort%/ -Djava.rmi.server.hostname=%myIP% -Djava.security.policy=java.policy -Djava.security.manager=allow -Djava.rmi.server.useCodebaseOnly=false %LOG% server.ComputeEngine