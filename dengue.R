dengue <- read.table("https://raw.githubusercontent.com/rafareds/Course9/master/dengue.txt",
                     h = T)

graf1 <- function(anoIn){
  inicio <- dengue$mes[dengue$ano == anoIn][1]
  plot(dengue$casos[inicio:180], t = "l", col = "darkslategrey", lwd = 2, 
     xlab = "Month", ylab = "Cases", main = "Cases of Dengue")
}

library(doBy)

graf2 <- function(anoIn){
  inicio <- dengue$mes[dengue$ano == anoIn][1]
  dengueIn <- dengue[inicio:180,]
  dengue.mes <- summaryBy(casos ~ meses, data = dengueIn, 
                          FUN = sum)
  dengue.mes$casos.prop <- dengue.mes$casos.sum/sum(dengue.mes$casos.sum)

  df <- dengue.mes
  dengue.mes[1,] <- df[5,]; dengue.mes[2,] <- df[4,]
  dengue.mes[3,] <- df[8,]; dengue.mes[4,] <- df[1,]
  dengue.mes[5,] <- df[9,]; dengue.mes[6,] <- df[7,]
  dengue.mes[7,] <- df[6,]; dengue.mes[8,] <- df[2,]
  dengue.mes[9,] <- df[12,]; dengue.mes[10,] <- df[11,]
  dengue.mes[11,] <- df[10,]; dengue.mes[12,] <- df[3,]

  barplot(dengue.mes$casos.prop, names.arg = dengue.mes$meses,
          col = "darkslategrey", 
          main = "Proportion of Cases by Month")

}
dengue.ano <- summaryBy(casos ~ ano, data = dengue, FUN = sum)
