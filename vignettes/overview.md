---
title: "Overview of Gameday"
author: "Weiye Ren"
date: "`r Sys.Date()`"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Overview of Gameday}
  %\VignetteEngine{knitr::rmarkdown}
  \usepackage[utf8]{inputenc}
---
# Inspration 
The goal for this package is to provide the users with a quick and easy way to access hockey match informations and game scores without having to open up a browser so that the user will not be distracted by other information that he or she may encounter on the browser. 


# Package
First of all we need to load the package.
```{r}
library(gameday)
```

# Functions

## gday(team_name, date)

This function checks if the specified team has a match on the specified date, with the default team being the canucks and default date being the current date. The function returns TRUE or FALSE.

```{r}
# check if the canucks has a match today
gday()

# check if the flames has a match on 2014-11-12
gday("flames", "2014-11-12")

```

## scores(date)

This function takes the specified date as the input and returns a data.frame with all matches and scores of that day.

```{r}
# scores on 2014-11-02
scores("2014-11-02")

# scores on a future date
scores("2015-01-02")

# scores of matches today
scores(Sys.Date())

```

Lastly we produce a list of winners on a specific day

```{r}
library(plyr)
suppressPackageStartupMessages(library(dplyr))

# all the winning teams of the current date
score <- scores("2014-11-15")

# select the winniers of the two teams
winner <- ddply(score, ~home, function(dat) {
	if (dat$home_score > dat$away_score) {return(as.character(dat$home))}
	else {return(as.character(dat$away))}
	})

# Then change the column name and leave out the winner
colnames(winner)<-c("home", "winner")
winner %>%
    select(winner)
```
