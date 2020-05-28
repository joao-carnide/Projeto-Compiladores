@overload = common global i32 0
@.str.int = constant [3 x i8] c"%d\00"
@.str.double = constant [6 x i8] c"%.16e\00"
@.str.true = constant [5 x i8] c"true\00"
@.str.false = constant [6 x i8] c"false\00"
@.str.0 = constant [19 x i8] c"I have a parameter\00"
@.str.1 = constant [25 x i8] c"I don't have a parameter\00"
@.str.2 = constant [2 x i8] c"\0A\00"
define void @method_overload_0(i32 %.n) {
%n = alloca i32
store i32 %.n, i32* %n
%.1 = call i32 (i8*, ...) @printf(i8* getelementptr  ([19 x i8], [19 x i8]* @.str.0, i32 0, i32 0))
ret void
}
define void @method_overload_1() {
%.1 = call i32 (i8*, ...) @printf(i8* getelementptr  ([25 x i8], [25 x i8]* @.str.1, i32 0, i32 0))
ret void
}
define void @main.entry(i32 %.size.,i8** %.args) {
%size. = alloca i32
store i32 %.size., i32* %size.
%args = alloca i8**
store i8** %.args, i8*** %args
%.1 = load i32, i32* %size.
%.2 = sub i32 %.1, 1
%.3 = add i32 0, 0
%.4 = icmp sgt i32 %.2, %.3
br i1 %.4, label %then1, label %else1
then1:
%.5 = add i32 0, 0
%.6 = load i8**, i8*** %args
%.7 = add i32 1,%.5
%.8 = getelementptr i8*, i8** %.6, i32 %.7
%.9 = load i8*, i8** %.8
%.10 = call i32 @atoi(i8* %.9)
call void @method_overload_0(i32 %.10)
br label %ifCont1
else1:
call void @method_overload_1()
br label %ifCont1
ifCont1:
%.11 = call i32 (i8*, ...) @printf(i8* getelementptr  ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
ret void
}
define i32 @main(i32 %.size,i8** %.args){
call void @main.entry(i32 %.size, i8** %.args)
ret i32 0
}
declare i32 @printf(i8*, ...)
declare i32 @atoi(i8*)
