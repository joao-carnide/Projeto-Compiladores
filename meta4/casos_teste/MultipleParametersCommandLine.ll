@.str.int = constant [3 x i8] c"%d\00"
@.str.double = constant [6 x i8] c"%.16e\00"
@.str.true = constant [5 x i8] c"true\00"
@.str.false = constant [6 x i8] c"false\00"
@.str.0 = constant [2 x i8] c"\0A\00"
@.str.1 = constant [2 x i8] c"\0A\00"
define void @main.entry(i32 %.size.,i8** %.args) {
%size. = alloca i32
store i32 %.size., i32* %size.
%args = alloca i8**
store i8** %.args, i8*** %args
%arg1 = alloca i32
%.1 = add i32 0, 0
%.2 = load i8**, i8*** %args
%.3 = add i32 1,%.1
%.4 = getelementptr i8*, i8** %.2, i32 %.3
%.5 = load i8*, i8** %.4
%.6 = call i32 @atoi(i8* %.5)
store i32 %.6, i32* %arg1
%arg2 = alloca i32
%.7 = add i32 0, 1
%.8 = load i8**, i8*** %args
%.9 = add i32 1,%.7
%.10 = getelementptr i8*, i8** %.8, i32 %.9
%.11 = load i8*, i8** %.10
%.12 = call i32 @atoi(i8* %.11)
store i32 %.12, i32* %arg2
%.13 = load i32, i32* %arg1
%.14 = call i32 (i8*, ...) @printf(i8* getelementptr  ([3 x i8], [3 x i8]* @.str.int, i32 0, i32 0), i32 %.13)
%.15 = call i32 (i8*, ...) @printf(i8* getelementptr  ([2 x i8], [2 x i8]* @.str.0, i32 0, i32 0))
%.16 = load i32, i32* %arg2
%.17 = call i32 (i8*, ...) @printf(i8* getelementptr  ([3 x i8], [3 x i8]* @.str.int, i32 0, i32 0), i32 %.16)
%.18 = call i32 (i8*, ...) @printf(i8* getelementptr  ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
ret void
}
define i32 @main(i32 %.size,i8** %.args){
call void @main.entry(i32 %.size, i8** %.args)
ret i32 0
}
declare i32 @printf(i8*, ...)
declare i32 @atoi(i8*)
