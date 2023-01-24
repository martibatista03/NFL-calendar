## NFL-calendar

Organizing athe NFL ligue calendar can be considered an integer linear optimization problem, where the optimal solution is determined by the expected audience profit (which depends on the chosen dates). For this particular model, the restrictions that the calendar must follow are fundamentally random, but they could be easily replaceable for any others that make more sense on each context. 

The particular problem we want to solve is as it follows. We want a calendar where each team plays $r$ matches against each team in their division and $s$ matches against each team in the other division. This is the first group of restrictions. Note that in this calendar we need more than $n − 1$ days (if
no team rests, and all of them play every match day, we will need $r(n/2 − 1) + sn/2$ days). The second group of restrictions must ensure that each team does not play more than one game at a time on a single match day.

For all calendars that satisfy the above constraints, the objective function must give preference to those where intra-divisional matches are played towards the last days. To achieve this we define the coefficients $c_{ijk}$, which indicate the preference to play the match $(i, j)$ a match day $k$, as it follows:

![Captura de 2023-01-24 23-32-17](https://user-images.githubusercontent.com/71564709/214436005-e43ffcbe-728e-435a-b4f8-6da31b878918.png =300x)

Therefore, the formalization of this optimization problem is the following:

![Captura de 2023-01-24 23-21-04](https://user-images.githubusercontent.com/71564709/214434288-66b929c7-b543-443f-a0d3-eea355397e5f.png)
