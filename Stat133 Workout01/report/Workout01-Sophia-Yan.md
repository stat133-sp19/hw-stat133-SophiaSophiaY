Stat133-Workout01-Report
================
Sophia Yan

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(ggplot2)
```

GSW-Shot-Charts
===============

<img src="../images/gsw-shot-charts.png" width="80%" style="display: block; margin: auto;" />

Three Percentile Tables
=======================

``` r
dat<-read.csv(file = '../data/shots-data.csv')
selected_dat = select(dat, player_name, shot_made_flag, shot_type)

effective_general <- arrange(summarise(group_by(selected_dat, player_name), total = n(), made = sum(shot_made_flag == 'shot_yes'), perc_made = made/total), desc(perc_made))
effective_general
```

    ## # A tibble: 5 x 4
    ##   player_name    total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Kevin Durant     915   495     0.541
    ## 2 Andre Iguodala   371   192     0.518
    ## 3 Klay Thompson   1220   575     0.471
    ## 4 Stephen Curry   1250   584     0.467
    ## 5 Graymond Green   578   245     0.424

``` r
effective_2PT <- arrange(summarise(group_by(selected_dat, player_name), total = sum(shot_type == '2PT Field Goal'), made = sum(shot_made_flag == 'shot_yes'& shot_type == '2PT Field Goal'), perc_made = made/total), desc(perc_made))
effective_2PT
```

    ## # A tibble: 5 x 4
    ##   player_name    total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   210   134     0.638
    ## 2 Kevin Durant     643   390     0.607
    ## 3 Stephen Curry    563   304     0.540
    ## 4 Klay Thompson    640   329     0.514
    ## 5 Graymond Green   346   171     0.494

``` r
effective_3PT <- arrange(summarise(group_by(selected_dat, player_name), total = sum(shot_type == '3PT Field Goal'), made = sum(shot_made_flag == 'shot_yes'& shot_type == '3PT Field Goal'), perc_made = made/total), desc(perc_made))
effective_3PT
```

    ## # A tibble: 5 x 4
    ##   player_name    total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Klay Thompson    580   246     0.424
    ## 2 Stephen Curry    687   280     0.408
    ## 3 Kevin Durant     272   105     0.386
    ## 4 Andre Iguodala   161    58     0.360
    ## 5 Graymond Green   232    74     0.319

``` r
#Introduction: Write a clear and captivating introduction that grabs the reader’s attention. And describe the purpose of the report.

Do you like NBA? Do you enjoy watching NBA games? As a student at University of California, Berkeley, you must be familiar with the Golden State Warrior. Also, Stephen Curry, Kevin Durant, are names that most people in California be familiar with, by default (just kidding). In this report I will use some data and some insights and reflection behind the data to talk a little bit about NBA the game, Golden State Warrior the team, and five famous basketball stars in GSW: Steven Curry, Kevin Durant, Draymond Green, Andre Iguodala, and Klay Thompson. 
The main purposes of this report are: 1. Try to use data, graphs, and interpretation of data to explain something interesting in our life.  2. As a beginner of R language, be more familiar with the strong power of this language and be more proficient in using this wonderful tool.  3. Have a glance on how big data penetrating in our life, from field to field. 


#Organize the content: Organize the content of your report in different sections: e.g. motivation, background, data, analysis, discussion, conclusions, and references.

Motivation is the same as above:  1. Try to use data, graphs, and interpretation of data to explain something interesting in our life.  2. As a beginner of R language, be more familiar with the strong power of this language and be more proficient in using this wonderful tool.  3. Have a glance on how big data penetrating in our life, from field to field. 

Background: After Steve Kerr become the coach of GSW team started from 2014, the GSW team become one of the greatest legend in NBA history. In this report I will illustrate some fun facts/reflection of this team. 

Analysis: 
From the images in the file we may conclude that:
Curry, Green, and Iguodala likes shooting the basketball at the center of the semi-circle or at the bottom line of the semi-circle, while Durant and Thompson are more “everywhere shooter”
Thompson is the best 3PT-shooter while Iguodala is the best 2PT-shooter. Unfortunately, Green is the worst in both
All players except Green have a total rank of 5 (rank 2pt + rank 3pt), but Curry is the one with most shoots.

Future interesting topics to explore:
Players’ performance when facing different opponent
Who is the strongest player
Who is the one more likely to “kill the game” (score a goal at the nearly end of the game)
```
