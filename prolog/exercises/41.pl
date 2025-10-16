% Áp dụng khung chương trình tìm kiếm theo chiều rộng hoặc sâu, giải bài toán dê, sói và bắp cải.

% marked(A, B, C, D) = "Trạng thái (A, B, C, D) đã được duyệt rồi"
:- dynamic(marked/4).
mark(A, B, C, D) :- assertz(marked(A, B, C, D)).

solve(S, D, C, T) :-
    S =:= 1, D =:= 1, C =:= 1, T =:= 1,
    write('done!'), nl,
    !.

solve(S, D, C, T) :-
    ( (S =:= D, T =\= S); (D =:= C, T =\= D)),
    \+ marked(S, D, C, T),
    mark(S, D, C, T),
    write('wrong way!'), nl,
    fail.

% Thuyen ben phai (T == 1)
solve(S, D, C, T) :-
    T =:= 1,

    \+ marked(S, D, C, T),
    mark(S, D, C, T),

    (
        % chuyen soi
        (
            S =:= 1,
            write((S, D, C, T)), write(' -> '), write((0, D, C, 0)), nl,
            solve(0, D, C, 0)
        );

        % chuyen de
        (
            D =:= 1,
            write((S, D, C, T)), write(' -> '), write((S, 0, C, 0)), nl,
            solve(S, 0, C, 0)
        );

        % chuyen cai
        (
            C =:= 1,
            write((S, D, C, T)), write(' -> '), write((S, D, 0, 0)), nl,
            solve(S, D, 0, 0)
        );

        % không chuyển gì cả
        (
            write((S, D, C, T)), write(' -> '), write((S, D, C, 0)), nl,
            solve(S, D, C, 0)
        )
    ).

% Thuyen ben trai (S == 0)
solve(S, D, C, T) :-   
    T =:= 0,

    \+ marked(S, D, C, T),
    mark(S, D, C, T),

    (
        % chuyen soi
        (
            S =:= 0,
            write((S, D, C, T)), write(' -> '), write((1, D, C, 1)), nl,
            solve(1, D, C, 1)
        );

        % chuyen de
        (
            D =:= 0,
            write((S, D, C, T)), write(' -> '), write((S, 1, C, 1)), nl,
            solve(S, 1, C, 1)
        );

        % chuyen cai
        (
            C =:= 0,
            write((S, D, C, T)), write(' -> '), write((S, D, 1, 1)), nl,
            solve(S, D, 1, 1)
        );

        % không chuyển gì cả
        (
            write((S, D, C, T)), write(' -> '), write((S, D, C, 1)), nl,
            solve(S, D, C, 1)
        )
    ).