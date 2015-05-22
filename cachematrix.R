## Programming Assignment 2 - R Programming
## program to calculate and/or store cached version of inverse of a matrix

## Instructions for use:
## 1. create a square, inversible matrix (e.g., mymatrix)
## 2. source this program into R
## 3. create a makeCacheMatrix object based on the matrix from step 1 (e.g., mat)
## > mat <- makeCacheMatrix(mymatrix) 
## 4. create an inverse of mymatrix
## > cacheSolve(mat)
##    message will indicate not found in cache, calculate and return
## 5. run command again to retrieve from cache
## > cacheSolve(mat)
##    message will indicate found in cache and return
## Notes: requires original argument to be a square, inversible matrix

## define function to create list of functions associated with calculation,
## storage in cache, and retrieve from cache for inverted a square matrix 
makeCacheMatrix <- function(x = numeric()) {
    ## initialize invmat as empty matrix
    invmat <- NULL
    ## create set function, not used in example usage in instructions
    set <- function(y) {
        x <<- y
        invmat <<- NULL
    }
    ## create get function, returns the square matrix
    get <- function() {
        x
    }
    ## create setinv function, calculates and stores inverse matrix
    setinv <- function(solve) {
        invmat <<- solve
    }
    ## create getinv function, returns inverse matrix
    getinv <- function() {
        invmat
    }
    ## create and return list of functions
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## define function to retrieve inverse matrix if in cache,
## otherwise calculate, return and store in cache the inverse matrix
cacheSolve <- function(x, ...) {
    ## create invmat and pull inverse matrix from cache
    invmat <- mat$getinv()
    ## test if inverse matrix exists in cache, if so, retrieve from cache
    if(!is.null(invmat)) {
        message("getting cached data")  
        return(invmat)
    }
    ## otherwise get matrix, calculate inverse, store in cache and return
    message("inverse matrix not found in cache, calculating now")
    data <- mat$get()
    invmat <- solve(data, ...)
    mat$setinv(invmat)
    invmat    
}
