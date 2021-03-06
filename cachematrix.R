## makeCacheMatrix creates a special matrix object that can cache its inverse

## Input: A matrix 'x'

makeCacheMatrix <- function(x = matrix()) {
      
            ## Setting the matrix
      
            m  <- NULL
            set <- function(y) { 
                  x  <<- y
                  m <<- NULL
            }
            
            ## Getting the matrix
            ## Setting the inverse
            ## Getting the inverse
            
            get        <- function() x     
            setinverse <- function(inverse) m <<- inverse
            getinverse <- function() m
            list(set = set, get = get,
                 setinverse = setinverse, 
                 getinverse = getinverse)
            
            ## list is the input for cacheSolve()
      
}

## cacheSolve computes the inverse of the matrix returned by makeCacheMatrix

cacheSolve <- function(x, ...) {
      
            ## Checking if the inverse has already been calculated
      
            m   <- x$getinverse()
      
            if(!is.null(m)) {
            
                  message("getting cached data")
                  return(m)
            
            ## Skipping the computation
            
            }
            
            ## Calculating the inverse
      
            data <- x$get()
            m   <- solve(data,...)
            x$setinverse(m)
            m
      
            ## Output: a matrix that is the inverse of 'x'
}

## Example
## > x <- matrix(1:4,2,2)
## > m <- makeCacheMatrix(x)
## > m$get()
##    [,1] [,2]
##[1,]   1    3
##[2,]   2    4

## cacheSolve(m)
##    [,1] [,2]
##[1,]  -2  1.5
##[2,]   1 -0.5
