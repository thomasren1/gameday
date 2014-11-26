#' Scores of games on a particular date
#'
#' This function takes the specified date as the input and returns a data.frame with all matches and scores of that day.
#'
#' Allows the user to look up NHL final scores without going to the internet browser.
#'
#' @param date The date which you want to check the match scores of
#' @return data.frame A data frame with four columns, team name for home and away, and match scores for home and away.
#' @note The function will print an error message if the date input is invalid.
#' If the date is in the future, the functoin will only return the name of the teams, with no scores.
#' The function will print an error message if the date entered is too far back in the past or too ahead into the future.
#' @export
#' @examples
#' scores("2014-11-02")
#' scores("2015-06-02")
#' scores(Sys.Date())
#'

scores <- function(date){
	assertthat::assert_that(check_date(date))
	if(internet_connection()){
		url  <- paste0('http://live.nhle.com/GameData/GCScoreboard/',
									 date, '.jsonp')
		raw <- RCurl::getURL(url)
		json <- gsub('([a-zA-Z_0-9\\.]*\\()|(\\);?$)', "", raw, perl = TRUE)
		data <- jsonlite::fromJSON(json)$games
		with(data,
				 data.frame(home = paste(htn, htcommon),
				 					 away = paste(atn, atcommon),
				 					 home_score = hts,
				 					 away_score = ats))
	}
	else
		stop("computer is not connected to the interent")
}

