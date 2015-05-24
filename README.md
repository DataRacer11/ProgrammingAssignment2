Introduction

In this second programming assignment we are required to write an R function 
that is able to cache potentially time-consuming computations. 

It makes sense to cache the values of a Matrix so that when we need it again, 
it can be looked up in the cache rather than recomputed. 

In this Programming Assignment we take advantage of the scoping rules of the R language 
and how they can be manipulated to preserve state inside of an R object.

I am using the same Example from: Caching the Mean of a Vector by Roger D. Peng, PhD, 
Jeff Leek, PhD, and Brian Caffo, PhD.

The <<- operator can be used to assign a value to an object in an environment that is different from 
the current environment. Below are two functions that are used to create a special object that can 
cache the inverse of a matrix.

The First function; makeCacheMatrix: creates a special "matrix" object that can cache its inverse.
The Second function: cacheSolve: computes the inverse of the special "matrix" returned by makeCacheMatrix. 

If the inverse has already been calculated (and the matrix has not changed), then the cachesolve retrieves 
the inverse from the cache.

I have modified and example run for a matrix I have found on GIT HUB from sefakilic on Apr 27, 2014.
This ran with the very same sample output on my console in RStudio.

