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

