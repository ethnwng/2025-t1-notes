[[MATH360]]

pre-reading review

##### The Modelling Process
1. problem statement; one sentence
2. variables + parameters
3. assumptions + constraints; an assumption governs the relationship, a constraint is the values that are allowed
4. build solutions; simulations, paper, formulas 
5. analyze + assess;


**example:**
*Gas prices change on a daily basis and not every gas station offers the same price: the cheapest gas station may be across town.*

Is it worth the drive across town for less expensive gas?

1. **problem statement:** Determine which is cheaper: buying gas that is nearby or gas that is out of the way
2. **variables + params**
	- price at station A: $P_{A}$ in $/L
	- price at station B: $P_{B}$ in $/L
	- distance between station A & B: $k$ km
	- price difference between stations: $S$ $
	- cost to travel to station B: $T$ $
	- amount of gas: $n$ L
	- fuel economy: $f_{e}$ km/L
3. **assumptions + constraints**
	- there exists a cheaper gas station out of the way
	- we are buying the same amount of gas
	- we have enough gas to get to either station
	- car burns constant amount of gas
	- we are starting at station A and then going to station B
	- we have to return to station A after going to station B
4. **model**

define
$$
S = (P_{A} - P_{B}) \cdot n 
$$
units of $
$$
T = \frac{2k\cdot P_{B}}{f_{e}}
$$
so what we are saying is:

*if $S$ > $T$ then its better to go to $B$ else should go to $A$*

5. **analysis & assessment**
are the assumptions reasonable?
- include time
- remove constant fuel efficiency $f_{e}$ and fuelling amount $n$
- include a convenience factor
- 
