# Set MKL threads if Revolution R Open or Revoltion R Enterprise is available
########if(require(Revobase)){
######## setMKLthreads(4)
########}

# Initialization
set.seed (1)
m <- 10000
n <- 5000
A <- matrix (runif (m*n),m,n)

# Matrix multiply
cat("Matrix multiply\n")
system.time (B <- crossprod(A))

# Cholesky Factorization
cat("Cholesky Factorization\n")
system.time (C <- chol(B))

# Singular Value Decomposition
cat("Singular Value Decomposition\n")
m <- 10000
n <- 2000
A <- matrix (runif (m*n),m,n)
system.time (S <- svd (A,nu=0,nv=0))

# Principal Components Analysis
cat("Principal Components Analysis\n")
m <- 10000
n <- 2000
A <- matrix (runif (m*n),m,n)
system.time (P <- prcomp(A))

# Linear Discriminant Analysis
cat("Linear Discriminant Analysis\n")
library('MASS')
g <- 5
k <- round (m/2)
A <- data.frame (A, fac=sample (LETTERS[1:g],m,replace=TRUE))
train <- sample(1:m, k)
system.time (L <- lda(fac ~., data=A, prior=rep(1,g)/g, subset=train))
