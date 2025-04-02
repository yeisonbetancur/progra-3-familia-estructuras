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

