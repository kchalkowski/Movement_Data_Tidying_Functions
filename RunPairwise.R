####Make Pairwise contact RCPP scripts

#set home directory where Rcpp script located
home<-"~/Downloads/"

#load libraries
library(ctmm)
library(tictoc)
library(Rcpp)
library(RcppArmadillo)

#Get some tracking data from CTMM
data("buffalo")
ctmm::projection(buffalo)<-median(buffalo)
GUESS <- lapply(buffalo[1:2], function(b) ctmm.guess(b,interactive=FALSE) )
FITS <- lapply(1:2, function(i) ctmm.fit(buffalo[[i]],GUESS[[i]]) )
names(FITS) <- names(buffalo[1:2])
times=seq(from=min(times),to=min(times)+604800,by=60)

#Test speed of ctmm::distances
tic()
d=ctmm::distances(data=list(buffalo[[1]],buffalo[[2]]),
                CTMM=FITS,
                t=times)
toc()
#3.952 s

#source rcpp function
Rcpp::sourceCpp(paste0(home,"TestPairwise2.cpp"), verbose=TRUE)

tic()
#Predict
sim1 <- simulate(FITS[[1]],t=times)
sim2 <- simulate(FITS[[2]],t=times)

#Format output to vectors
t1=sim1@.Data[[1]]
x1=sim1@.Data[[2]]
y1=sim1@.Data[[3]]

t2=sim2@.Data[[1]]
x2=sim2@.Data[[2]]
y2=sim2@.Data[[3]]

#Run RCPP function
TestPairwise(x1,y1,x2,y2,100)
toc()
#~1.398s Rcpp vs ~4s CTMM
