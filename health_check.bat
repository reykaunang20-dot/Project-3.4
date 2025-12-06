
@echo off
:: Perbaiki format tanggal agar tidak ada karakter slash
for /f "tokens=1-3 delims=/" %%a in ("%date%") do (
    set tahun=%%c
    set bulan=%%b
    set hari=%%a
)
set file=laporan_kesehatan_sistem_%tahun%%bulan%%hari%.txt

echo ============================================= > %file%
echo HEALTH CHECK - %date% %time% >> %file%
echo ============================================= >> %file%
echo. >> %file%

echo [1] INFORMASI SISTEM >> %file%
systeminfo >> %file%
echo. >> %file%

echo [2] CEK DISK >> %file%
chkdsk C: >> %file%
echo. >> %file%

echo [3] MONITOR PROSES >> %file%
tasklist >> %file%
echo. >> %file%

echo [4] ANALISIS >> %file%
echo === ANALISIS PROSES BERDASARKAN RAM === >> "%file%"
tasklist /FI "MEMUSAGE gt 10000" >> "%file%"
echo. >> "%file%"

echo ----------------------------------------- >> %file%
echo HEALTH CHECK SELESAI >> %file%

echo Laporan selesai di buat dengan nama: %file%
pause
