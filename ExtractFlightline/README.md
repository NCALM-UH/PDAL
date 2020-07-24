# ExtractFlightline
Extract selected flightlines and save to new LAS file(s) using PDAL.

### Flightline Extraction Notes
- Flightline info is typically stored in the Point Source ID field.
- Change the filter limits to include the range of flightlines being kept.
- Multiple ranges can be added.
- More information can be found at: https://pdal.io/stages/filters.range.html#ranges.
