@echo off
@RD /S /Q "out"
mkdir out
title Multiversion Resourcepack - FathfulHD 512
set VER1=1.12
set VER2=1.17
set VER3=1.18

set packdir=%cd%\out\
set PATH=%PATH%;"C:\Program Files\7-Zip\"
echo ========================================
echo   Multi-version Resourcepack script
echo   Targeting:
echo       A: %VER1%
echo       B: %VER2%
echo       C: %VER3%
echo ========================================
echo.
timeout /t 1 >nul

cd HD-x512
echo Zipping directory...
7z a %packdir%\FaithfulHDx512_%VER1%.zip >nul

cd %packdir%
echo Converting...
java -jar ../ResourcePackConverter.jar --from %VER1% --to %VER2%

@RD /S /Q "%packdir%\FaithfulHDx512_%VER1%_converted">nul
rename "%packdir%\FaithfulHDx512_%VER1%_converted.zip" FaithfulHDx512_%VER2%.zip.rename >nul


cd %packdir%
echo Converting...
java -jar ../ResourcePackConverter.jar --from %VER1% --to %VER3%

@RD /S /Q "%packdir%\FaithfulHDx512_%VER1%_converted">nul
rename "%packdir%\FaithfulHDx512_%VER1%_converted.zip" FaithfulHDx512_%VER3%.zip >nul
rename "%packdir%\FaithfulHDx512_%VER2%.zip.rename" FaithfulHDx512_%VER2%.zip >nul

echo.
echo Build Complete, you may now exit.
pause>nul