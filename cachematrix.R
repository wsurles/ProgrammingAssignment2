##| 1. makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
##| 2. cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##|   - If the inverse has already been calculated (and the matrix has not changed), 
##|     then the cachesolve should retrieve the inverse from the cache.

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  ## This function creates a special "matrix" object that can cache its inverse.
  
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(solve) m <<- solve
  getInverse <- function() m
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
  m <- x$getInverse()         #query the x matrix's cache         
  if(!is.null(m)) {           #if there is a cache
    message("getting cached data") 
    return(m)                 #just return the cache, no computation needed
  }
  data <- x$get()             #if there's no cache
  m <- solve(data, ...)       #we actually compute them here
  x$setInverse(m)             #save the result back to x's cache
  m                           #return the result
}
