@.str.int = constant [3 x i8] c"%d\00"
@.str.double = constant [6 x i8] c"%.16e\00"
@.str.true = constant [5 x i8] c"true\00"
@.str.false = constant [6 x i8] c"false\00"
@.str.0 = constant [10 x i8] c"Is pair: \00"
@.str.1 = constant [3 x i8] c"|\0A\00"
@.str.2 = constant [2 x i8] c"\0A\00"
define i32 @method_b_0(i32 %.input) {
%input = alloca i32
store i32 %.input, i32* %input
%k = alloca i32
%.1 = add i32 0, 0
store i32 %.1, i32* %k
%i = alloca i32
%g = alloca i32
%.2 = add i32 0, 0
store i32 %.2, i32* %i
%.3 = add i32 0, 0
store i32 %.3, i32* %g
%is_pair = alloca i32
%.4 = add i32 0, 0
store i32 %.4, i32* %is_pair
br label %while1
while1:
%.5 = load i32, i32* %k
%.6 = add i32 0, 1
%.7 = icmp eq i32 %.5, %.6
br i1 %.7, label %then1, label %else1
then1:
%.8 = load i32, i32* %input
%.9 = add i32 0, 2
%.10 = sub i32 %.8, %.9
store i32 %.10, i32* %input
%.11 = add i32 0, 0
store i32 %.11, i32* %i
%.12 = add i32 0, 0
store i32 %.12, i32* %g
br label %while2
while2:
br label %while3
while3:
%.13 = load i32, i32* %input
%.14 = add i32 0, 2
%.15 = add i32 %.13, %.14
store i32 %.15, i32* %input
%.16 = load i32, i32* %g
%.17 = add i32 0, 2
%.18 = urem i32 %.16, %.17
%.19 = add i32 0, 0
%.20 = icmp eq i32 %.18, %.19
br i1 %.20, label %then2, label %else2
then2:
%.21 = load i32, i32* %is_pair
%.22 = add i32 0, 1
%.23 = add i32 %.21, %.22
store i32 %.23, i32* %is_pair
br label %ifCont2
else2:
br label %ifCont2
ifCont2:
%.24 = load i32, i32* %g
%.25 = add i32 0, 1
%.26 = add i32 %.24, %.25
store i32 %.26, i32* %g
%.27 = load i32, i32* %g
%.28 = add i32 0, 50
%.29 = icmp slt i32 %.27, %.28
br i1 %.29, label %while3, label %whileCont3
whileCont3:
%.30 = add i32 0, 0
store i32 %.30, i32* %g
%.31 = load i32, i32* %i
%.32 = add i32 0, 1
%.33 = add i32 %.31, %.32
store i32 %.33, i32* %i
%.34 = load i32, i32* %i
%.35 = add i32 0, 100
%.36 = icmp slt i32 %.34, %.35
br i1 %.36, label %while2, label %whileCont2
whileCont2:
br label %ifCont1
else1:
%.37 = load i32, i32* %k
%.38 = add i32 0, 2
%.39 = icmp eq i32 %.37, %.38
br i1 %.39, label %then3, label %else3
then3:
%.40 = load i32, i32* %input
%.41 = add i32 0, 3
%.42 = mul i32 %.40, %.41
store i32 %.42, i32* %input
br label %ifCont3
else3:
br label %ifCont3
ifCont3:
br label %ifCont1
ifCont1:
%.43 = load i32, i32* %k
%.44 = add i32 0, 1
%.45 = add i32 %.43, %.44
store i32 %.45, i32* %k
%.46 = load i32, i32* %k
%.47 = add i32 0, 5
%.48 = icmp slt i32 %.46, %.47
br i1 %.48, label %while1, label %whileCont1
whileCont1:
%.49 = call i32 (i8*, ...) @printf(i8* getelementptr  ([10 x i8], [10 x i8]* @.str.0, i32 0, i32 0))
%.50 = load i32, i32* %is_pair
%.51 = call i32 (i8*, ...) @printf(i8* getelementptr  ([3 x i8], [3 x i8]* @.str.int, i32 0, i32 0), i32 %.50)
%.52 = call i32 (i8*, ...) @printf(i8* getelementptr  ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
%.53 = load i32, i32* %input
ret i32 %.53
ret i32 0
}
define void @main.entry(i32 %.size.,i8** %.args) {
%size. = alloca i32
store i32 %.size., i32* %size.
%args = alloca i8**
store i8** %.args, i8*** %args
%aux1 = alloca i32
%.1 = add i32 0, 40
store i32 %.1, i32* %aux1
%.2 = load i32, i32* %aux1
%.3 = call i32 @method_b_0(i32 %.2)
store i32 %.3, i32* %aux1
%.4 = add i32 0, 0
%.5 = load i8**, i8*** %args
%.6 = add i32 1,%.4
%.7 = getelementptr i8*, i8** %.5, i32 %.6
%.8 = load i8*, i8** %.7
%.9 = call i32 @atoi(i8* %.8)
%.10 = call i32 (i8*, ...) @printf(i8* getelementptr  ([3 x i8], [3 x i8]* @.str.int, i32 0, i32 0), i32 %.9)
%.11 = call i32 (i8*, ...) @printf(i8* getelementptr  ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
ret void
}
define i32 @main(i32 %.size,i8** %.args){
call void @main.entry(i32 %.size, i8** %.args)
ret i32 0
}
declare i32 @printf(i8*, ...)
declare i32 @atoi(i8*)
