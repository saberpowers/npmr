pkgname <- "npmr"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('npmr')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("Vowel")
### * Vowel

flush(stderr()); flush(stdout())

### Name: Vowel
### Title: Vowel Recognition
### Aliases: Vowel
### Keywords: datasets

### ** Examples

data(Vowel)
summary(Vowel)



cleanEx()
nameEx("cv.npmr")
### * cv.npmr

flush(stderr()); flush(stdout())

### Name: cv.npmr
### Title: Cross-validated nuclear penalized multinomial regression
### Aliases: cv.npmr
### Keywords: ~kwd1 ~kwd2

### ** Examples

#   Fit NPMR to simulated data

K = 5
n = 1000
m = 10000
p = 10
r = 2

# Simulated training data
set.seed(8369)
A = matrix(rnorm(p*r), p, r)
C = matrix(rnorm(K*r), K, r)
B = tcrossprod(A, C)            # low-rank coefficient matrix
X = matrix(rnorm(n*p), n, p)    # covariate matrix with iid Gaussian entries
eta = X 
P = exp(eta)/rowSums(exp(eta))
Y = t(apply(P, 1, rmultinom, n = 1, size = 1))
fold = sample(rep(1:10, length = nrow(X)))

# Simulate test data
Xtest = matrix(rnorm(m*p), m, p)
etatest = Xtest 
Ptest = exp(etatest)/rowSums(exp(etatest))
Ytest = t(apply(Ptest, 1, rmultinom, n = 1, size = 1))

# Fit NPMR for a sequence of lambda values without CV:
fit2 = cv.npmr(X, Y, lambda = exp(seq(7, -2)), foldid = fold)

# Print the NPMR fit:
fit2

# Produce a biplot:
plot(fit2)

# Compute mean test error using the predict function:
-mean(log(rowSums(Ytest*predict(fit2, Xtest))))



cleanEx()
nameEx("npmr-package")
### * npmr-package

flush(stderr()); flush(stdout())

### Name: npmr-package
### Title: Nuclear penalized multinomial regression
### Aliases: npmr-package
### Keywords: package

### ** Examples

#   Fit NPMR to simulated data

K = 5
n = 1000
m = 10000
p = 10
r = 2

# Simulated training data
set.seed(8369)
A = matrix(rnorm(p*r), p, r)
C = matrix(rnorm(K*r), K, r)
B = tcrossprod(A, C)            # low-rank coefficient matrix
X = matrix(rnorm(n*p), n, p)    # covariate matrix with iid Gaussian entries
eta = X 
P = exp(eta)/rowSums(exp(eta))
Y = t(apply(P, 1, rmultinom, n = 1, size = 1))

# Simulate test data
Xtest = matrix(rnorm(m*p), m, p)
etatest = Xtest 
Ptest = exp(etatest)/rowSums(exp(etatest))
Ytest = t(apply(Ptest, 1, rmultinom, n = 1, size = 1))

# Fit NPMR for a sequence of lambda values without CV:
fit2 = npmr(X, Y, lambda = exp(seq(7, -2)))

# Print the NPMR fit:
fit2

# Produce a biplot:
plot(fit2, lambda = 20)

# Compute mean test error using the predict function (for each value of lambda):
getloss = function(pred, Y) {
    -mean(log(rowSums(Y*pred)))
}
apply(predict(fit2, Xtest), 3, getloss, Ytest)



cleanEx()
nameEx("npmr")
### * npmr

flush(stderr()); flush(stdout())

### Name: npmr
### Title: Nuclear penalized multinomial regression
### Aliases: npmr
### Keywords: ~kwd1 ~kwd2

### ** Examples

#   Fit NPMR to simulated data

K = 5
n = 1000
m = 10000
p = 10
r = 2

# Simulated training data
set.seed(8369)
A = matrix(rnorm(p*r), p, r)
C = matrix(rnorm(K*r), K, r)
B = tcrossprod(A, C)            # low-rank coefficient matrix
X = matrix(rnorm(n*p), n, p)    # covariate matrix with iid Gaussian entries
eta = X 
P = exp(eta)/rowSums(exp(eta))
Y = t(apply(P, 1, rmultinom, n = 1, size = 1))

# Simulate test data
Xtest = matrix(rnorm(m*p), m, p)
etatest = Xtest 
Ptest = exp(etatest)/rowSums(exp(etatest))
Ytest = t(apply(Ptest, 1, rmultinom, n = 1, size = 1))

