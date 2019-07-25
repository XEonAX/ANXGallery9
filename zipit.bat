for /f "delims== tokens=1,2" %%G in (VERSION) do set anx%%G=%%H
echo %anxversion%
xcopy /s /y .\out\ANXGallery.apk .\src\ANXGalleryUnity\system\priv-app\ANXGallery

del .\out\ANXGalleryUnity.zip
del .\out\ANXGalleryUnity_*.zip

"C:\Program Files\7-Zip\7z.exe" a -tzip .\out\ANXGalleryUnity.zip .\src\ANXGalleryUnity\*
copy .\out\ANXGalleryUnity.zip /B .\out\ANXGalleryUnity_%anxversion%.zip


REM "C:\Program Files\7-Zip\7z.exe" a -tzip .\out\Arnob48MPFix.zip .\src\Arnob48MPFix\*
REM copy .\out\Arnob48MPFix.zip /B .\out\Arnob48MPFix_%anxversion%.zip

REM "C:\Program Files\7-Zip\7z.exe" a -tzip .\out\Dyneteve48MPFix.zip .\src\Dyneteve48MPFix\*
REM copy .\out\Dyneteve48MPFix.zip /B .\out\Dyneteve48MPFix_%anxversion%.zip

REM "C:\Program Files\7-Zip\7z.exe" a -tzip .\out\KubilWhyredyFix.zip .\src\KubilWhyredyFix\*
REM copy .\out\KubilWhyredyFix.zip /B .\out\KubilWhyredyFix_%anxversion%.zip

adb push .\out\ANXGalleryUnity.zip  /sdcard/zips

