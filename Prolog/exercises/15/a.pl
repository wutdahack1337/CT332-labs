% Viết chương trình giải phương trình bậc nhất trong Prolog

solve(A, B) :- A =\= 0, X is -B/A, write(X).
solve(A, B) :- A =:= 0, consider(B).

consider(B) :- B =\= 0, write('No solution').
consider(B) :- B =:= 0, write('oo solutions').