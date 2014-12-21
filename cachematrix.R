## Create a list of functions that set,get,setInverse,getInverse that do as names say 
makeCacheMatrix <- function(x = matrix()) {

}
makeCacheMatrix <- function(x = matrix(nrow=0,ncol=0)){
    inverse <- NULL #set inv to null. its changed if you setInv
    set <- function(y){
        x <<- y #change value of x to y and store in parent env
        inverse <<- NULL #set inverse to null and store in parent
    }
    get <- function() x
    setInverse <- function(xInv) inverse <<- xInv #set new inverse to xInv and store in parent 
    getInverse <- function() inverse
    list(set = set, get = get, 
         setInverse = setInverse,
         getInverse = getInverse)
    
}

#cacheSolve returns the inverse of the matrix object from makeCacheMatrix. 
#if the inverse is cached already we don't re-compute.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
cacheSolve <- function(matrix, ...) {
    inverse <- matrix$getInverse() #gets inverse from matrix object, 
    #if null we compute and store in parent envif not we use cached result 
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    else
    {
        data <- matrix$get()
        inverse <- solve(data,...)
    }
    matrix$setInverse(inverse) #store result in parent env
    inverse
}
