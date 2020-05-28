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
store i32 %.1, i32* %i
%j = alloca double
%.2 = add i32 0, 4
%.3 = sitofp i32 %.2 to double
store double %.3, double* %j
%.4 = load i32, i32* %i
%.5 = load double, double* %j
%.6 = sitofp i32 %.4 to double
%.7 = fadd double %.6, %.5
store double %.7, double* %j
%.8 = load i32, i32* %i
%.9 = load double, double* %j
%.10 = sitofp i32 %.8 to double
%.11 = fdiv double %.10, %.9
store double %.11, double* %j
%.12 = load double, double* %j
%.13 = call i32 (i8*, ...) @printf(i8* getelementptr  ([6 x i8], [6 x i8]* @.str.double, i32 0, i32 0), double %.12)
ret void
}
define i32 @main(i32 %.size,i8** %.args){
call void @main.entry(i32 %.size, i8** %.args)
ret i32 0
}
declare i32 @printf(i8*, ...)
declare i32 @atoi(i8*)
