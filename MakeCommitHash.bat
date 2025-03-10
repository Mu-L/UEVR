@echo off

IF EXIST "src/CommitHash.autogenerated" (
echo The file "src/CommitHash.autogenerated" already exists.
exit /b 0
)

FOR /F "tokens=*" %%g IN ('git rev-parse HEAD') DO (SET UEVR_COMMIT_HASH=%%g)

FOR /F "tokens=*" %%t IN ('git describe --tags --abbrev^=0') DO (SET UEVR_TAG=%%t)
IF "%UEVR_TAG%"=="" (SET UEVR_TAG=no_tag)

FOR /F "tokens=*" %%c IN ('git describe --tags --long') DO (
FOR /F "tokens=1,2 delims=-" %%a IN ("%%c") DO (
SET UEVR_TAG_LONG=%%a
SET UEVR_COMMITS_PAST_TAG=%%b
)
)

IF "%UEVR_COMMITS_PAST_TAG%"=="" (SET UEVR_COMMITS_PAST_TAG=0)

FOR /F "tokens=*" %%b IN ('git rev-parse --abbrev-ref HEAD') DO (SET UEVR_BRANCH=%%b)

FOR /F "tokens=*" %%n IN ('git rev-list --count HEAD') DO (SET UEVR_TOTAL_COMMITS=%%n)
IF "%UEVR_TOTAL_COMMITS%"=="" (SET UEVR_TOTAL_COMMITS=0)

FOR /F "tokens=2 delims==" %%a IN ('wmic OS get localdatetime /value') DO (
SET datetime=%%a
)

SET year=%datetime:~0,4%
SET month=%datetime:~4,2%
SET day=%datetime:~6,2%
SET hour=%datetime:~8,2%
SET minute=%datetime:~10,2%

echo #pragma once > src/CommitHash.autogenerated
echo #define UEVR_COMMIT_HASH "%UEVR_COMMIT_HASH%" >> src/CommitHash.autogenerated
echo #define UEVR_TAG "%UEVR_TAG%" >> src/CommitHash.autogenerated
echo #define UEVR_TAG_LONG "%UEVR_TAG_LONG%" >> src/CommitHash.autogenerated
echo #define UEVR_COMMITS_PAST_TAG %UEVR_COMMITS_PAST_TAG% >> src/CommitHash.autogenerated
echo #define UEVR_BRANCH "%UEVR_BRANCH%" >> src/CommitHash.autogenerated
echo #define UEVR_TOTAL_COMMITS %UEVR_TOTAL_COMMITS% >> src/CommitHash.autogenerated
echo #define UEVR_BUILD_DATE "%day%.%month%.%year%" >> src/CommitHash.autogenerated
echo #define UEVR_BUILD_TIME "%hour%:%minute%" >> src/CommitHash.autogenerated