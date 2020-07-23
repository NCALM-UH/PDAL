# AddHeader
Add header info to a LAS file using PDAL.

### Add Header Value Notes
- "forward":"all" will retain all header information from the existing file, including LAS minor version. Additional options will overwrite forwarded values.
- Additional options can be found here: https://pdal.io/stages/writers.las.html#options.

### Add Channel Number Notes
- "UserData=>ScanChannel" will copy scanner channel information from User Data to the Scan Channel field. TerraScan (which NCALM uses) doesn't add Optech Titan's channel number to the official LAS 1.4 channel field.
