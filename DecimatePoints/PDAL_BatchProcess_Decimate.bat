@echo off
REM *** Batch process LAS files with a PIPELINE - Decimate point cloud ***
echo(
setlocal enabledelayedexpansion
REM *** Set INPUT and OUTPUT directories ***
set indir=C:\Users\Darren\Documents\PDAL\Test
set outdir=C:\Users\Darren\Documents\PDAL\Test\Results
REM *** Activate Command Prompt and PDAL ***
call C:\Anaconda3\Scripts\activate.bat
call conda activate lidar
set T0=%time%
echo Choose Decimate Option
echo 1. Simple Decimation (Fast)
echo 2. Voxel Center
echo 3. Voxel Centroid
echo 4. Poisson Sampling (Slow)
echo(
set /p choice="Option: "
REM *** Specify the pipeline to run ***
if "%choice%"=="1" (
	for %%f in (%indir%\*.las) do (
		set outname=%outdir%\%%~nf.las
		echo(
		echo Running PDAL filters.decimation
		echo Read %%f
		echo Write !outname!
		pdal pipeline -i C:\Users\Darren\Documents\PDAL\DecimatePoints\decimate.json --readers.las.filename=%%f --writers.las.filename=!outname!
	)
)
if "%choice%"=="2" (
	for %%f in (%indir%\*.las) do (
		set outname=%outdir%\%%~nf.las
		echo(
		echo Running PDAL filters.voxelcenternearestneighbor
		echo Read %%f
		echo Write !outname!
		pdal pipeline -i C:\Users\Darren\Documents\PDAL\DecimatePoints\center.json --readers.las.filename=%%f --writers.las.filename=!outname!
	)
)
if "%choice%"=="3" (
	for %%f in (%indir%\*.las) do (
		set outname=%outdir%\%%~nf.las
		echo(
		echo Running PDAL filters.voxelcentroidnearestneighbor
		echo Read %%f
		echo Write !outname!
		pdal pipeline -i C:\Users\Darren\Documents\PDAL\DecimatePoints\centroid.json --readers.las.filename=%%f --writers.las.filename=!outname!
	)
)
if "%choice%"=="4" (
	for %%f in (%indir%\*.las) do (
		set outname=%outdir%\%%~nf.las
		echo(
		echo Running PDAL filters.sample
		echo Read %%f
		echo Write !outname!
		pdal pipeline -i C:\Users\Darren\Documents\PDAL\DecimatePoints\sample.json --readers.las.filename=%%f --writers.las.filename=!outname!
	)
)
echo(
set T1=%time%
echo Start Time: %T0%
echo End Time: %T1%