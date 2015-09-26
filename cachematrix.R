## Following is a pair of functions that cache the inverse of a matrix

## To create a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    ## To initialize the inverse property
    i <- NULL
    
    ## To set the matrix
    setmatrix <- function(matrix) {
        m <<- matrix
        i <<- NULL
    }
    
    ## To get the matrix
    getmatrix <- function() {
        ## To return the matrix
        m
    }
    
    ## To set the inverse of the matrix
    setinverse <- function(inverse) {
        i <<- inverse
    }
    
    ## To get the inverse of the matrix
    getinverse <- function() {
        ## To return the inverse property
        i
    }
    
    ## To return a list with named elements as functions in it
    list(setmatrix = setmatrix, getmatrix = getmatrix, setinverse = setinverse, getinverse = getinverse)
}


## This function computes the inverse of the special "matrix" returned by 'makeCacheMatrix' above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## 'cacheSolve' would retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        
    ## To return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    
    ## To return the inverse if it has already been set
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    
    ## Otherwise, get the matrix from our object
    data <- x$getmatrix()
    
    ## To calculate the inverse and store it in the cache
    inverse <- solve(data)
    x$setinverse(inverse)
    
    ## To return the inverse
    inverse
}
