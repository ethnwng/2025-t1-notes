[[MATH360]]

*motivation:* we have a random variable with a bunch of data points. what is the partial density function for this random variable? what is the distribution of the rv?

we have to options:
- plot the histogram (bad)
- use kernal density equation

*histograms* are bad for small sized data sets because the choice of *bin* matters alot to the perceived distribution of the data

instead we use a KDF since its a *functional* way to use the *datapoints* to create an *estimate* for the distribution.

**four kernals to remember**
*triangular:*
$$
K(x) = \begin{cases}
1-|x|, \quad  & |x| \leq {1} \\
0, \quad & x > 1
\end{cases}
$$
*rectangular:*
$$
K(x) = \begin{cases}
\frac{1}{2}, \quad  & |x| \leq 1 \\
0, \quad  &  x > 1
\end{cases}
$$
*gaussian:*
$$
K(x) = \frac{1}{\sqrt{ 2\pi }}e^{-x^{2}/2}
$$
*parabolic:*
$$
K(x) = \begin{cases}
\frac{3}{4}(1-x^{2}), \quad  &  |x| \leq 1 \\
0, \quad  &  x>1
\end{cases}
$$
the use is dependent on the problem

the difference between the three is the function shape, you can guess what they look like based of their names

The **Kernal Density Function** is defined as
$$
\hat{f_{h}(x)} = \frac{1}{Nh}\large \sum_{i=1}^N K\left( \frac{x-x_i}{h} \right)
$$
where $K$ is one of the kernals defined above, $N$ is the sample size, and $h$ is the *bandwidth* pretty much the smoothing constant
- larger $h$ more smooth the function will be, but the more smooth it is less of the data is represented
- $h$ ranges from $0,1$
