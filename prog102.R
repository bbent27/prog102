library(marinecs100b)


# Writing a utility function ----------------------------------------------

# P1: How did you extract the temperature and exposure from the hottest day?
# Copy-paste the code here.

hottest_idx <- which.max(kefj_temperature)
hottest_time <- kefj_datetime[hottest_idx]
hottest_site <- kefj_site[hottest_idx]
hotday_start <- as.POSIXct("2018-07-03 00:00", tz = "Etc/GMT+8")
hotday_end <- as.POSIXct("2018-07-04 00:00", tz = "Etc/GMT+8")
hotday_idx <- kefj_site == hottest_site &
  kefj_datetime >= hotday_start &
  kefj_datetime <= hotday_end
hotday_datetime <- kefj_datetime[hotday_idx]
hotday_temperature <- kefj_temperature[hotday_idx]
# calling the smaller thing from the bigger thing- indexing
hotday_exposure <- kefj_exposure[hotday_idx]
plot_kefj(hotday_datetime, hotday_temperature, hotday_exposure)

# P2: Fill in the blanks below to write the Alaskan datetime utility function.
site_datetime <- function(any_date) {
  result <- as.POSIXct(any_date, tz = "Etc/GMT+8")
  return(result)
}
site_datetime("2022-02-02 16:00")


# Extracting data ---------------------------------------------------------

# P3: Make a copy of your code from P1 and edit it to plot the temperature and
# exposure for "Aialik" on 2012-06-01
site <- "Aialik"
day_start <- as.POSIXct("2012-06-01 00:00", tz = "Etc/GMT+8")
day_end <- as.POSIXct("2012-06-02 00:00", tz = "Etc/GMT+8")
day_idx <- kefj_site == site &
  kefj_datetime >= day_start &
  kefj_datetime <= day_end
day_datetime <- kefj_datetime[day_idx]
day_temperature <- kefj_temperature[day_idx]
day_exposure <- kefj_exposure[day_idx]
plot_kefj(day_datetime, day_temperature, day_exposure)

# P4: Make a copy of your code from P3 and edit it to plot the temperature and
# exposure for "Harris" on 2016-04-05.
site <- "Harris"
day_start <- as.POSIXct("2016-04-05 00:00", tz = "Etc/GMT+8")
day_end <- as.POSIXct("2016-04-06 00:00", tz = "Etc/GMT+8")
day_idx <- kefj_site == site &
  kefj_datetime >= day_start &
  kefj_datetime <= day_end
day_datetime <- kefj_datetime[day_idx]
day_temperature <- kefj_temperature[day_idx]
day_exposure <- kefj_exposure[day_idx]
plot_kefj(day_datetime, day_temperature, day_exposure)

# P5: Compare your solutions for P3 and P4 - what variables changed?
#In P3 and P4 we had to change the site, day_start, and day_end variables

# P6: What you would pick for the temperature extraction function and
# parameters' names?
temp_extract <- function("some site", "some date")

# Writing extraction functions --------------------------------------------

# P7: Fill in the blanks in the code below to write your temperature extraction
# function.

temp_extract <- function(site, day_start, day_end) {
  day_start_ak <- site_datetime(day_start)
  day_end_ak <- site_datetime(day_end)
  day_idx <- kefj_site == site &
    kefj_datetime >= day_start_ak &
    kefj_datetime <= day_end_ak
  result <- kefj_temperature[day_idx]
  return(result)
}
temp_extract("Harris", "2016-04-05 00:00", "2016-04-06 00:00")

# P8: Make a copy of your solution to P7, and edit it to create exposure and
# datetime extraction functions.
date_extract <- function(site, day_start, day_end) {
  day_start_ak <- site_datetime(day_start)
  day_end_ak <- site_datetime(day_end)
  day_idx <- kefj_site == site &
    kefj_datetime >= day_start_ak &
    kefj_datetime <= day_end_ak
  result <- kefj_datetime[day_idx]
  return(result)
}
date_extract("Harris", "2016-04-05 00:00", "2016-04-06 00:00")



exposure_extract <- function(site, day_start, day_end) {
  day_start_ak <- site_datetime(day_start)
  day_end_ak <- site_datetime(day_end)
  day_idx <- kefj_site == site &
    kefj_datetime >= day_start_ak &
    kefj_datetime <= day_end_ak
  result <- kefj_exposure[day_idx]
  return(result)
}
exposure_extract("Harris", "2016-04-05 00:00", "2016-04-06 00:00")

# P9: Export your annotated screenshot as a JPEG called "annotated_function.jpg"
# and add it to your copy of the module repository. (It should be in the same
# folder as this file.)
#done!

# P10: Visualize Nuka Pass on July 1, 2018.
plot_kefj(date_extract("Nuka_Pass", "2018-07-01 00:00", "2018-07-01 23:59"),
          temp_extract("Nuka_Pass", "2018-07-01 00:00", "2018-07-01 23:59"),
          exposure_extract("Nuka_Pass", "2018-07-01 00:00", "2018-07-01 23:59"))


# P11: Save a copy of the Nuka Pass plot as "nuka_pass_2018-07-01.png" in this
# repo
#done!

# P12: Compare the code you wrote to create the plot in this module to the code
# you wrote in PROG101. Qualitatively, how do they compare? Which one is easier
# to read and why?
#In prog101, we had to assign a set value for each variable and that couldn’t
#change without copy/paste/edit (so more room for bugs/errors). Now that we are
#using functions in prog 102, we are able to call the
#function and change the values that are being inputted. This allows us to reuse
# the functions for different values

