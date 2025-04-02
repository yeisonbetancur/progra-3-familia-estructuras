% Definición de estructura para personas
persona(nombre, genero).

% Definición de género
hombres([abraham, homero, herbert, bart, clancy]).
mujeres([mona, marge, patty, selma, lisa, maggie, jacqueline, ling]).

% Definición de relaciones familiares
padres([
    (abraham, [homero, herbert]),
    (clancy, [marge, patty, selma]),
    (homero, [bart, lisa, maggie])
]).

madres([
    (mona, [homero]),
    (marge, [bart, lisa, maggie]),
    (jacqueline, [marge, patty, selma]),
    (selma, [ling])
]).

%Definicion de una regla para acceder a los padres y sus hijos

padre_de(Padre, Hijo) :-
    padres(ListaPadres),
    member((Padre, Hijos), ListaPadres),
    member(Hijo, Hijos).
    
%Definicion de una regla para acceder a los padres y sus hijos

madre_de(Madre, Hijo) :-
    madres(ListaMadres),
    member((Madre, Hijos), ListaMadres),
    member(Hijo, Hijos).

%Definicion de regla para los abuelos 
abuelo_de(X,Y) :- padre_de(X,C), (padre_de(C,Y); madre_de(C,Y)), !.
abuela_de(X,Y) :- madre_de(X,C), (madre_de(C,Y); padre_de(C, Y)), !.

%Definicion de regla para los tios 

tio_de(X,Y) :- (padre_de(C, X), padre_de(C,Z), padre_de(Z, Y)), not(padre_de(X,Y)),!.
tia_de(X,Y) :- (madre_de(S, X), madre_de(S,P), madre_de(P, Y)), not(madre_de(X,Y)),!.

%Definicion de regla para los hermanos 

hermano_de(X,Y) :- (padre_de(C,X), padre_de(C,Y);madre_de(C,X), madre_de(C,Y)),X\=Y,!.

%Definicion de regla para los primos 

primo_de(X,Y) :- (padre_de(P1,X);madre_de(P1,X)),(padre_de(P2,Y);madre_de(P2,Y)),(hermano_de(P1,P2)),X\=Y,!.
prima_de(X,Y) :- (padre_de(P1,X);madre_de(P1,X)),(padre_de(P2,Y);madre_de(P2,Y)),(hermano_de(P1,P2)),X\=Y,!.

