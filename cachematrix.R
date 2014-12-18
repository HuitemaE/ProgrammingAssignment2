## I am attempting to create and cache an inverse matrix (im) in R whilst hoping to know what i am doing...

## Assigning a function to the variable makeCacheMatrix
makeCacheMatrix <- function(x = matrix()){
       ### assigning a value (null to the object)
        im <- NULL 
        set <- function(y) {
                x <<- y
                im <<- NULL
}
## get the value of the matrix "im"
get <- function() x

## set the inverse of the matrix
setinverse <- function(solve) im <<- solve
getinverse <- function() im

## get the inverse of the matrix
list(set = set, get = get,
     setinverse = setinverse,
     getinverse = getinverse)
}

## Function to solve, store and retrieve the inverse matrix in cache

cacheSolve <- function(x, ...) {
        
        ## get the inverse of the matrix        
        im <- x$getinverse()
        
        ## check if there is the matrix   
        if(!is.null(im)) {
                message("getting cached data")
                return(im)
        }
        ## if not: get the inverse of the matrix   
        data <- x$get()
        im <- solve(data, ...)
        ## set the inverse of the matrix 
        x$setinverse(im)
        im
}