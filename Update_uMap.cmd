@echo off
setlocal

cd /d "F:\Documents\Genealogie\MyMap\MyMap"

echo ==========================================
echo       Update der uMap-Daten
echo ==========================================
echo.

echo Pruefe Aenderungen...
git status --short

echo.
echo Fuege CSV-Dateien hinzu...

git add "Katholisch_Polen.csv"
git add "Evangelisch_Polen.csv"
git add "Standesämter lokalisiert.csv"

echo.
echo Pruefe, ob sich etwas geaendert hat...

git diff --cached --quiet

if %ERRORLEVEL% EQU 0 (
    echo.
    echo Keine Aenderungen gefunden.
    echo GitHub wurde nicht aktualisiert.
    echo.
    pause
    exit /b 0
)

echo.
echo Aenderungen gefunden.
echo.

git commit -m "Update uMap CSV data"

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo FEHLER beim Commit.
    echo.
    pause
    exit /b 1
)

echo.
echo Uebertrage Daten zu GitHub...
echo.

git push

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo FEHLER beim Hochladen zu GitHub.
    echo.
    pause
    exit /b 1
)

echo.
echo ==========================================
echo       Update erfolgreich abgeschlossen
echo ==========================================
echo.
echo uMap kann jetzt die aktualisierten Daten laden.
echo.

pause