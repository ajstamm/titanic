## Anscombe Plots
## Code for producing the Amscombe plot images found in the slides.
## They are different, mostly in the details, to make them easier to read from afar.


## Init ------------------------------------------------------------------------
data(anscombe)
##oldpar <- par(no.readonly=TRUE)



## Anscombe Set 1 --------------------------------------------------------------
par(mar=c(5.1, 5.5, 4.1, 2.1))
plot(anscombe$x1, anscombe$y1, 
     main="Anscombe: Set 1",
     xlab="x1", 
     ylab="y1",
     cex.lab=2,
     cex.axis=2,
     cex.main=2,
     cex.sub=2,
     cex=2
    )
dev.copy(png, 'scatter-anscombe-1.png')
dev.off()


## Anscombe Set 1 With Line ----------------------------------------------------
par(mar=c(5.1, 5.5, 4.1, 2.1))
plot(anscombe$x1, anscombe$y1, 
     main="Anscombe: Set 1",
     xlab="x1",
     ylab="y1",
     cex.lab=2,
     cex.axis=2, 
     cex.main=2,
     cex.sub=2,
     cex=2
)
m1 <- lm(formula=y1~x1, data=anscombe)
abline(m1, col="red", lwd=3)
dev.copy(png, 'model-anscombe-1.png')
dev.off()


## QQ Plot ---------------------------------------------------------------------
par(mar=c(5.1, 5.5, 4.1, 2.1))
qqplot(anscombe$x1,
       anscombe$y1,
       main="QQ Plot: Anscombe Set 1",
       xlab="x1",
       ylab="y1",
       cex.lab=2,
       cex.axis=2, 
       cex.main=2,
       cex.sub=2,
       cex=2)
abline(m1, col="red", lwd=3)
dev.copy(png, 'qq-anscombe-1.png')
dev.off()


## Prediction: Anscombe Set 1 --------------------------------------------------
p1 <- data.frame(x1=anscombe$x1+30, y1=NA)
p1$y1 <- predict(object=m1, newdata=p1)
par(mar=c(5.1, 5.5, 4.1, 2.1))
plot(rbind(anscombe[,c(1,5)], p1),
       main="Prediction: Anscombe Set 1",
       xlab="x1",
       ylab="y1",
       cex.lab=2,
       cex.axis=2, 
       cex.main=2,
       cex.sub=2,
       cex=2)
abline(m1, col="red", lwd=3)
dev.copy(png, 'predict-anscombe-1.png')
dev.off()


## Other -----------------------------------------------------------------------

## combining all plots on one image
par(mfrow=c(2,2))

## anscombe set 1
plot(anscombe$x1, anscombe$y1, 
	main="Anscombe: Set 1", xlab="x1", 
	ylab="y1", cex.lab=2, cex.axis=2, cex.main=2, cex.sub=2, cex=2
)

## anscombe set 2
plot(anscombe$x2, anscombe$y2, 
	main="Anscombe: Set 2", xlab="x2", 
	ylab="y2", cex.lab=2, cex.axis=2, 
	cex.main=2, cex.sub=2, cex=2
)

## anscombe set 3
plot(anscombe$x3, anscombe$y3, 
	main="Anscombe: Set 3", xlab="x3", 
	ylab="y3", cex.lab=2, cex.axis=2, 
	cex.main=2, cex.sub=2, cex=2
)

## anscombe set 4
plot(anscombe$x4, anscombe$y4, 
	main="Anscombe: Set 4", xlab="x4", 
	ylab="y4", cex.lab=2, cex.axis=2, 
	cex.main=2, cex.sub=2, cex=2
)
