lecture1notes
================
Abby Bergman
1/8/2019

``` r
#load packages
library(tidyverse)
```

    ## ── Attaching packages ────────────────────────── tidyverse 1.2.1 ──

    ## ✔ ggplot2 3.1.0     ✔ purrr   0.2.5
    ## ✔ tibble  1.4.2     ✔ dplyr   0.7.7
    ## ✔ tidyr   0.8.2     ✔ stringr 1.3.1
    ## ✔ readr   1.1.1     ✔ forcats 0.3.0

    ## ── Conflicts ───────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
library(ggplot2)
library(readr)
```

``` r
#set wd (only need to do this if not in an .Rmd file)
setwd("/Users/AbigailBergman/Desktop/Grad School/Winter Quarter 2019/Data Science/datascience_repo/week_01")
```

``` r
#load grades csv
grades <- read.csv("Grades.csv")
View(grades)

study_01 <- read.csv("Study1.csv")
View(study_01)
```

``` r
#Descriptive statistics

#mean(df$variable)
mean(grades$HW_F2015, na.rm = TRUE)
```

    ## [1] 92.46489
