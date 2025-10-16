% Định nghĩa vị từ luythua cho phép tính a lũy thừa n. Ví dụ: luythua(2, 3, X) sẽ cho kết quả X = 8.

luythua(X, N, Ans) :-
    N =:= 0,
    write('X = '), write(Ans).

luythua(X, N, Ans) :-
    N > 0,
    AnsNew is Ans * X,
    NNew is N - 1,
    luythua(X, NNew, AnsNew).