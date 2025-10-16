% Định nghĩa vị từ tính số fibonacci thứ N.

fibo(N) :- solve(2, N, 0, 1).

solve(I, N, A, B) :-
    N =:= 1,
    write('fibonacci = '), write(A).

solve(I, N, A, B) :-
    N =:= 2,
    write('fibonacci = '), write(B).

solve(I, N, A, B) :-
    I > N,
    write('fibonacci = '), write(A).

solve(I, N, A, B) :-
    I =< N,
    BNew is A + B,
    ANew is B,
    INew is I + 1,
    solve(INew, N, ANew, BNew).