@echo off
REM *** Batch process LAS files with a PIPELINE - Print LAS file statistics ***
echo(
setlocal enabledelayedexpansion
REM *** Set directories ***
set script_dir=C:\Users\Darren\Documents\PDAL
set indir=%CD%
set tempdir=%CD%\temp
mkdir temp
set statfile=%CD%\STATS_All_Tiles.txt
echo Tile FirstReturn TotalReturns Default Ground LowPoint Keypoint HighNoise > !statfile!
REM *** Activate Command Prompt and PDAL ***
call C:\Anaconda3\Scripts\activate.bat
call conda activate lidar
REM *** Specify the pipeline to run ***
for %%f in (%indir%\*.las) do (
	set outname=%tempdir%\%%~nf_stats.txt
	echo(
	echo Reading %%f
	echo Writing !outname!
	pdal pipeline -i %script_dir%\Pipeline_PointStats.json --readers.las.filename=%%f --metadata !outname!
	python %script_dir%\Point_Stats_Writer.py !outname! !statfile!
)
echo(
echo Statistics File: !statfile!
echo(
echo Delete temporary directory?
rmdir temp /s