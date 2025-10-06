[[MATH360]]

Q: what is the dimensions of a derivative $\frac{dx}{dt}$?
A: $x$ over $t$ 

*pf:* 
$$
\implies \frac{dx}{dt} \bigg| _{t=\infty} = \lim_{  t \to  \infty } \frac{x(t)-x(t_{0})}{t-t_{0}} \to \frac{[x]}{[t]}
$$

what about $\frac{d^{2}x}{dt^{2}}$?
$$
\implies \frac{d^{2}x}{dt^{2}} \bigg| _{t=\infty} = \lim_{  t \to  \infty } \frac{x'(t)-x'(t_{0})}{t-t_{0}} \to \frac{[x]/[t]}{[t]} = \frac{[x]}{[t]^{2}}
$$
so generally we have that
$$
\left[ \frac{d^nx}{dt^n} \right] = \frac{[x]}{[t]^n}
$$

a *base quantity* are measurements that are not derived from anything else (time, length, mass, ...)

in contrast a *derived quantity* is a measurement that is calculated using the *base quantity* (velocity, acceleration, area)

Why do we nondimensionalize our models?
1. Removes the units
2. Reduces the number of parameters
3. Maps the solution space to a $|x|$ grid

**ex:** mass spring damper system
$$
mx'' + cx' + kx = f_{0}\cos(\omega t), \quad x(0)=0, x'(0) = 0
$$
**step 1:** identify the *independent* and *dependent* variables
- independent: $t$ $\to$ time ($T$)
- dependent: $x$ $\to$ position ($L$)

**step 2:** Let $t=t^*[t]$ and $x=x^*[x]$
- $x^*$ is the *value* of $x$
- $[x]$ is the *units* of $x$
	- since $x$ is a position with units $L$ if we had say $x=2m$ then
	- $x^* = 2$ and $[x]=L$
plug in $[x]x^*$ and $[t]t^*$ into 
$$
mx'' + cx' +kx = f_{0}\cos(\omega t) \\ \\
$$
$$
\begin{align}
&\implies m \frac{[x]}{[t]^{2}} \frac{d^{2}x^*}{dt^{*2}} + c \frac{[x^*]}{[t^*]} +k[x]x^* = f_{0}\cos(\omega [t]t^*)
\end{align}
$$
and dont forget the initial conditions
$$
[x]x^*(0) = 0, \quad \frac{[x]}{[t]} \frac{dx^*}{dt^*2} ( 0) = 0
$$

**step 3:** divide by term infront of highest order 
- here highest order is $\frac{d^{2}x^*}{dt^{*2} }$ so divide by $m \frac{[x]}{[t]^{2}}$
$$
\frac{d^{2}x^*}{dt^{*2}} + \frac{c}{m} \frac{[x]}{[t]} \frac{[t]^{2}}{[x]} \frac{dx^*}{dt^*} + \frac{k}{m} [x] \frac{[t]^{2}}{[x]} =\frac{1}{m} \frac{[t]^{2}}{[x]} f_{0} \cos(\omega [t]t^*)
$$
and after cancelling
$$
\frac{d^{2}x^*}{dt^{*2}} + \frac{c}{m}[t] \frac{dx^*}{dt^*} + \frac{k}{m} [t]^{2} x^* = \frac{f_{0}}{m} \frac{[t]^{2}}{[x]} \cos (\omega [t]t^*)
$$

**step 4:** we want terms to *go to one* meaning we want to force coefficients infront of units to cancel.
$$
\begin{align}
\frac{c}{m} [t]  & \implies [t] = \frac{m}{c} \\
\frac{k}{m}[t]^{2}  & \implies [t] = \sqrt{ \frac{m}{k} } \\
w[t]  & \implies [t] = \frac{1}{\omega}
\end{align}
$$
- since we have $[t]= \dots$  we need the $\dots$ to be units of time $T$ so for $\omega$we have that
$$
\frac{1}{\omega} \text{ has units} \left[ \frac{1}{\omega} \right] \implies \left[ \frac{1}{\frac{1}{T}} \right] = T
$$


*Due to the context of the problem* (this is a mass spring damped equation)
- we are interested when $c\to0$ (the friction coefficient going to zero)
- so because of this context it is not ideal to pick $[t] = \frac{m}{c}$ since as $c\to0$ we will get some issues

so lets use $[t] = \sqrt{ \frac{m}{k} }$. substitute into the equation

$$
\implies\frac{d^{2}x^*}{dt^{*2}} + \frac{c}{m}\sqrt{ \frac{m}{k} } \frac{dx^*}{dt^*} + \frac{k}{m} \sqrt{ \frac{m}{k} }^{2} x^* = \frac{f_{0}}{m} \frac{\sqrt{ \frac{m}{k} }^{2}}{[x]} \cos \left( \omega \sqrt{ \frac{m}{k} }t^* \right)
$$
$$
\implies \frac{d^{2}x^*}{dt^{*2}} + \frac{c}{\sqrt{ mk }} \frac{dx^*}{dt^*} + x^* = \frac{f_{0}}{k} \frac{1}{[x]} \cos \left( \omega \sqrt{ \frac{m}{k} }t^* \right)
$$
now let $\Gamma = \frac{c}{\sqrt{ mk }}$ then our final nondimensionalized is
$$
\implies \frac{d^{2}x^*}{dt^{*2}} + \Gamma  \frac{dx^*}{dt^*} + x^* =\frac{f_{0}}{} \cos\left( \omega \sqrt{ \frac{m}{k} } t^* \right)
$$
why cant we pick $[t] = 1$?

by definition $t=[t]t^*$ so then $t=t^*$. but we have that $t$ has dimensions but $t^*$ does not have dimensions. So contradiction

what if $[t]$ or $[x]$ completely cancel from the $DE$? (unlucky case)
- get scaling factor from the initial conditions (solves most of the time) 
OR
- *go back to the context of the problem* look for a natural scaler

