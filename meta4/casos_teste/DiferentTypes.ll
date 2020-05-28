@.str.int = constant [3 x i8] c"%d\00"
@.str.double = constant [6 x i8] c"%.16e\00"
@.str.true = constant [5 x i8] c"true\00"
@.str.false = constant [6 x i8] c"false\00"
@.str.0 = constant [2 x i8] c"\0A\00"
@.str.1 = constant [2 x i8] c"\0A\00"
@.str.2 = constant [2 x i8] c"\0A\00"
define i1 @method_bool_0() {
%i = alloca i1
%.1 = or i1 false, true
store i1 %.1, i1* %i
%.2 = load i1, i1* %i
br i1 %.2, label %then1, label %else1
then1:
%.3 = call i32 (i8*, ...) @printf(i8* getelementptr  ([5 x i8], [5 x i8]* @.str.true, i32 0, i32 0))
br label %ifCont1
else1:
%.4 = call i32 (i8*, ...) @printf(i8* getelementptr  ([6 x i8], [6 x i8]* @.str.false, i32 0, i32 0))
br label %ifCont1
ifCont1:
%.5 = call i32 (i8*, ...) @printf(i8* getelementptr  ([2 x i8], [2 x i8]* @.str.0, i32 0, i32 0))
%.6 = load i1, i1* %i
ret i1 %.6
ret i1 0
}
define i32 @method_integer_0() {
%i = alloca i32
%.1 = add i32 0, 1
store i32 %.1, i32* %i
%.2 = load i32, i32* %i
%.3 = call i32 (i8*, ...) @printf(i8* getelementptr  ([3 x i8], [3 x i8]* @.str.int, i32 0, i32 0), i32 %.2)
%.4 = call i32 (i8*, ...) @printf(i8* getelementptr  ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
%.5 = load i32, i32* %i
ret i32 %.5
ret i32 0
}
define double @method_real_0() {
%i = alloca double
%.1 = fadd double 0.000000, 1.0000000000000000
store double %.1, double* %i
%.2 = load double, double* %i
%.3 = call i32 (i8*, ...) @printf(i8* getelementptr  ([6 x i8], [6 x i8]* @.str.double, i32 0, i32 0), double %.2)
%.4 = call i32 (i8*, ...) @printf(i8* getelementptr  ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
%.5 = load double, double* %i
ret double %.5
ret double 0.0
}
define void @main.entry(i32 %.size.,i8** %.args) {
%size. = alloca i32
store i32 %.size., i32* %size.
%args = alloca i8**
store i8** %.args, i8*** %args
%.1 = call i1 @method_bool_0()
%.2 = call i32 @method_integer_0()
%.3 = call double @method_real_0()
ret void
}
define i32 @main(i32 %.size,i8** %.args){
call void @main.entry(i32 %.size, i8** %.args)
ret i32 0
}
declare i32 @printf(i8*, ...)
declare i32 @atoi(i8*)
