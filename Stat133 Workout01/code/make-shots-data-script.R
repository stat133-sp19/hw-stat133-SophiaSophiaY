
## title: make-shots-data-script
## description: Read in the data and create a global table that contains all the data.
##              Generate output txt file for each seperate tables and the global table.
##              The primary goal of this stage is to create a csv data file shots-data.csv 
##              that will contain the required variables to be used in the visualization phase.
## input(s): andre-iguodala.csv, draymond-green.csv, kevin-durant.csv, 
##           klay-thompson.csv, stephen-curry.csv
## output(s): andre-iguodala-summary.txt, draymond-green-summary.txt, 
##            kevin-durant-summary.txt, klay-thompson-summary.txt, 
##            stephen-curry-summary.txt, shots-data-summary.txt


iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
player_name <- "Andre Iguodala"
iguodala <- cbind(player_name, iguodala)
iguodala$shot_made_flag[iguodala$shot_made_flag  == "n"] <- "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag  == "y"] <- "shot_yes"
iguodala$minute <- iguodala$period * 12 - iguodala$minutes_remaining
sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

iguodala


green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
player_name <- "Graymond Green"
green <- cbind(player_name,green)
green$shot_made_flag[green$shot_made_flag  == "n"] <- "shot_no"
green$shot_made_flag[green$shot_made_flag  == "y"] <- "shot_yes"
green$minute <- green$period * 12 - green$minutes_remaining
sink(file = '../output/graymond-green-summary.txt')
summary(green)
sink()

green


durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
player_name <- "Kevin Durant"
durant <- cbind(player_name,durant)
durant$shot_made_flag[durant$shot_made_flag  == "n"] <- "shot_no"
durant$shot_made_flag[durant$shot_made_flag  == "y"] <- "shot_yes"
durant$minute <- durant$period * 12 - durant$minutes_remaining
sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

durant


thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
player_name <- "Klay Thompson"
thompson <- cbind(player_name,thompson)
thompson$shot_made_flag[thompson$shot_made_flag  == "n"] <- "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag  == "y"] <- "shot_yes"
thompson$minute <- thompson$period * 12 - thompson$minutes_remaining
sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()

thompson


curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
player_name <- "Stephen Curry" 
curry <- cbind(player_name,curry)
curry$shot_made_flag[curry$shot_made_flag  == "n"] <- "shot_no"
curry$shot_made_flag[curry$shot_made_flag  == "y"] <- "shot_yes"
curry$minute <- curry$period * 12 - curry$minutes_remaining
sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()

curry


global <- rbind(iguodala, green)
global <- rbind(global, durant)
global <- rbind(global, thompson)
global <- rbind(global, curry)
global

write.csv(global, "shots-data.csv", row.names = FALSE)

sink(file = '../output/shots-data-summary.txt')
summary(global)
sink()


