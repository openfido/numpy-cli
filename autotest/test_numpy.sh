. ${AUTOTEST:-..}/assert.sh

# trigonometric functions
assert $(numpy -f sin '1,2;3,4') = "0.84147098,0.90929743;0.14112001,-0.7568025;"
assert $(numpy -f cos '1,2;3,4') = "0.54030231,-0.41614684;-0.9899925,-0.65364362;"
assert $(numpy -f tan '1,2;3,4') = "1.5574077,-2.1850399;-0.14254654,1.1578213;"
assert $(numpy -f arcsin '0.1,0.2;0.3,0.4') = "0.10016742,0.20135792;0.30469265,0.41151685;"
assert $(numpy -f arccos '0.1,0.2;0.3,0.4') = "1.4706289,1.3694384;1.2661037,1.1592795;"
assert $(numpy -f arctan '0.1,0.2;0.3,0.4') = "0.099668652,0.19739556;0.29145679,0.38050638;"
assert $(numpy -f hypot '1,2;3,4' '5,6;7,8') = "5.0990195,6.3245553;7.6157731,8.9442719;"
assert $(numpy -f arctan2 '1,2;3,4' '5,6;7,8') = "0.19739556,0.32175055;0.40489179,0.46364761;"
assert $(numpy -f degrees '1,2;3,4') = "57.29578,114.59156;171.88734,229.18312;"
assert $(numpy -f radians '1,2;3,4') = "0.017453293,0.034906585;0.052359878,0.06981317;"
assert $(numpy -f unwrap '10,20;30,40') = "10,7.4336294;30,27.433629;"
assert $(numpy -f deg2rad '1,2;3,4') = "0.017453293,0.034906585;0.052359878,0.06981317;"
assert $(numpy -f rad2deg '1,2;3,4') = "57.29578,114.59156;171.88734,229.18312;"

# hyperbolic functions
assert $(numpy -f sinh '1,2;3,4') = "1.1752012,3.6268604;10.017875,27.289917;"
assert $(numpy -f cosh '1,2;3,4') = "1.5430806,3.7621957;10.067662,27.308233;"
assert $(numpy -f tanh '1,2;3,4') = "0.76159416,0.96402758;0.99505475,0.9993293;"
assert $(numpy -f arcsinh '1,2;3,4') = "0.88137359,1.4436355;1.8184465,2.0947125;"
assert $(numpy -f arccosh '1,2;3,4') = "0,1.3169579;1.7627472,2.0634371;"
assert $(numpy -f arctanh '0.1,0.2;0.3,0.4') = '0.10033535,0.20273255;0.3095196,0.42364893;'

# rounding
assert $(numpy -f around '0.2,0.4;0.6,0.8') = "0,0;1,1;"
assert $(numpy -f round_ '0.2,0.4;0.6,0.8') = "0,0;1,1;"
assert $(numpy -f rint '0.2,0.4;0.6,0.8') = "0,0;1,1;"
assert $(numpy -f fix '0.2,0.4;0.6,0.8') = "0,0;0,0;"
assert $(numpy -f floor '0.2,0.4;0.6,0.8') = "0,0;0,0;"
assert $(numpy -f ceil '0.2,0.4;0.6,0.8') = "1,1;1,1;"
assert $(numpy -f trunc '0.2,0.4;0.6,0.8') = "0,0;0,0;"

# sum, products, differences
assert $(numpy -f prod '1,2;3,4') = "24;"
assert $(numpy -f sum '1,2;3,4') = "10;"
assert $(numpy -f nanprod '1,2;3,4') = "24;"
assert $(numpy -f nansum '1,2;3,4') = "10;"
assert $(numpy -f cumprod '1,2;3,4') = "1,2,6,24;"
assert $(numpy -f cumsum '1,2;3,4') = "1,3,6,10;"
assert $(numpy -f nancumprod '1,2;3,4') = "1,2,6,24;"
assert $(numpy -f nancumsum '1,2;3,4') = "1,3,6,10;"
assert $(numpy -f diff '1,2;3,4') = "1;1;"
# assert $(numpy -f ediff1d '1,2;3,4') = "1,1;"
assert $(numpy -f gradient '1,2;3,4' axis=0) = "2,2;2,2;"
assert $(numpy -f cross '1,2;3,4' '5,6;7,8') = "-4,-4;"
assert $(numpy -f trapz '1,2;3,4') = "1.5;3.5;"

# exponents and logarithms
assert $(numpy -f exp '1,2;3,4') = "2.7182818,7.3890561;20.085537,54.59815;"
assert $(numpy -f expm1 '1,2;3,4') = "1.7182818,6.3890561;19.085537,53.59815;"
assert $(numpy -f exp2 '1,2;3,4') = "2,4;8,16;"
assert $(numpy -f log '1,2;3,4') = "0,0.69314718;1.0986123,1.3862944;"
assert $(numpy -f log10 '1,2;3,4') = "0,0.30103;0.47712125,0.60205999;"
assert $(numpy -f log2 '1,2;3,4') = "0,1;1.5849625,2;"
assert $(numpy -f log1p '1,2;3,4') = "0.69314718,1.0986123;1.3862944,1.6094379;"
assert $(numpy -f logaddexp '1,2;3,4' '5,6;7,8') = "5.0181499,6.0181499;7.0181499,8.0181499;"
assert $(numpy -f logaddexp2 '1,2;3,4' '5,6;7,8') = "5.0874628,6.0874628;7.0874628,8.0874628;"

