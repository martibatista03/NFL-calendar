
# Conjunt dels equips de la lliga
set EQUIPS;

# Nombre d'equips a la lliga
param n = card(EQUIPS);

param r >= 0; # Partits intradivisionals
param s >= 0; # Partits interdivisionals

# Conjunt de jornades jugades
set JORNADES := 1..(r * ((n/2) - 1) + s * (n/2));

# Variable binària de decisió, associada als dos equips involucrats (i, j)
# i a la jornada k en què el partit es disputa.
var x {JORNADES, EQUIPS, EQUIPS} binary;

# Maximitzem la funció objectiu
maximize total:
	# Nota: Posem (i+1) com a inici del sumatori de j per descartar que un 
	# 		equip jugui contra si mateix i evitar repeticions.
	sum{k in JORNADES} sum{i in 1..n} sum{j in (i+1)..n}
		# En cas que el calendari superi ja la primera jornada, els partits
		# intradivisionals són més valorats, sumant a la funció 2^{k-2}.
		if (k > 1 and ((i <= n/2 and j <= n/2) or (i > n/2 and j > n/2))) 
			then (2 ** (k - 2)) * x[k,i,j]  else 0;

# Un equip només pot jugar un partit per jornada
subject to constriccio_1 {i in 1..n, k in JORNADES}:  
	sum{j in 1..n} x[k,i,j] = 1;

# Cada equip ha de jugar r vegades contra la resta de la seva divisió (Nord)
subject to constriccio_2 {i in 1..(n/2), j in (i+1)..(n/2)}:  
	sum{k in JORNADES} x[k,i,j] = r;

# Cada equip ha de jugar r vegades contra la resta de la seva divisió (Sud) 
subject to constriccio_3 {i in ((n/2)+1)..n, j in (i+1)..n}:
	sum{k in JORNADES} x[k,i,j] = r;

# Cada equip ha de jugar s vegades contra cadascun de la divisió contrària
subject to constriccio_4 {i in 1..(n/2), j in ((n/2)+1)..n}:
	sum{k in JORNADES} x[k,i,j] = s;

# Tenir en compte que si un equip juga contra un altre, l'altre juga contra l'un
subject to constriccio_5 {i in 1..n, j in i+1..n, k in JORNADES}:
	x[k,i,j] = x[k,j,i];

	

	