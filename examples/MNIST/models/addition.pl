% Source: https://github.com/ML-KULeuven/deepproblog/tree/master?tab=readme-ov-file

% digit(X,Y) is a neural predicate
% "There exists a neural network named mnist_net that takes an input [X], produces an output variable Y, and the possible output labels are digits 0-9"
nn(mnist_net,[X],Y,[0,1,2,3,4,5,6,7,8,9]) :: digit(X,Y).

% Recursion:
% Base case (empty list)
number([],Result,Result).                       
% Recursive case where H = head (the least significant digit), T = tail
number([H|T],Acc,Result) :-                     
    digit(H,Nr),                                
    Acc2 is NR+10*Acc,number(T,Acc2,Result). 
% Initial case where accumulator is set to 0
number(X,Y) :- number(X,0,Y).                   

% Convert two lists X and Y of digit images into two numbers X2 and Y2
multi_addition(X,Y,Z) :- 
    number(X,X2), 
    number(Y,Y2), 
    Z is X2+Y2.   

% Recognize the digit images X and Y via the neural predicate
addition(X,Y,Z) :- 
    digit(X,X2), 
    digit(Y,Y2), 
    Z is X2+Y2.  