# other special functions
assert $(numpy -f i0 '1,2,3,4') = "1,2,4,11;"
assert $(numpy -f i0 '1.,2.,3.,4.') = "1.2660659,2.2795853,4.8807926,11.301922;"
assert $(numpy -f sinc '0.1,0.2;0.3,0.4') = "0.98363164,0.93548928;0.85839369,0.75682673;"

# floating point routines
assert $(numpy -f signbit '-1,2;-3,4') = "1,0;1,0;"
assert $(numpy -f copysign '1,2;3,4' '-1,1;-1,1') = "-1,2;-3,4;"
assert $(numpy -f frexp '1,2;3,4') = "0.5,0.5;0.75,0.5;1,2;2,3;"
assert $(numpy -f ldexp '1,2;3,4' '5,6;7,8') = "32,128;384,1024;"
assert $(numpy -f nextafter '1,2;3,4' '5,6;7,8') = "1,2;3,4;"
assert $(numpy -f spacing '1,2;3,4') = "2.220446e-16,4.4408921e-16;4.4408921e-16,8.8817842e-16;"

# rational routimes
assert $(numpy -f lcm '1,2;3,4' '5,6;7,8') = "5,6;21,8;"
assert $(numpy -f gcd '1,2;3,4' '5,6;7,8') = "1,2;1,4;"

# arithmetic operations
assert $(numpy -f add '1,2;3,4' '5,6;7,8') = "6,8;10,12;"
assert $(numpy -f reciprocal '1.,2.;3.,4.') = "1,0.5;0.33333333,0.25;"
assert $(numpy -f positive '1,2;3,4') = "1,2;3,4;"
assert $(numpy -f negative '1,2;3,4') = "-1,-2;-3,-4;"
assert $(numpy -f multiply '1,2;3,4' '5,6;7,8') = "5,12;21,32;"
assert $(numpy -f divide '1,2;3,4' '5,6;7,8') = "0.2,0.33333333;0.42857143,0.5;"
assert $(numpy -f power '1,2;3,4' '5,6;7,8') = "1,64;2187,65536;"
assert $(numpy -f subtract '1,2;3,4' '5,6;7,8') = "-4,-4;-4,-4;"
assert $(numpy -f true_divide '1,2;3,4' '5,6;7,8') = "0.2,0.33333333;0.42857143,0.5;"
assert $(numpy -f floor_divide '1,2;3,4' '5,6;7,8') = "0,0;0,0;"
assert $(numpy -f float_power '1,2;3,4' '5,6;7,8') = "1,64;2187,65536;"
assert $(numpy -f fmod '1,2;3,4' '5,6;7,8') = "1,2;3,4;"
assert $(numpy -f mod '1,2;3,4' '5,6;7,8') = "1,2;3,4;"
assert $(numpy -f modf '1,2;3,4') = "0,0;0,0;1,2;3,4;"
assert $(numpy -f remainder '1,2;3,4' '5,6;7,8') = "1,2;3,4;"
assert $(numpy -f divmod '1,2;3,4' '5,6;7,8') = "0,0;0,0;1,2;3,4;"


# handing complex numbers
assert $(numpy -f angle '1,2;3,4') = "0,0;0,0;"
assert $(numpy -f real '1,2;3,4') = "1,2;3,4;"
assert $(numpy -f imag '1,2;3,4') = "0,0;0,0;"
assert $(numpy -f conj '1,2;3,4') = "1,2;3,4;"
assert $(numpy -f conjugate '1,2;3,4') = "1,2;3,4;"

# miscellaneous
assert $(numpy convolve '0.1,0.2,0.3,0.4' '0.5,0.6,0.7,0.8') = "0.05,0.16,0.34,0.6,0.61,0.52,0.32"
assert $(numpy -f clip '1,2;3,4' a_min=2 a_max=3) = "2,2;3,3;"
assert $(numpy -f sqrt '1,2;3,4') = "1,1.4142136;1.7320508,2;"
assert $(numpy -f cbrt '1,2;3,4') = "1,1.259921;1.4422496,1.5874011;"
assert $(numpy -f square '1,2;3,4') = "1,4;9,16;"
assert $(numpy -f absolute '1,2;3,4') = "1,2;3,4;"
assert $(numpy -f fabs '1,2;3,4') = "1,2;3,4;"
assert $(numpy -f sign '1,2;3,4') = "1,1;1,1;"
assert $(numpy -f heaviside '1,2;3,4' '5,6;7,8') = "1,1;1,1;"
assert $(numpy -f maximum '1,2;3,4' '5,6;7,8') = "5,6;7,8;"
assert $(numpy -f minimum '1,2;3,4' '5,6;7,8') = "1,2;3,4;"
assert $(numpy -f fmax '1,2;3,4' '5,6;7,8') = "5,6;7,8;"
assert $(numpy -f fmin '1,2;3,4' '5,6;7,8') = "1,2;3,4;"
# assert $(numpy -f nan_to_num '1,2;3,4') = ""
assert $(numpy -f real_if_close '1+0.01j,2+0.02j;3+0.03j,4+0.04j' tol=0.05) = "1,2;3,4;"
assert $(numpy -f interp '1,2;3,4' '5,6;7,8' '5,6,7,8') = "5,5,5,5;"
