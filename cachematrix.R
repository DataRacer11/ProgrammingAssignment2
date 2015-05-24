##  In this second programming assignment we are required to write an R function that is able to cache 
##  potentially time-consuming computations. 

##  It makes sense to cache the value of a Matrix so that when we need it again, it can be 
##  looked up in the cache rather than recomputed. 

##  In this Programming Assignment we take advantage of the scoping rules of the R language and how they 
##  can be manipulated to preserve state inside of an R object.

##  Using the same Example: Caching the Mean of a Vector by Roger D. Peng, PhD, 
##  Jeff Leek, PhD, and Brian Caffo, PhD

##  The <<- operator can be used to assign a value to an object in an environment that is different from 
##  the current environment. Below are two functions that are used to create a special object that can cache the inverse of a matrix.

##  The First function; makeCacheMatrix: creates a special "matrix" object that can cache its inverse.
##  The Second function: cacheSolve: computes the inverse of the special "matrix" returned by makeCacheMatrix. 
##  If the inverse has already been calculated (and the matrix has not changed), then the cachesolve retrieves the inverse from the cache.

##  1. set the value of the matrix
##  2. get the value of the matrix
##  3. set the value of the inverse of the matrix
##  4. get the value of the inverse of the matrix

##  Using the same code from Caching the Mean of a Vector replacing 
##  (m, mean) for (inv or inverse)
makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
            x <<- y
            inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list (set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

##  The following function returns the inverse of the matrix with the above function. It first checks to see if the inverse has already been computed.
##  If so, it gets the inverse result from the cache and skips the computation. Otherwise, it computes the inverse of the data and sets the value of the 
##  matrix in the cache via the setinverse function.
##  Computing the inverse of a square matrix can be done with the solve function in R.
##  For example, if X is a square invertible matrix, then solve(X) returns its inverse.

##  For this assignment, we assume that the matrix supplied is always invertible.
cacheSolve <- function(x, ...) {
        inv <- x$getinverse()
        if(!is.null(inv)) {
            message("getting cached data")
            return(inv)
        }
        data <- x$get()
        inv <- solve(data,...)
        x$setinverse(inv)
        inv
}

## Example of what the matrix would look like in the console: 
## I have modified example run found on GIT HUB from sefakilic on Apr 27, 2014.
## This ran with the very same sample output on my console in RStudio.
## > x = rbind(c(1, -2/3), c(-2/3, 1))
## > m = makeCacheMatrix(x)
## > m$get()
##       [,1]  [,2]
## [1,]  1.00 -0.25
## [2,] -0.25  1.00

## Data is "not Cached" in the first run
## > cacheSolve(m)
##           [,1]      [,2]
## [1,] 1.0666667 0.2666667
## [2,] 0.2666667 1.0666667

## Cached Data is returned from the second run 
## > cacheSolve(m)
## getting cached data
##        [,1]      [,2]
## [1,] 1.0666667 0.2666667
## [2,] 0.2666667 1.0666667
