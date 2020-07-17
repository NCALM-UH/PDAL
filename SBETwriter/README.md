# SBET Writer Read Me
- Convert SBET *.out (trajectory) files to various formats.
- Convert SBET files from ellipsoidal height to orthometric height (for imagery processing).

### Orthometric Conversion Notes
- Geoid GTX files can be downloaded from: https://github.com/OSGeo/proj-datumgrid/tree/master/north-america.
- GTX files can be corrupted (or partially corrupted). This results in a failure to process or "-inf" results in the height column. Redownload the GTX file or convert from a geoid BIN file using *build_g####.sh*.
