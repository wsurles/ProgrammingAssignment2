makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

cachemean <- function(x, ...) {
  m <- x$getmean()           #query the x vector's cache         
  if(!is.null(m)) {           #if there is a cache
    message("getting cached data") 
    return(m)                #just return the cache, no computation needed
  }
  data <- x$get()             #if there's no cache
  m <- mean(data, ...)        #we actually compute them here
  x$setmean(m)                #save the result back to x's cache
  m                           #return the result
}

## simple tests
x <- c(1,2,3,4)
a <- makeVector(x)
class(a)
cachemean(a)
x <- a

class(a$get)
[1] "function"

a$get()
[1] 1 2 3

a$set(c(4,5,6))
a$get()
[1] 4 5 6

