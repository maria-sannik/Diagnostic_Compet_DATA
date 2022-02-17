
library(readxl)
ECI <- read_excel("/Users/mariasannikov/Desktop/NiceEE/20212022/S1/Diagnostics\ and\ compet/ECI.xls")
x_ch_br <- read_excel("/Users/mariasannikov/Desktop/NiceEE/20212022/S1/Diagnostics and compet/ChinaBrazil2019.xlsx")
  
# Basic scatter plot
library(ggplot2)
library(ggrepel)
library(remotes)
library(scales)
library(plotly)
```

## R Plots for Brazil Competivity Report

Below are two graphs from the report that are made in R. 

The first is a scatter plot of ECI and Trade value.

The second is an interactive plot showing product exports between China and Brazil.

#PLOT 1 : ECI and Trade Value
ECI$Brazil <- ifelse(ECI$Country == "Brazil", "Brazil", "Other Country")
mycolours <- c("Brazil" = "red", "Other Country" = "grey50")

p1 <- ggplot(ECI, aes(x=ECI, y=`Trade Value`)) + geom_point(size = 3, aes(colour = Brazil)) +
  scale_color_manual("Status", values = mycolours) +theme(legend.position = "none") + geom_text_repel(aes(label=Country))

p1 + labs(title = "Economic Complexity Index vs Trade Value (USD) in 2019", y="Trade Value (in USD)", x = "ECI") + theme_grey()

cor.test(ECI$ECI,ECI$`Trade Value`) #correlation of trade value and ECI



#PLOT 2 : Interactive Plot of product exports between China and Brazil, data souce = OEC

t <- list(
  family = "Arial Narrow",
  size = 12,
  color = "black")

p2 <- plot_ly(data = x_ch_br, x = x_ch_br$`China-Brazil`, y = x_ch_br$`Brazil-China`, color = x_ch_br$Section, size = x_ch_br$`Brazil-China` + x_ch_br$`China-Brazil`, type = "scatter",mode ="markers")%>%
  layout(title = 'Exports by Product between Brazil and China', plot_bgcolor = "FAFAFA", xaxis = list(title = 'China Exports to Brazil'), 
         yaxis = list(title = 'Brazil Exports to China',font=t),font = t,
         legend = list(orientation = 'h',y = -0.2),(title=list(text='<b> Section </b>')))
p2
