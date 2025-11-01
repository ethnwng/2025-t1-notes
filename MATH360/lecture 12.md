[[MATH360]]

#### Monte Carlo Simulations
Given some stochastic problem (a problem where randomness is a factor), monte-carlo is just *continuously* random sampling $n$ times to see what patterns arise.

- Monte-Carlo is very time and compute expensive
- Can be the best method for a problem (high dimension integration) but also because of its cost not always the best

steps for these problems
- create a function that *generates* the random event we want normally just returning a random value from one of the distributions
- take those points and create a histogram to get the probability distribution
