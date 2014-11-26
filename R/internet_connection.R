## unexported helper function
# This is provided on the course website
internet_connection <- function() {
	tryCatch({RCurl::getURL("www.google.com"); TRUE},
					 error = function(err) FALSE)
}
