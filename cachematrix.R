## Put comments here that give an overall description of what your
## functions do

## The first function, makeCacheMatrix creates a special "marix", which is really a list containing a function
## Sample usage:
## x <- matrix(c(1,3,2,4,3,2,5,4,8),3,3)
## x1<-makeCacheMatrix(x)


makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(solve) m <<- solve
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)

}


## The following function calculates the mean of the special "matrix" created with the above function
## Sample Usage:
## cacheSolve(x1)

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}