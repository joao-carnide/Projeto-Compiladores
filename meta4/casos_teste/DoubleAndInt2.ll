@.str.int = constant [3 x i8] c"%d\00"
@.str.double = constant [6 x i8] c"%.16e\00"
@.str.true = constant [5 x i8] c"true\00"
@.str.false = constant [6 x i8] c"false\00"
define void @main.entry(i32 %.size.,i8** %.args) {
%size. = alloca i32
store i32 %.size., i32* %size.
%args = alloca i8**
store i8** %.args, i8*** %args
%i = alloca i32
%.1 = add i32 0, 3
%j = alloca double
%.2 = add i32 0, 4
%.4 = load i32, i32* %i
%.5 = add i32 0, 1
%.6 = add i32 %.4, %.5
%.7 = load double, double* %j
%.10 = load double, double* %j
ret void
}
define i32 @main(i32 %.size,i8** %.args){
call void @main.entry(i32 %.size, i8** %.args)
ret i32 0
}
declare i32 @printf(i8*, ...)
declare i32 @atoi(i8*)
