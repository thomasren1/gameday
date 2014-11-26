## unexported helper function
# I wrote this function in a similar way that the internet_connection function is written.
check_date <- function(date){
	tryCatch({as.Date(date); TRUE},
					 error = function(err) FALSE)
}
