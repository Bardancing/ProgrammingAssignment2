## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## Matrix inversion is often computationally heavy
## Therefore, caching might be beneficiary
## Below is a pair of functions that caches a matrix and its inverse
 
## This function creates a special "matrix" object that can cache its inverse
 
makeCacheMatrix <- function(x = matrix()) {
        MatrixInv <- NULL
        set <- function(y) {
                x <<- y
                MatrixInv <<- NULL
        }
        get <- function() x
        setInv <- function(inv_matrix) inv <<- inv_matrix
        getInv <- function() inv
        list(set = set,
             get = get,
             setInv = setInv,
             getInv = getInv)
}


## Write a short comment describing this function

## This function computes the inverse of the special matrix created by makeCacheMatrix
## If the inverse has already been calculated (and the matrix has not changed), it is retrieved from cache
 
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInv()
        if (!is.null(inv)) {
                message("Data is cached. Getting it.")
                return(inv)
        }
        mat <- x$get()
        inv <- solve(mat, ...)
        x$setInv(inv)
        inv
}
 
