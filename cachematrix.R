## Functions to store a matrix and cache it's inverse.

## Stores a matrix and it's inverse as a list

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y = matrix()) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(
    set = set, get = get,
    setsolve = setsolve,
    getsolve = getsolve
  )
}

## Solves the inverse of the matrix defined in the function above.
## Retrieves from cache if able, otherwise calculates.

cacheSolve <- function(x) {
  s <- x$getsolve()
  if (!is.null(s)) {
    message("retrieving cache")
    return(s)
  }
  matrix <- x$get()
  s <- solve(matrix)
  x$setsolve(s)
  s
}
