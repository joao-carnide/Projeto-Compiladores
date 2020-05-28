@d = common global double 0.0
@.str.int = constant [3 x i8] c"%d\00"
@.str.double = constant [6 x i8] c"%.16e\00"
@.str.true = constant [5 x i8] c"true\00"
@.str.false = constant [6 x i8] c"false\00"
@.str.minus = constant [2 x i8] c"-\00"
@.size. = common global i32 0
@.str.0 = constant [2 x i8] c"\0A\00"
@.str.1 = constant [2 x i8] c"\0A\00"
define double @method_test_0(double %.n) {
%n = alloca double
store double %.n, double* %n
%.1 = load double, double* %n
ret double %.1
ret double 0.0
}
define void @main.entry(i32 %.size.,i8** %.args) {
store i32 %.size., i32* @.size.
%args = alloca i8**
store i8** %.args, i8*** %args
%.1 = add i32 0, 4
%.2 = sitofp i32 %.1 to double
%.3 = call double @method_test_0(double %.2)
%.4 = call i32 (i8*, ...) @printf(i8* getelementptr  ([6 x i8], [6 x i8]* @.str.double, i32 0, i32 0), double %.3)
%.5 = call i32 (i8*, ...) @printf(i8* getelementptr  ([2 x i8], [2 x i8]* @.str.0, i32 0, i32 0))
%.6 = add i32 0, 2
%.7 = sitofp i32 %.6 to double
store double %.7, double* @d
%.8 = load double, double* @d
%.9 = call i32 (i8*, ...) @printf(i8* getelementptr  ([6 x i8], [6 x i8]* @.str.double, i32 0, i32 0), double %.8)
%.10 = call i32 (i8*, ...) @printf(i8* getelementptr  ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
ret void
}
define i32 @main(i32 %.size,i8** %.args){
call void @main.entry(i32 %.size, i8** %.args)
ret i32 0
}
declare i32 @printf(i8*, ...)
declare i32 @atoi(i8*)
