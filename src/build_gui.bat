@echo off
REM Requires a JDK 21+ (javah was removed in JDK 10; javac -h generates JNI headers).
REM Set JAVA_HOME to your JDK, e.g. C:\Program Files\Eclipse Adoptium\jdk-21...
if "%JAVA_HOME%"=="" (
  echo JAVA_HOME is not set
  exit /b 1
)

cd gui\FTAGUI

"%JAVA_HOME%\bin\javac" --release 21 -h . *.java || exit /b 1

cd ..

"%JAVA_HOME%\bin\jar" -cvf FTAGUI.jar FTAGUI\*.class

cd images

"%JAVA_HOME%\bin\jar" -cvf ..\images.jar *.gif
