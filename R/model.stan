data {
  int<lower = 1> n;
  int<lower = 0> y[n];
  int<lower = 1> k[n];
}
parameters {
  real mu;
  real<lower = 0> sigma;
  vector[n] theta;
}
model {
  theta ~ normal(mu, sigma);
  y ~ binomial_logit(k, theta);
}
