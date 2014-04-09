@echo off
rem -------------------------------------------------------------------------
rem twiddle script for Windows
rem -------------------------------------------------------------------------
rem
rem A script for running twiddle for the JBoss

rem $Id$

@if not "%ECHO%" == ""  echo %ECHO%
@if "%OS%" == "Windows_NT" setlocal

if "%OS%" == "Windows_NT" (
  set "DIRNAME=%~dp0%"
) else (
  set DIRNAME=.\
)

pushd "%DIRNAME%.."
set "RESOLVED_TWIDDLE_HOME=%CD%"
popd

if "x%TWIDDLE_HOME%" == "x" (
  set "TWIDDLE_HOME=%RESOLVED_TWIDDLE_HOME%"
)

pushd "%TWIDDLE_HOME%"
set "SANITIZED_TWIDDLE_HOME=%CD%"
popd

if "%RESOLVED_TWIDDLE_HOME%" NEQ "%SANITIZED_TWIDDLE_HOME%" (
    echo WARNING TWIDDLE_HOME may be pointing to a different installation - unpredictable results may occur.
)

rem Setup %JAVA_HOME%
if "x%JAVA_HOME%" == "x" (
  set  JAVA=java
  echo JAVA_HOME is not set. Unexpected results may occur.
  echo Set JAVA_HOME to the directory of your local JDK to avoid this message.
  goto END
) else (
  set "JAVA=%JAVA_HOME%\bin\java"
)

rem Setup %JBOSS_HOME%
if "x%JBOSS_HOME%" == "x" (
  echo JBOSS_HOME is not set. Unable to locate the jars needed to run twiddle.
  goto END
)

rem Set default module root paths
rem JBoss EAP 6.2 -----------------------------------------
if "x%JBOSS_MODULEPATH%" == "x" (
  set  "JBOSS_MODULEPATH=%JBOSS_HOME%\modules\system\layers\base"
)


rem Setup The Classpath
rem JBoss EAP 6.2 -----------------------------------------
set "CLASSPATH=%TWIDDLE_HOME%\bin\twiddle.jar"
set "CLASSPATH=%CLASSPATH%;%TWIDDLE_HOME%\lib\jbossall-client.jar"

call :SearchForJars "%JBOSS_MODULEPATH%\org\jboss\remoting-jmx\main"
call :SearchForJars "%JBOSS_MODULEPATH%\org\jboss\remoting3\main"
call :SearchForJars "%JBOSS_MODULEPATH%\org\jboss\logging\main"
call :SearchForJars "%JBOSS_MODULEPATH%\org\jboss\xnio\main"
call :SearchForJars "%JBOSS_MODULEPATH%\org\jboss\xnio\nio\main"
call :SearchForJars "%JBOSS_MODULEPATH%\org\jboss\sasl\main"
call :SearchForJars "%JBOSS_MODULEPATH%\org\jboss\marshalling\main"
call :SearchForJars "%JBOSS_MODULEPATH%\org\jboss\marshalling\river\main"
call :SearchForJars "%JBOSS_MODULEPATH%\org\jboss\as\cli\main"
call :SearchForJars "%JBOSS_MODULEPATH%\org\jboss\staxmapper\main"
call :SearchForJars "%JBOSS_MODULEPATH%\org\jboss\as\protocol\main"
call :SearchForJars "%JBOSS_MODULEPATH%\org\jboss\dmr\main"
call :SearchForJars "%JBOSS_MODULEPATH%\org\jboss\as\controller-client\main"
call :SearchForJars "%JBOSS_MODULEPATH%\org\jboss\threads\main"

rem echo %CLASSPATH%

rem Run Twiddle

"%JAVA%" %JAVA_OPTS% ^
	-classpath "%CLASSPATH%" ^
    org.jboss.console.twiddle.Twiddle ^
     %*


rem ------------------------------------------------------------------------

:END
goto :EOF

:SearchForJars
pushd %1
for %%j in (*.jar) do call :ClasspathAdd %%j
popd
goto :EOF

:ClasspathAdd
set "CLASSPATH=%CLASSPATH%;%CD%\%1"
goto :EOF

:EOF

