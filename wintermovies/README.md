
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wintermovies

<!-- badges: start -->
<!-- badges: end -->

The goal of wintermovies is on the Holiday Movies which has been
released between 1929-2023 and how all these holiday movies represent
the different holidays of the season such as **Christmas**, **kwanzaa**
and **Hanukkah**.

## Installation

You can install the development version of wintermovies from
[GitHub](https://github.com/ETC5523-2024/assignment-4-packages-and-shiny-apps-dulith4/tree/main/wintermovies)
with:

``` r
remotes::install_github("ETC5523-2024/assignment-4-packages-and-shiny-apps-dulith4", subdir = "wintermovies")
```

``` r
# install.packages("pak")
pak::pak("ETC5523-2024/assignment-4-packages-and-shiny-apps-dulith4")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(wintermovies)
data("holiday_movies")
data("cleaned_holiday_movie_genres")
## basic example code
```

The Summary of the Dataset

``` r
summary(holiday_movies)
#>     tconst           title_type        primary_title      original_title    
#>  Length:2265        Length:2265        Length:2265        Length:2265       
#>  Class :character   Class :character   Class :character   Class :character  
#>  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
#>                                                                             
#>                                                                             
#>                                                                             
#>                                                                             
#>       year      runtime_minutes     genres          simple_title      
#>  Min.   :1929   Min.   :  1.00   Length:2265        Length:2265       
#>  1st Qu.:2003   1st Qu.: 68.00   Class :character   Class :character  
#>  Median :2015   Median : 85.00   Mode  :character   Mode  :character  
#>  Mean   :2008   Mean   : 78.44                                        
#>  3rd Qu.:2020   3rd Qu.: 90.00                                        
#>  Max.   :2023   Max.   :288.00                                        
#>                 NA's   :189                                           
#>  average_rating     num_votes        christmas         hanukkah       
#>  Min.   : 1.000   Min.   :    10   Min.   :0.0000   Min.   :0.000000  
#>  1st Qu.: 5.400   1st Qu.:    54   1st Qu.:1.0000   1st Qu.:0.000000  
#>  Median : 6.100   Median :   287   Median :1.0000   Median :0.000000  
#>  Mean   : 6.062   Mean   :  2168   Mean   :0.8517   Mean   :0.004415  
#>  3rd Qu.: 6.800   3rd Qu.:  1000   3rd Qu.:1.0000   3rd Qu.:0.000000  
#>  Max.   :10.000   Max.   :367288   Max.   :1.0000   Max.   :1.000000  
#>                                                                       
#>     kwanzaa          holiday       
#>  Min.   :0.000000   Mode :logical  
#>  1st Qu.:0.000000   FALSE:1935     
#>  Median :0.000000   TRUE :330      
#>  Mean   :0.000883                  
#>  3rd Qu.:0.000000                  
#>  Max.   :1.000000                  
#> 
summary(cleaned_holiday_movie_genres)
#>     tconst             genres         
#>  Length:4431        Length:4431       
#>  Class :character   Class :character  
#>  Mode  :character   Mode  :character
```

## Shiny App

You can also check the Shiny App which is part of the package

``` r
wintermovies::run_app()
```
