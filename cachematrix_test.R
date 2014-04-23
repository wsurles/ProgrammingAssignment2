##| test cacheMatrix functions

source('cachematrix.R')

mat <- matrix(1:4,2)

solve(mat)  # Calculates inverse of matrix
# [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5

a <- makeCacheMatrix(matrix(1:4,2))

a$get()
# [,1] [,2]
# [1,]    1    3
# [2,]    2    4

a$getInverse()
# NULL

a$set(matrix(5:8,2))
a$get()
# [,1] [,2]
# [1,]    5    7
# [2,]    6    8

cacheSolve(a)
# [,1] [,2]
# [1,]   -4  3.5
# [2,]    3 -2.5
 
cacheSolve(a)
# getting cached data
# [,1] [,2]
# [1,]   -4  3.5
# [2,]    3 -2.5

a$getInverse()
# [,1] [,2]
# [1,]   -4  3.5
# [2,]    3 -2.5

#test inverse correctness
b = a$getInverse()
a$get() %*% b     #matrix multiplication should show identity matrix
# [,1]         [,2]
# [1,]    1 3.552714e-15
# [2,]    0 1.000000e+00
