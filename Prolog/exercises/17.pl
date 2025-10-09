% Viết chương trình giải bài toán tháp Hà Nội

hanoitower(N) :- solve(N, a, b, c).

% A -> C
solve(N, A, B, C) :-
    N =:= 1,
    write(A), write(' -> '), write(C), nl.

solve(N, A, B, C) :-
    N > 1,
    NNew is N-1,
    solve(NNew, A, C, B),
    solve(1, A, B, C),
    solve(NNew, B, A, C).