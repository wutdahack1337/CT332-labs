% Viết chương trình kiểm tra n có phải là số nguyên tố?

% 2 -> n-1
solve(N) :- isPrime(2, N).

isPrime(I, N) :-
    I < N,
    R is N mod I, R =:= 0,
    write(N),
    write(' is not prime.').

isPrime(I, N) :-
    I < N,
    write(I), nl,
    NextI is I + 1,
    isPrime(NextI, N).

isPrime(I, N) :-
    I =:= N,
    write(N),
    write(' is prime').