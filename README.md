# README
Thomas Ren  
November 25, 2014  
gameday
=======

A package that provides the match information of hockey games

## Installation
Install `gameday` from GitHub:


```r
devtools::install_github("thomasren1/gameday")
```

## Functions
For the current version, `gameday` has two functions: `gday()` and `scores()`.

### gday(team_name, date)
This function checks if the specified team has a match on the specified date.


```r
library(gameday)
```

```r
gday("flames", "2014-11-12")
```

```
## [1] FALSE
```

### scores(date)

This function takes the specified date as the input and returns a data.frame with all matches and scores of that day.


```r
# scores on 2014-11-02
scores("2014-11-02")
```

```
##                  home                away home_score away_score
## 1      BUFFALO SABRES   DETROIT RED WINGS          3          2
## 2 CAROLINA HURRICANES   LOS ANGELES KINGS          3          2
## 3  MONTREAL CANADIENS      CALGARY FLAMES          2          6
## 4 WASHINGTON CAPITALS     ARIZONA COYOTES          5          6
## 5  COLORADO AVALANCHE       ANAHEIM DUCKS          2          3
## 6  CHICAGO BLACKHAWKS       WINNIPEG JETS          0          1
## 7   VANCOUVER CANUCKS NASHVILLE PREDATORS          1          3
```

### Vignette
Further details can be found in the vignette for this package. The vignette can be viewed by running the following line of code:


```r
browseVignettes("gameday")
```

Also the vignette can be viewed online [here](https://github.com/thomasren1/gameday/blob/master/vignettes/overview.Rmd)
