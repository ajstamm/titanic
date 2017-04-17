## Demo Plots
## Code for producing the Demo plot images found in the slides.
## They are different, mostly in the details, to make them easier to read from afar.


## Plot Age --------------------------------------------------------------------
par(mar=c(5.1, 5.4, 4.1, 2.1))
plot(passengers$age, 
     cex.lab=2,
     cex.axis=2,
     cex.main=2,
     cex.sub=2,
     cex=2
     )
dev.copy(png, 'passengers-scatter-1.png')
dev.off()

## Plot Age By Class -----------------------------------------------------------
par(mar=c(5.1, 5.4, 4.1, 2.1))
plot(passengers$passenger_class,
     passengers$age,
     cex.lab=2,
     cex.axis=2,
     cex.main=2,
     cex.sub=2,
     cex=2
     )
dev.copy(png, 'passengers-scatter-2.png')
dev.off()

## Plot Age By Class (Factor) --------------------------------------------------
par(mar=c(5.1, 5.4, 4.1, 2.1))
plot(as.factor(passengers$passenger_class),
     passengers$age,
     cex.lab=2,
     cex.axis=2,
     cex.main=2,
     cex.sub=2,
     cex=2
     )
dev.copy(png, 'passengers-scatter-3.png')
dev.off()

## Barplot: Passenger Sex ------------------------------------------------------
par(mar=c(5.1, 5.4, 4.1, 2.1))
barplot(tbl,
        cex.lab=2,
        cex.axis=2,
        cex.main=2,
        cex.sub=2,
        cex=2
        )
dev.copy(png, 'passengers-barplot-1.png')
dev.off()

## Barplot: Passenger Sex ------------------------------------------------------
par(mar=c(5.1, 5.4, 4.1, 2.1))
barplot(prop.table(tbl)*100,
        cex.lab=2,
        cex.axis=2,
        cex.main=2,
        cex.sub=2,
        cex=2
        )
dev.copy(png, 'passengers-barplot-2.png')
dev.off()
