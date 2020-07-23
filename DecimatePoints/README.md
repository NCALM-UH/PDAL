# DecimatePoints
Decimate point clouds to produce smaller LAS files.

### Decimate Point Cloud Notes
- Decimation options are available in the batch file.
  1. "fiters.decimation" will save every *n*th point.
  2. "filters.voxelcenternearestneighbor" will save the nearest neighbor to the voxel center.
  3. "filters.voxelcentroidnearestneighbor" will save the nearest neighbor to the points' centroid.
  4. "filters.sample" will perform Poisson sampling to determine which points to save.
