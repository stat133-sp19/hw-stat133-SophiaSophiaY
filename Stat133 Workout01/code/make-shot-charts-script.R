

# Title: make-shot-charts-script
# Description:
#   This script contains code for chart creation which creates plots
#   using the ggplots2 package from the NBA players data in the file 'data'
# Input(s): image 'nba-court.jpg'
#    data frames: andre-iguodala.csv 
#                 kevin-durant.csv
#                 klay-thompson.csv
#                 draymond-green.csv
#                 stephen-curry.csv
            
# Output(s): 
#           data file 'andre-iguodala-shot-chart.pdf'
#           data file 'kevin-durant-shot-chart.pdf'
#           data file 'klay-thompson-shot-chart.pdf'
#           data file 'draymond-green-shot-chart.pdf'
#           data file 'stephen-curry-shot-chart.pdf'
#           data file 'gsw-shot-chars.pdf'




install.packages("jpeg")
install.packages("grid")


library(jpeg)
library(grid)
library(ggplot2)


court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

iguodala <- read.csv('../data/andre-iguodala.csv')
pdf(file = '../images/andre-iguodala-shot-chart.pdf', width = 6.5, height = 5)
ggplot(data = iguodala) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Andre Iguodala')
dev.off()

durant <- read.csv('../data/kevin-durant.csv')
pdf(file = '../images/kevin-durant-shot-chart.pdf', width = 6.5, height = 5)
ggplot(data = durant) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Kevin Durant')
dev.off()

thompson <- read.csv('../data/klay-thompson.csv')
pdf(file = '../images/klay-thompson-shot-chart.pdf', width = 6.5, height = 5)
ggplot(data = thompson) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Klay Thompson')
dev.off()

green <- read.csv('../data/draymond-green.csv')
pdf(file = '../images/draymond-green-shot-chart.pdf', width = 6.5, height = 5)
ggplot(data = green) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Draymond Green')
dev.off()

curry <- read.csv('../data/stephen-curry.csv')
pdf(file = '../images/stephen-curry-shot-chart.pdf', width = 6.5, height = 5)
ggplot(data = curry) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Stephen Curry')
dev.off()



shots = read.csv('../data/shots-data.csv', stringsAsFactors = FALSE)
shots[,'name'] = c(rep('Stephen Curry', length(curry$game_date)), 
                   rep('Klay Thompson', length(thompson$game_date)), 
                   rep('Kevin Durant', length(durant$game_date)), 
                   rep('Draymond Green', length(green$game_date)), 
                   rep('Andre Iguodala', length(iguodala$game_date)))
pdf(file = '../images/gsw-shot-charts.pdf', width = 8 , height = 7)
ggplot(data = shots, aes(x = x, y = y)) + 
  annotation_custom(court_image, -260, 260, -50, 430) +
  geom_point(aes(color = shot_made_flag)) + 
  facet_wrap(~name) + 
  ylim(-50, 430) +
  ggtitle('Shot Chart: Five GSW Players')
dev.off()


ggplot(data = shots, aes(x = x, y = y)) + 
  annotation_custom(court_image, -260, 260, -50, 430) +
  geom_point(aes(color = shot_made_flag)) + 
  facet_wrap(~name) + 
  ylim(-50, 430) +
  ggtitle('Shot Chart: Five GSW Players')
ggsave('../images/gsw-shot-charts.png')








