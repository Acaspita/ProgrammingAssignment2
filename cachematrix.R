## This function creates a special "matrix" object that can cache its
## inverse

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(closureMatrix = matrix()) {
    inversedMatrix <- NULL
    set <- function(newMatrix) {
        closureMatrix <<- newMatrix
        inversedMatrix <<- NULL
    }
    get <- function() closureMatrix
    setInverse <- function(inverse) {
        inversedMatrix <- inverse
    }
    getInverse <- function() inversedMatrix
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" returned
## by makeCacheMatrix. If the inverse has already been calculated and
## it has not been modified, then the cachesolve should retrieve the
## inverse from the cache.

cacheSolve <- function(x, ...) {
    m <- x$getInverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(, ...)
    x$setInverse(m)
    m
}
