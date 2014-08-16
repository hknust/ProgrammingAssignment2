##
## testmatrix.R
##
## Testing the cacheMatrix function
setwd('~/git/Coursera/DataScience/02_Programming/Assignment 2/ProgrammingAssignment2/')

source('cachematrix.R')

c = rbind(c(1, -1/4), c(-1/4, 1))
class(c)
sm <- makeCacheMatrix(c)
class(sm)
# Solve the 1st time
cacheSolve(sm)
# Solve the 2nd time (should be the cached value)
cacheSolve(sm)
c2 = rbind(c(2, -1/8), c(-1/8, 2))
sm$setMatrix(c2)
# Solve the 1st time (different matrix no cached value)
cacheSolve(sm)
# Solve the 2nd time (should be the cached value)
cacheSolve(sm)


