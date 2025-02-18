library(marinecs100b)

# Extracting data ---------------------------------------------------------

# How did you extract the temperature and exposure from the hottest day?
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

# If you want to change the site and date, what variables would need to change?

#kefj_site, hotday_start, hotday_end, kefj_datetime

# What would you pick for the temperature extraction function name and parameter
# names?
temp_extract <- function("some site", "some date")

# Writing extraction functions --------------------------------------------

# Write your temperature extraction function here
temp_extract <- function( harris_site, harris_date) {
  harris_site <-
  result <-
}

# Write your exposure extraction function here

# Write your datetime extraction function here

# Visualize Nuka Pass temperatures on 2018-07-01

# How does the visualization code above compare to what you wrote in PROG101?


# Functions within functions (optional) -----------------------------------

# How would you parameterize the visualization code into its own function?
# Specifically, what would you call that function and its parameters?

# Write your wrapper function for plot_kefj(). Call it to compare the
# visualizations for Nuka Pass on July 1, 2018 versus January 1, 2018.
