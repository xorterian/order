# order
## Deep order of integers and complex numbers

In order theory you can define relations between elements (usually numbers) returning a truth-value considering which number is greater than the other. On the real numbers you can define a binary A order realtion on the Descartes square of reals, R×R which satisfies the following:

- For each element x : x A x (reflexivity)

- For each elements x and y : (x A y and y A x) -> x=y (antisymmetry)

- For each elements x, y and z : (x A y and y A z) -> x A z (transitivity)

We call the relation A dichotom iff for each elements x and y : x A y or y A x.
We call it trichotom iff for each elements x and y : x A y or y A x or x = y.

We can also order sets of strings alphabetically based on ordered alphabet.

# The big idea

Let me order numbers via its bitstrings (binary codes) or generally via its n-ary codes. Then I can reduce the problem of ordering potencially infinite numbers to the problem of ordering strings based on alphabet. The two cases, seemingly, are really similar, but in that one of strings I can reorder the alphabet which gives us a new order on numbers. Let me show you by using my code order.gp.

The call

makeorder_ints([0,1],vector(10,i,i))

and

makeorder_ints([0,1],vector(10,i,11-i))

returns with the same output

[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

It is the ordered vector of numbers from 1 to 10.

The first input defines the alphabet with an arbitrary order, and based on it, the function reorder the whole inputvector. To be exact, it converts to bitstrings, reorder based on the order [0,1], and converts back to decimals.

If you give [1,0] instead of [0,1], you will get a reversed order.

If you give [0,1,2] instead of [0,1], you force the function to convert to ternary codes ("tritstrings"), reorder based on [0,1,2] - which counts as a normal order -, and convert it back to decimals. Of course, the result will be the same. It is really similar with the first inputs like [0,1,2,3] and [0,1,2,3,4,5], etc.

But if you give [0,2,1] instead of [0,1,2], you will get an order of your input integers in which the more 1s are at the first places of the tritstring a number, the greater it is. Let me reorder the numbers from 1 to 27 for you:

makeorder_ints([0,2,1],vector(27,i,i))

[2, 1, 6, 8, 7, 3, 5, 4, 18, 20, 19, 24, 26, 25, 21, 23, 22, 9, 11, 10, 15, 17, 16, 12, 14, 13, 27]

So it is a new order in which the alphabet of digits is not in the normal order. It makes sense if you search numbers whose n-ary codes are extrame but not with the "lowest" and "highest" values.

# Fusion and Fission of numbers

You can also have integers fuzed, have the fission of an integer to more integers, and these operations are inverses of each other.

It makes sense if you have complex numbers, hypercomplex numbers, quaternions or any vectors of real components like these, and you want them to be ordered. To order complex numbers, it works to bitwise fuze the real and imaginary components, and order the real/integer fusions, then fission the elements of the new order back to complex numbers.

You can use the function makeorder_comps([0,1],v) to order the complex numbers of v vector where these numbers, at the current state of the code, have to have integer real part > 0 and integer imaginary part > 1.

In this case, for example we get

2i < 2 < 2 + 2i

and so on.

Have fun! And feel free to complete my code in order to extend the functions to reals instead of integers.
