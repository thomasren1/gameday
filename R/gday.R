#' Is it Gameday?
#'
#' This cuntion returns TRUE if your NHL team plays today
#' and FALSE otherwise
#'
#' You know then problem: You're in your office writing R code and
#' suddenly have the urge to check whether your NHL team has a game today.
#' Before you know it you just wasted 15 minutes browsing the lastest
#' news on your favorite hockey webpage.
#' Suffer no more! You can now ask R directly, without tempting yourself
#' by firing up your web browser.
#'
#' @param team The name of your team. Defaults to \code{Canucks}.
#' @return Logical \code{TRUE} if \code{team.name} has an NHL game today
#' \code{FALSE} otherwise
#' @note case in \code{team.name} is ignored
#' @export
#' @examples
#' gday("canucks")
#' gday("Bruins")

gday <- function(team = "canucks", date = Sys.Date()){
	url <- paste0('http://live.nhle.com/GameData/GCScoreboard/',
								date, '.jsonp' )
	assertthat::assert_that(check_date(date))
	if (internet_connection()) {
		grepl(team, getURL(url), ignore.case=TRUE)
	}
	else {
		print("I can print the error message like this, or:")
		stop("computer is not connected to the interent")
	}
}
