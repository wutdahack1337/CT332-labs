% isFood(X) = "X is food"

isFood(chicken). % Gà là thức ăn
isFood(apple). % Táo là thức ăn
isFood(X) :- eat(NAME, X), alive(NAME). % Thứ mà có ai đó ăn vào mà vẫn còn sống cũng là thức ăn.
% Các vị từ cùng tên thì đặt kế nhau

% ---------------------------------------------------------------------
% alive(X) = "X's still alive"

alive(bill). % Bill còn sống.

% ----------------------------------------------------------------------
% eat(X, Y) = "X eat Y"

eat(bill, peanut). % Bill ăn đậu phộng.
eat(sue, X) :- eat(bill, X). % Sue ăn những thứ mà Bill ăn
eat(john, X) :- isFood(X). % John ăn tất cả những gì là thức ăn.