# Fit NPMR for a sequence of lambda values without CV:
fit2 = npmr(X, Y, lambda = exp(seq(7, -2)))

# Print the NPMR fit:
fit2

# Produce a biplot:
plot(fit2, lambda = 20)

# Compute mean test error using the predict function (for each value of lambda):
getloss = function(pred, Y) {
    -mean(log(rowSums(Y*pred)))
}
apply(predict(fit2, Xtest), 3, getloss, Ytest)



cleanEx()
nameEx("plot.cv.npmr")
### * plot.cv.npmr

flush(stderr()); flush(stdout())

### Name: plot.cv.npmr
### Title: Visualize the regression coefficient matrix fit by
###   cross-validated NPMR
### Aliases: plot.cv.npmr
### Keywords: ~kwd1 ~kwd2

### ** Examples

#   Fit NPMR to simulated data

K = 5
n = 1000
m = 10000
p = 10
r = 2

# Simulated training data
set.seed(8369)
A = matrix(rnorm(p*r), p, r)
C = matrix(rnorm(K*r), K, r)
B = tcrossprod(A, C)            # low-rank coefficient matrix
X = matrix(rnorm(n*p), n, p)    # covariate matrix with iid Gaussian entries
eta = X 
P = exp(eta)/rowSums(exp(eta))
Y = t(apply(P, 1, rmultinom, n = 1, size = 1))
fold = sample(rep(1:10, length = nrow(X)))

# Simulate test data
Xtest = matrix(rnorm(m*p), m, p)
etatest = Xtest 
Ptest = exp(etatest)/rowSums(exp(etatest))
Ytest = t(apply(Ptest, 1, rmultinom, n = 1, size = 1))

# Fit NPMR for a sequence of lambda values without CV:
fit2 = cv.npmr(X, Y, lambda = exp(seq(7, -2)), foldid = fold)

# Produce a biplot:
plot(fit2)



cleanEx()
nameEx("plot.npmr")
### * plot.npmr

flush(stderr()); flush(stdout())

### Name: plot.npmr
### Title: Visualize the regression coefficient matrix fit by
###   cross-validated NPMR
### Aliases: plot.npmr
### Keywords: ~kwd1 ~kwd2

### ** Examples

#   Fit NPMR to simulated data

K = 5
n = 1000
m = 10000
p = 10
r = 2

# Simulated training data
set.seed(8369)
A = matrix(rnorm(p*r), p, r)
C = matrix(rnorm(K*r), K, r)
B = tcrossprod(A, C)            # low-rank coefficient matrix
X = matrix(rnorm(n*p), n, p)    # covariate matrix with iid Gaussian entries
eta = X 
P = exp(eta)/rowSums(exp(eta))
Y = t(apply(P, 1, rmultinom, n = 1, size = 1))

# Simulate test data
Xtest = matrix(rnorm(m*p), m, p)
etatest = Xtest 
Ptest = exp(etatest)/rowSums(exp(etatest))
Ytest = t(apply(Ptest, 1, rmultinom, n = 1, size = 1))

# Fit NPMR for a sequence of lambda values without CV:
fit2 = npmr(X, Y, lambda = exp(seq(7, -2)))

# Produce a biplot:
plot(fit2, lambda = 20)



cleanEx()
nameEx("predict.cv.npmr")
### * predict.cv.npmr

flush(stderr()); flush(stdout())

### Name: predict.cv.npmr
### Title: Make predictions from a "cv.npmr" object
### Aliases: predict.cv.npmr
### Keywords: ~kwd1 ~kwd2

### ** Examples

#   Fit NPMR to simulated data

K = 5
n = 1000
m = 10000
p = 10
r = 2

# Simulated training data
set.seed(8369)
A = matrix(rnorm(p*r), p, r)
C = matrix(rnorm(K*r), K, r)
B = tcrossprod(A, C)            # low-rank coefficient matrix
X = matrix(rnorm(n*p), n, p)    # covariate matrix with iid Gaussian entries
eta = X 
P = exp(eta)/rowSums(exp(eta))
Y = t(apply(P, 1, rmultinom, n = 1, size = 1))
fold = sample(rep(1:10, length = nrow(X)))

# Simulate test data
Xtest = matrix(rnorm(m*p), m, p)
etatest = Xtest 
Ptest = exp(etatest)/rowSums(exp(etatest))
Ytest = t(apply(Ptest, 1, rmultinom, n = 1, size = 1))

