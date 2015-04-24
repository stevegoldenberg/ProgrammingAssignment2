## These functions allow you to calculate and store the inverse of a matrix. 
## This proves useful for large matrices that require lots of computation to solve

## Coursera Data Science Course 2, Programming assignment #2

## This function stores creates a caching tool for a matrix object. 

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) i <<- inverse
    getInverse <- function() i
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}
    



## This function computes the inverse of a matrix. It will cache the result on the
## first run and then pull from the cache in the future when run again. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    z <- x$getInverse()
    if(!is.null(z)) {
        message("getting cached data")
        return(z)
    } 
    data <- x$get()
    i <- solve(data, ...)
    x$setInverse(i)
    i
}
