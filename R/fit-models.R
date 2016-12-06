library(rstan)
library(dplyr)
library(bayesplot)

# Load and bundle data ----------------------------------------------------
d <- read.csv("data/all_years.csv", stringsAsFactors = FALSE)

summ_d <- d %>%
  mutate(player = gsub("\\*", "", player)) %>%
  group_by(player) %>%
  summarize(fta = sum(fta), 
            ftm = sum(ft)) %>%
  filter(fta > 0)

stan_d <- list(n = nrow(summ_d), 
               y = summ_d$ftm, 
               k = summ_d$fta)

# Compile and fit model ---------------------------------------------------
rstan_options(auto_write = TRUE)
mod <- stan_model("R/model.stan", verbose = TRUE)
fit <- sampling(object = mod, data = stan_d, cores = 2, 
                  iter = 1000, chains = 4)

# evaluate convergence
posterior <- rstan::extract(fit, inc_warmup = FALSE, permuted = FALSE)
mcmc_trace(posterior,  
           pars = c("sigma", "mu"), 
           facet_args = list(nrow = 2, labeller = label_parsed))

# save model output
post <- rstan::extract(fit)
