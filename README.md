# Movement Data Tidying Functions

This is just a collection of some random R functions I made that other folks may find helpful for tidying movement data

`Neat.Dates`: Takes a vector of datetimes, and returns a vector formatted "MM/DD/YYYY HH\:MM:SS", to cleanly pass on to datetime formats in R such as `as.POSIXct()`    

  **What it does:**     
  
* Can take vectors containing multiple datetime formats (i.e., some in vector are formatted YYYY-MM-DD HH\:MM:SS and some are MM/DD/YYYY HH\:MM:SS)
* Can take mixtures of 12 and 24 hour clocks in vector    
* Can take mixtures of double and single digits in date/time strings (returns double digits only)    
* For times containing midnight on 24-hour-clocks, as.POSIXct() sometimes interprets this as a missing time.. and formats whole string to remove the times. This function adds 1 second to 00\:00:00 times to prevent this
    
  **Requirements of date string format:**      
      
* Organized as "date time" (ie 2023-02-14 05\:55:02 not 05\:55:02 2023-02-14)    
* Delimiters in dates are all same (ie 2023-02-13 OR 2023/02/13, NOT 2023/02-13)    
* Delimiters in times are colons    
* Dates are organized by month-day-year    

