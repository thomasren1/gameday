% Generated by roxygen2 (4.0.2): do not edit by hand
\name{scores}
\alias{scores}
\title{Scores of games on a particular date}
\usage{
scores(date)
}
\arguments{
\item{date}{The date which you want to check the match scores of}
}
\value{
data.frame A data frame with four columns, team name for home and away, and match scores for home and away.
}
\description{
This function takes the specified date as the input and returns a data.frame with all matches and scores of that day.
}
\details{
Allows the user to look up NHL final scores without going to the internet browser.
}
\note{
The function will print an error message if the date input is invalid.
If the date is in the future, the functoin will only return the name of the teams, with no scores.
The function will print an error message if the date entered is too far back in the past or too ahead into the future.
}
\examples{
scores("2014-11-02")
scores("2015-06-02")
scores(Sys.Date())
}

