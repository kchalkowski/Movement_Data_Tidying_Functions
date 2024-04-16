# Movement Data Tidying Functions

This is just a collection of some random R functions I made that other folks may find helpful for tidying movement data

## NeatDates    

`NeatDates` takes a vector of datetimes, and returns a vector formatted "MM/DD/YYYY HH\:MM:SS", to cleanly pass on to datetime formats in R such as `as.POSIXct()`    

 **What it does:**     
  
* Can take vectors containing multiple datetime formats (i.e., some in vector are formatted YYYY-MM-DD HH\:MM:SS and some are MM/DD/YYYY HH\:MM:SS)
* Can take mixtures of 12 and 24 hour clocks in vector    
* Can take mixtures of double and single digits in date/time strings (returns double digits only)    
* For times containing midnight on 24-hour-clocks, as.POSIXct() sometimes interprets this as a missing time.. and formats whole string to remove the times. This function adds 1 second to 00\:00:00 times to prevent this
* Can take string of date times, or just dates

**Requirements of date string format:**      
      
* Organized as "date time" (ie 2023-02-14 05\:55:02 not 05\:55:02 2023-02-14)    
* Delimiters in dates are all same (ie 2023-02-13 OR 2023/02/13, NOT 2023/02-13)    
* Delimiters in times are colons    
* Dates are organized by month-day, not day-month. Year can be in any order.
* If year is two digits, needs to be organized "mm/dd/yy" (can be any delimiter)
* Assumes two digit years are 2000 or later

**Use:**    

    times=c("2007-10-31", "2008/04/20", "02/04/12")
    NeatDates(times)

## Neat.Dates.POSIXct

`Neat.Dates.POSIXct` does everything NeatDates does, but also passes output into `as.POSIXct()`. Requires timezone.

**Use:**

    times=c("2007-10-31", "2008/04/20", "02/04/12")
    Neat.Dates.POSIXct(times,tz="UTC)


    
