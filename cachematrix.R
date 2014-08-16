## makeCacheMatrix and cacheSolve provide functionality 
## to avoid having to compute inverse matrixes by storing
## (caching) the result of the first invocation. 

## makeCacheMatrix takes an argument of type matrix and
## returns a list with 4 functions: setMatrix, getMatrix,
## setInverse, and getInverse that can be used to extract 
## the original matrix or the inverse ot it.

makeCacheMatrix <- function(x = matrix()) 
{
  cachedInverse <- NULL

  setMatrix <- function(m)
  {
    x  <<- m
    message("Resetting cached inverse")
    cachedInverse <<- NULL
  }

  getMatrix <- function() { x }

  setInverse <- function(inverse) { cachedInverse <<- inverse }

  getInverse <- function() { cachedInverse }

  list(setMatrix  = setMatrix,
       getMatrix  = getMatrix,
       setInverse = setInverse,
       getInverse = getInverse)
}


## cacheSolve attempts to retrieve the inverse Matrix from
## cache first. If not found, the inverse is computed, added
## to cache, and the result returned to the caller.
cacheSolve <- function(x, ...) 
{
  ## Return a matrix that is the inverse of 'x'
  if (!is.null(x$getInverse()))
  {
    message("Using cached inverse")
    return(x$getInverse())
  }

  x$setInverse(solve(x$getMatrix()))

  x$getInverse()
}
