
library(readxl)
ECI <- read_excel("Desktop/NiceEE/20212022/S1/Diagnostics and compet/ECI.xls")
View(ECI)  


plot(ECI,Trade Value, data= ECI, main="Scatterplot Example",xlab="ECI", ylab="GDP (USD)", pch=19)

text(dist ~speed, labels=speed,data=cars, cex=0.9, font=2)

# Basic scatter plot
library(ggplot2)
library(ggrepel)

ECI$Brazil <- ifelse(ECI$Country == "Brazil", "Brazil", "Other Country")
mycolours <- c("Brazil" = "red", "Other Country" = "grey50")
b_p <- ggplot(ECI, aes(x=ECI, y=`Trade Value`)) + geom_point(size = 3, aes(colour = Brazil)) +
  scale_color_manual("Status", values = mycolours) +
  theme(legend.position = "none") + geom_text_repel(aes(label=Country))

b_p

print(b_p + labs(title = "Economic Complexity Index vs Trade Value (USD) in 2019", y="Trade Value (in USD)", x = "ECI")) + theme_linedraw() 

cor.test(ECI$ECI,ECI$`Trade Value`)