@.str.int = constant [3 x i8] c"%d\00"
@.str.double = constant [6 x i8] c"%.16e\00"
@.str.true = constant [5 x i8] c"true\00"
@.str.false = constant [6 x i8] c"false\00"
define i32 @method_a_0(i32 %.input) {
%input = alloca i32
store i32 %.input, i32* %input
%.1 = load i32, i32* %input
ret i32 %.1
ret i32 0
}
define i32 @method_b_0(i32 %.input) {
%input = alloca i32
store i32 %.input, i32* %input
%.1 = load i32, i32* %input
ret i32 %.1
ret i32 0
}
define i32 @main(i32 %.size,i8** %.args){
ret i32 0
}
declare i32 @printf(i8*, ...)
declare i32 @atoi(i8*)
