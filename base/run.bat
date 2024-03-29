:::::::::::::::::::::::::::::::::::
:: Sparqling Startup Script (WIN)
:::::::::::::::::::::::::::::::::::

:: Set SPARQLING location
SET HOME=%~dp0
SET JAR=sparqling-ws-1.0.0.jar

:: Set java options: log cofnigurations and file encoding
SET JAVA_OPTS=-Dlogback.configurationFile=%HOME%logback.xml -Dfile.encoding=UTF-8

:: Launch SPARQLING (Powered by Jetty)
START "" javaw %JAVA_OPTS% ^
	-jar "%HOME%%JAR%" ^
	"%HOME%ui"
