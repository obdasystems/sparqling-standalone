:::::::::::::::::::::::::::::::::::
:: Sparqling Startup Script (WIN)
:::::::::::::::::::::::::::::::::::

:: Set SPARQLING location
SET HOME=%~dp0
SET JAR=sparqling-ws-1.0.0.jar

:: Set java options: log cofnigurations and file encoding
SET JAVA_OPTS=-Dlogback.configurationFile=%MONOLITH_HOME%logback.xml -Dfile.encoding=UTF-8

:: Launch MWS (Powered by Jetty) and Monolith
java -jar %JAVA_OPTS% ^
	-cp "%HOME%%JAR%" ^
	"%HOME%ui"
