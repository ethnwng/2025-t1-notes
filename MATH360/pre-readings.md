[[MATH360]]

### sept. 11 Modelling Processes
Like writing a paper there is a structure to models.

**1. Problem Statement:** problems are open-ended, having a clear problem statement makes it more clear on the end goal

**2. Variables and Parameters:** 
*defn* a variable is an unknown quantity. They can be either *independent* or *dependent*.

*defn* a independent variable is an unknown quantity that is an *input to a system*

*defn* a dependent variable is an unknown quantity that is an *output to a system* *given* some independent variable 

*defn* a parameter are quantities that appear from the relationships between variables

*defn* (?) a dimension is things like length, time, mass


**3. Assumptions and Constraints:** setting assumptions is done to reduce the complexity of the overall problem, constraints further outline the problem statement

**4. Building Solutions:** the tools used to actually make the model as well as the type of model being used (stochastic, deterministic, data-driven)

**5. Analysis and Validation:** interpreting the created model and assessing the overall quality of the model. ask our selves
- does the solution make sense wit respect to the problem
- does the solution answer the problem
- are the results reasonable/practical
if there are errors we work backwards to find the issue

**6. Reporting:** just write a paper on it or something


## sept 15 - review of diff. equations
review of 215

**first order equation**
of the form
$$
y' +p(t)y = q(t)
$$
for some $p(t), q(t)$. 

*solving* the equation is just finding some $y$ such that $y'$ is equal to the original question.

*ex:* 
$$
y' + y = \cos(t)
$$
has solution
$$
y(t) = Ce^{-t} + \frac{\cos(t)+\sin(t)}{2 }
$$
solve for $C$ given some initial value, let $t=0$ then
$$
y(0) = C +\frac{1}{2} 
$$
then for ranges of initial values $y(0) = -3, -2, -1, 0, 1,2,3$ we can plot the functions to get

![[Pasted image 20250915151922.png]]

for each initial value the function tends to the general solution
$$
y(t) = \frac{\cos(t) + \sin(t)}{2}
$$

**separable equations**
first order equations of the form
$$
y' = p(t)q(y)
$$
are called separable, main thing to notice is that the functions $p,q$ have different independent variables

you can solve using the separation rule. 

**autonomous equations**
first order equations of the form
$$
y' = f(y)
$$
where the right hand side of the equation does not depend on the independent variable $t$. This could also be thought of when $p(t)=1$ or $p(t) = k$ for some constant $k$

Note that these equations are considered *separable* 

**slope fields**
sometimes we cannot get a general solution but we can *approximate* solutions using slope fields

a slope field is a graphical method of analyzing the solution of a first order diff. equation

*main idea* the plot of $y' = f(t,y)$ shows the slope of $y$ at every single point even if we do not know $y$. 

We can just draw small lines of slopes for each $(t,y)$ pair. 
![[Pasted image 20250915153600.png]]

- for each pair $(t,y)$ in the grid, we plug that into $y' = f(t,y)$ and draw a small slope line at that point
- if u do that for every single point it gives a general shape of $y$

**eulers method**
another *approximation* method is eulers method which is pretty much the formula:

given,
$$
y' = f(t,y), \quad y(t_{0}) = y_{0}
$$
we construct the tangent line to the unknown function
$$
y= y(t_{0}) + f(t_{0},y_{0})(t-t_{0})
$$
where $y'(t_{0})=f(t_{0},y_{0})$ is the slope of $y(t)$ at $t=t_{0}$

then we use the line created to estimate $y_{1}$ given a small step $h$ in $t$ so $t_{1} = t_{0}+h$ and
$$
y_{1} = y_{0} + f(t_{0},y_{0})(t_{1}-t_{0})
$$
*generalized* we get that eulers formula is
$$
y_{n+1} = y_{n} + f(t_{n},y_{n})(t_{n+1} - t_{n}), \quad y_{0} = y(t_{0})
$$
where $y_{n} \approx y(t_{n})$ for each $n$. 

choose equally spaced $t$ values the final thing becomes
$$
y_{n+1} = y_{n} + f(t_{n}, y_{n})h, \quad t_{n} = t_{0} + nh
$$
with $h = t_{n+1}- t_{n}$ so if we do $N$ iterations of eulers method from $t_{0}$ to $t_{f}$ we get that $h$ should be
$$
h = \frac{t_{f}-t_{0}}{N}
$$
