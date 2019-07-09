@ECHO OFF & CLS
SETLOCAL DisableDelayedExpansion

SET "wais_file=%~1"
SET "wais_file_done=done.%~nx1"
SET "wais_folder=%~dp1entries.%~nx1"
SET "wais_line="
SET "wais_entry=0"
SET "wais_entries=0"

IF NOT EXIST "%wais_file%" ((ECHO Error: File "%wais_file%" does not exist!) & (GOTO end))
FOR /F %%a IN ('FINDSTR /B "[" "%wais_file%"') DO (SET /A "wais_entries+=1")
IF %wais_entries% EQU 0 ((ECHO Error: File "%wais_file%" does not contain entries!) & (GOTO end))
IF NOT EXIST "%wais_folder%" (MD "%wais_folder%") ELSE ((ECHO Error: Folder "%wais_folder%" already exists!) & (GOTO end))

FOR /F "usebackq tokens=* eol=" %%a IN ("%wais_file%") DO ((SET "wais_line=%%a") & (CALL :split))
REN "%wais_file%" "%wais_file_done%"

:end

ECHO.
ECHO Finished!
ECHO.
PAUSE
ENDLOCAL
GOTO :eof

:: --- Subroutines ---

:split

IF "%wais_line:~0,1%"=="[" ((SET /A "wais_entry+=1") & (CALL :output))
SETLOCAL EnableDelayedExpansion
IF "%wais_line:~0,1%"==";" (ECHO !wais_line! >>"%wais_folder%\preamble.txt") ELSE (ECHO !wais_line! >>"%wais_folder%\rule%wais_entry%.ini")
ENDLOCAL
GOTO :eof

:output

CLS
ECHO Processing the file "%wais_file%":
ECHO.
ECHO Entry #%wais_entry%/%wais_entries%
GOTO :eof