# Fit NPMR for a sequence of lambda values without CV:
fit2 = cv.npmr(X, Y, lambda = exp(seq(7, -2)), foldid = fold)

# Compute mean test error using the predict function:
-mean(log(rowSums(Ytest*predict(fit2, Xtest))))



cleanEx()
nameEx("predict.npmr")
### * predict.npmr

flush(stderr()); flush(stdout())

### Name: predict.npmr
### Title: Make predictions from a "npmr" object
### Aliases: predict.npmr
### Keywords: ~kwd1 ~kwd2

### ** Examples

#   Fit NPMR to simulated data

K = 5
n = 1000
m = 10000
p = 10
r = 2

# Simulated training data
set.seed(8369)
A = matrix(rnorm(p*r), p, r)
C = matrix(rnorm(K*r), K, r)
B = tcrossprod(A, C)            # low-rank coefficient matrix
X = matrix(rnorm(n*p), n, p)    # covariate matrix with iid Gaussian entries
eta = X 
P = exp(eta)/rowSums(exp(eta))
Y = t(apply(P, 1, rmultinom, n = 1, size = 1))

# Simulate test data
Xtest = matrix(rnorm(m*p), m, p)
etatest = Xtest 
Ptest = exp(etatest)/rowSums(exp(etatest))
Ytest = t(apply(Ptest, 1, rmultinom, n = 1, size = 1))

# Fit NPMR for a sequence of lambda values without CV:
fit2 = npmr(X, Y, lambda = exp(seq(7, -2)))

# Compute mean test error using the predict function (for each value of lambda):
getloss = function(pred, Y) {
    -mean(log(rowSums(Y*pred)))
}
apply(predict(fit2, Xtest), 3, getloss, Ytest)



cleanEx()
nameEx("print.cv.npmr")
### * print.cv.npmr

flush(stderr()); flush(stdout())

### Name: print.cv.npmr
### Title: summarize a "cv.npmr" object
### Aliases: print.cv.npmr
### Keywords: ~kwd1 ~kwd2

### ** Examples

#   Fit NPMR to simulated data

K = 5
n = 1000
m = 10000
p = 10
r = 2

# Simulated training data
set.seed(8369)
A = matrix(rnorm(p*r), p, r)
C = matrix(rnorm(K*r), K, r)
B = tcrossprod(A, C)            # low-rank coefficient matrix
X = matrix(rnorm(n*p), n, p)    # covariate matrix with iid Gaussian entries
eta = X 
P = exp(eta)/rowSums(exp(eta))
Y = t(apply(P, 1, rmultinom, n = 1, size = 1))
fold = sample(rep(1:10, length = nrow(X)))

# Simulate test data
Xtest = matrix(rnorm(m*p), m, p)
etatest = Xtest 
Ptest = exp(etatest)/rowSums(exp(etatest))
Ytest = t(apply(Ptest, 1, rmultinom, n = 1, size = 1))

# Fit NPMR for a sequence of lambda values without CV:
fit2 = cv.npmr(X, Y, lambda = exp(seq(7, -2)), foldid = fold)

# Print the NPMR fit:
fit2



cleanEx()
nameEx("print.npmr")
### * print.npmr

flush(stderr()); flush(stdout())

### Name: print.npmr
### Title: Summarize a "npmr" object
### Aliases: print.npmr
### Keywords: ~kwd1 ~kwd2

### ** Examples

#   Fit NPMR to simulated data

K = 5
n = 1000
m = 10000
p = 10
r = 2

# Simulated training data
set.seed(8369)
A = matrix(rnorm(p*r), p, r)
C = matrix(rnorm(K*r), K, r)
B = tcrossprod(A, C)            # low-rank coefficient matrix
X = matrix(rnorm(n*p), n, p)    # covariate matrix with iid Gaussian entries
eta = X 
P = exp(eta)/rowSums(exp(eta))
Y = t(apply(P, 1, rmultinom, n = 1, size = 1))

# Simulate test data
Xtest = matrix(rnorm(m*p), m, p)
etatest = Xtest 
Ptest = exp(etatest)/rowSums(exp(etatest))
Ytest = t(apply(Ptest, 1, rmultinom, n = 1, size = 1))

# Fit NPMR for a sequence of lambda values without CV:
fit2 = npmr(X, Y, lambda = exp(seq(7, -2)))

# Print the NPMR fit:
fit2



### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
