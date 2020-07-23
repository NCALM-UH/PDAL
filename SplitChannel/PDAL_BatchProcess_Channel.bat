@echo off
REM *** Batch process LAS files with a PIPELINE - Split by channel ***
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
	set outname=%outdir%\%%~nf_C1.las
	echo(
	echo Processing %%f
	REM *** PIPELINE for Channel 1 ***
	pdal pipeline -i C:\Users\Darren\Documents\PDAL\Pipeline_SplitChannel.json --readers.las.filename=%%f --filters.range.limits="UserData[1:1]" --writers.las.filename=!outname!
	set outname=%outdir%\%%~nf_C2.las
	REM *** PIPELINE for Channel 2 ***
	pdal pipeline -i C:\Users\Darren\Documents\PDAL\Pipeline_SplitChannel.json --readers.las.filename=%%f --filters.range.limits="UserData[2:2]" --writers.las.filename=!outname!
	REM *** PIPELINE for Channel 3 ***
	set outname=%outdir%\%%~nf_C3.las
	pdal pipeline -i C:\Users\Darren\Documents\PDAL\Pipeline_SplitChannel.json --readers.las.filename=%%f --filters.range.limits="UserData[3:3]" --writers.las.filename=!outname!
)
echo(
set T1=%time%
echo Start Time: %T0%
echo End Time: %T1%
