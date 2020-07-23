@echo off
REM *** Batch process LAS files with a PIPELINE - Output intensity image ***
echo(
setlocal enabledelayedexpansion
REM *** Set INPUT and OUTPUT directories ***
set indir=C:\Users\Darren\Documents\PDAL\Test
set outdir=C:\Users\Darren\Documents\PDAL\Test\Results
REM *** Activate Command Prompt and PDAL ***
call C:\Anaconda3\Scripts\activate.bat
call conda activate lidar
set T0=%time%
REM *** Specify the pipeline to run ***
for %%f in (%indir%\*.las) do (
	set outname=%outdir%\%%~nf.tif
	echo(
	echo Read %%f
	echo Write !outname!
	pdal pipeline -i C:\Users\Darren\Documents\PDAL\Pipeline_IntensityImage.json --readers.las.filename=%%f --writers.gdal.filename=!outname!
)
echo(
set T1=%time%
echo Start Time: %T0%
echo End Time: %T1%