set executable=.\modules\openapi-generator-cli\target\openapi-generator-cli.jar

If Not Exist %executable% (
  mvn clean package
)

REM set JAVA_OPTS=%JAVA_OPTS% -Xmx1024M
set ags=generate -t modules\openapi-generator\src\main\resources\Java\libraries\okhttp-gson -i modules\openapi-generator\src\test\resources\2_0\petstore-with-fake-endpoints-models-for-testing.yaml -l java -c bin\java-petstore-okhttp-gson.json -o samples\client\petstore\java\okhttp-gson -DhideGenerationTimestamp=true

java %JAVA_OPTS% -jar %executable% %ags%
