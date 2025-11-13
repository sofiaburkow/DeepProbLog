### Source: https://github.com/ML-KULeuven/deepproblog/tree/master?tab=readme-ov-file

# digit(X,Y) is a neural predicate
nn(mnist_net,[X],Y,[0,1,2,3,4,5,6,7,8,9]) :: digit(X,Y).
# "There exists a neural network named "mnist_net" that takes an input [X], produces an output variable Y, and the possible output labels are digits 0-9"

# Recursion
number([],Result,Result).                       # Base case (empty list)
number([H|T],Acc,Result) :-                     # Recursive case where H = head, T = tail. It assumes H is the least significant digit (rightmost)
    digit(H,Nr),                                # Calls the neural predicate to recognize which digit is in H, and stores it in Nr
    Acc2 is NR+10*Acc,number(T,Acc2,Result).    # Computes a running number in base 10
number(X,Y) :- number(X,0,Y).                   # Sets accumulator to 0

multi_addition(X,Y,Z) :- 
    number(X,X2), # Convert list X of digit images into a number X2
    number(Y,Y2), # Convert list Y of digit images into a number Y2
    Z is X2+Y2.   # Compute the sum of X2 and Y2

addition(X,Y,Z) :- 
    digit(X,X2), # Recognize the digit image X via the neural predicate 
    digit(Y,Y2), 
    Z is X2+Y2.  # Compute the sum