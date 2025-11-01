[[MATH360]]

this was a review on probability distributions

really looked at

*defn* a *probability* is the relative frequency of an event, a *probability distribution* is the collection of all probabilities $P(a \leq X \leq b)$ for $[a,b] \subset \mathbb{R}$


*defn* a probability density function gives the *probability* of an event occurring, in other words
$$
P(a \leq X \leq b) = \int_{a}^b f(x)dx
$$
where $f(x) >0$ and $\int_{-\infty}^\infty f(x)dx= 1$

the mean of a random variable is given as
$$
\mu  = \int_{-\infty}^\infty xf(x)dx
$$
and the variance is given as
$$
\sigma^{2} = \int_{-\infty}^\infty (x-\mu)^2 f(x) dx
$$
scaling and shifting, the rules just state that the pdf for a shift $f(x-b)$ and a scale $af(ax)$ exists so long as you just sub in a new value.
$$
\int_{-\infty}^\infty f(x-b)dx = \int_{-\infty}^\infty f(y) dy \leftarrow y=x-b, \quad dy=dx
$$
and
$$
\int_{-\infty}^\infty af(ax)dx = \int_{-\infty}^\infty f(y)dy \leftarrow y=ax, \quad dy=adx
$$
we can do this because both $b,a \in \mathbb{R}$ and $f(x-b), \quad af(ax) > 0$

**normal distributions**
- two kinds of distributions
*standard normal* which has a pdf, 
$$
f(x) = \large\frac{1}{\sqrt{ 2\pi }} e^{-x^2/2}
$$
scaling by $\large\frac{1}{\sigma}$ and $\large \mu$ we get the pdf of the *normal distribution* which has mean $\mu$ and variance $\sigma^{2}$
$$
f(x) = \large\frac{1}{\sigma \sqrt{ 2\pi }}e^{-(x-\mu)^{2}/2\sigma^{2}}
$$
note: the *standard* normal version is just when $\mu=0$ and $\sigma^{2}=1$
- $\mu$ controls the center of the distribution (makes sense its the mean)
- $\sigma^{2}$ controls the height of the peak of the distribution, (large $\sigma$ lower peak)

**uniform distributions**
has the pdf $f(x)$ defined as
$$
f(x) = \begin{cases}
\frac{1}{b-a}, \quad &  a \leq x \leq b \\
0, \quad  & otherwise
\end{cases}
$$
the mean and variance are then given by
$$
\mu = \frac{b+a}{2}, \quad \sigma^{2} = \frac{(b-a)^{2}}{12}
$$
its really just a rectangular area
**exponential distributions**
has only one parameter $\lambda$, the pdf is given as
$$
f(x) = \begin{cases}
\lambda e^{-\lambda x}, \quad & x\geq 0 \\
0, \quad & x < 0
\end{cases}
$$
the mean and the variance are given by
$$
\mu=\frac{1}{\lambda}, \quad \sigma^{2} = \frac{1}{\lambda^{2}}
$$
**gamma distributions**
has two parameters $\alpha$ and $\beta$, it has the pdf
$$
\large f(x) = \Large\begin{cases}
\frac{\beta^\alpha}{\Gamma(\alpha )} x^{\alpha-1}e^{-\beta x}, \quad & x  \geq 0, \\
0, \quad &x<0
\end{cases}
$$
where $\large \Gamma$ is the gamma function, the distribution is denoted by $\Gamma(\alpha, \beta)$.
- the Gamma function relates to the exponential distribution as
$$
Exp(\lambda) = \Gamma(1,\lambda)
$$
so the mean and variance of the gamma distribution is
$$
\mu = \frac{\alpha}{\beta}, \quad \sigma^{2} = \frac{\alpha}{\beta^{2}}
$$
given the mean and variance we can solve for $\alpha$ and $\beta$ with
$$
\alpha = \frac{\mu^{2}}{\sigma^{2}}, \quad \beta= \frac{\mu}{\sigma^{2} }
$$
we use `scipy.special.gamma` to get the function. 
