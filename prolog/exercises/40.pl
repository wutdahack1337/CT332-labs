% Áp dụng khung chương trình tìm kiếm theo chiều rộng hoặc sâu, giải bài toán 3 tu sĩ và 3 con quỷ

% marked(A, B, D, E) = "Trạng thái (A, B, D, E) đã được duyệt rồi"
:- dynamic(marked/4).
mark(A, B, D, E) :- assertz(marked(A, B, D, E)).

solve(Tst, Qt, Tsp, Qp) :-
    Tst =:= 3, Qt =:= 3,
    write('done!'), nl,
    !.

solve(Tst, Qt, Tsp, Qp) :-
    ((Tst > 0, Tst < Qt) ; (Tsp > 0, Tsp < Qp)),
    \+ marked(Tst, Qt, Tsp, Qp),
    mark(Tst, Qt, Tsp, Qp),
    write('wrong way!'), nl,
    fail.

solve(Tst, Qt, Tsp, Qp) :-
    \+ marked(Tst, Qt, Tsp, Qp),
    mark(Tst, Qt, Tsp, Qp),

    (
        % chuyen 2 quỷ từ bờ phải -> bờ trái
        (
            Qp >= 2,
            QpNew is Qp-2, QtNew is Qt+2,
            write((Tst, Qt, Tsp, Qp)), write(' -> '), write((Tst, QtNew, Tsp, QpNew)), nl,
            solve(Tst, QtNew, Tsp, QpNew)
        );

        % chuyển 2 quỷ từ bờ trái -> bờ phải
        (
            Qt >= 2,
            QtNew is Qt-2, QpNew is Qp+2,
            write((Tst, Qt, Tsp, Qp)), write(' -> '), write((Tst, QtNew, Tsp, QpNew)), nl,
            solve(Tst, QtNew, Tsp, QpNew)
        );

        % chuyen 2 tu si từ bờ phải -> bờ trái
        (
            Tsp >= 2, 
            TspNew is Tsp-2, TstNew is Tst+2,
            write((Tst, Qt, Tsp, Qp)), write(' -> '), write((TstNew, Qt, TspNew, Qp)), nl,
            solve(TstNew, Qt, TspNew, Qp)
        );

        % chuyen 2 tu si từ bờ trái -> bờ phải
        (
            Tst >= 2, 
            TstNew is Tst-2, TspNew is Tsp+2,
            write((Tst, Qt, Tsp, Qp)), write(' -> '), write((TstNew, Qt, TspNew, Qp)), nl,
            solve(TstNew, Qt, TspNew, Qp)
        );

        % chuyen 1 quy từ bờ phải -> bờ trái
        (
            Qp >= 1, 
            QpNew is Qp-1, QtNew is Qt+1, 
            write((Tst, Qt, Tsp, Qp)), write(' -> '), write((Tst, QtNew, Tsp, QpNew)), nl,
            solve(Tst, QtNew, Tsp, QpNew)
        );

        % chuyen 1 quy từ bờ trái -> bờ phải
        (
            Qt >= 1, 
            QtNew is Qt-1, QpNew is Qp+1, 
            write((Tst, Qt, Tsp, Qp)), write(' -> '), write((Tst, QtNew, Tsp, QpNew)), nl,
            solve(Tst, QtNew, Tsp, QpNew)
        );

        % chuyen 1 tu si từ bờ phải -> bờ trái
        (
            Tsp >= 1, 
            TspNew is Tsp-1, TstNew is Tst+1, 
            write((Tst, Qt, Tsp, Qp)), write(' -> '), write((TstNew, Qt, TspNew, Qp)), nl,
            solve(TstNew, Qt, TspNew, Qp)
        );

        % chuyen 1 tu si từ bờ trái -> bờ phải
        (
            Tst >= 1, 
            TstNew is Tst-1, TspNew is Tsp+1, 
            write((Tst, Qt, Tsp, Qp)), write(' -> '), write((TstNew, Qt, TspNew, Qp)), nl,
            solve(TstNew, Qt, TspNew, Qp)
        );

        % chuyen 1 quy 1 tu si từ bờ phải -> bờ trái
        (
            Qp >= 1, Tsp >= 1, 
            TspNew is Tsp-1, QpNew is Qp-1,
            TstNew is Tst+1, QtNew is Qt+1,
            write((Tst, Qt, Tsp, Qp)), write(' -> '), write((TstNew, QtNew, TspNew, QpNew)), nl,
            solve(TstNew, QtNew, TspNew, QpNew)
        );

        % chuyen 1 quy 1 tu si từ bờ trái -> bờ phải
        (
            Qt >= 1, Tsp >= 1, 
            TspNew is Tsp-1, QpNew is Qp+1,
            TstNew is Tst+1, QtNew is Qt-1,
            write((Tst, Qt, Tsp, Qp)), write(' -> '), write((TstNew, QtNew, TspNew, QpNew)), nl,
            solve(TstNew, QtNew, TspNew, QpNew)
        )
    ).