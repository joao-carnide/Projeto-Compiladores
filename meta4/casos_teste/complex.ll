@overload = common global i32 0
@.str.int = constant [3 x i8] c"%d\00"
@.str.double = constant [6 x i8] c"%.16e\00"
@.str.true = constant [5 x i8] c"true\00"
@.str.false = constant [6 x i8] c"false\00"
@.str.0 = constant [20 x i8] c"I have two doubles\0A\00"
@.str.1 = constant [19 x i8] c"I have one double\0A\00"
@.str.2 = constant [16 x i8] c"I have one int\0A\00"
@.str.3 = constant [19 x i8] c"I'm the fake main\0A\00"
@.str.4 = constant [2 x i8] c"\0A\00"
@.str.5 = constant [5 x i8] c"\0Aa:\0A\00"
@.str.6 = constant [11 x i8] c"Before if\0A\00"
@.str.7 = constant [11 x i8] c"After ifs\0A\00"
@.str.8 = constant [11 x i8] c"After ifs\0A\00"
@.str.9 = constant [2 x i8] c"\0A\00"
@.str.10 = constant [2 x i8] c"\0A\00"
@.str.11 = constant [14 x i8] c"Before while\0A\00"
@.str.12 = constant [2 x i8] c"\0A\00"
define i1 @method_overload_0(i1 %.n) {
%n = alloca i1
store i1 %.n, i1* %n
%.1 = call i32 (i8*, ...) @printf(i8* getelementptr  ([20 x i8], [20 x i8]* @.str.0, i32 0, i32 0))
%.2 = or i1 false, false
ret i1 %.2
ret i1 0
}
define double @method_overload_1(double %.n) {
%n = alloca double
store double %.n, double* %n
%.1 = call i32 (i8*, ...) @printf(i8* getelementptr  ([19 x i8], [19 x i8]* @.str.1, i32 0, i32 0))
%.2 = fadd double 0.000000, 2.2000000000000002
%.3 = add i32 0, 2
%.4 = sitofp i32 %.3 to double
%.5 = fmul double %.2, %.4
%.6 = add i32 0, 2
%.7 = call i32 @method_main_0(i32 %.6)
%.8 = add i32 0, 5
%.9 = udiv i32 %.7, %.8
%.10 = add i32 0, 6
%.11 = mul i32 %.9, %.10
%.12 = sitofp i32 %.11 to double
%.13 = fadd double %.5, %.12
%.14 = add i32 0, 2
%.15 = add i32 0, 3
%.16 = mul i32 %.14, %.15
%.17 = sitofp i32 %.16 to double
%.18 = fadd double %.13, %.17
%.19 = add i32 0, 3
%.20 = add i32 0, 4
%.21 = mul i32 %.19, %.20
%.22 = sitofp i32 %.21 to double
%.23 = fadd double %.18, %.22
%.24 = add i32 0, 2
%.25 = add i32 0, 8
%.26 = mul i32 %.24, %.25
%.27 = sitofp i32 %.26 to double
%.28 = fadd double %.23, %.27
%.29 = add i32 0, 5
%.30 = add i32 0, 9
%.31 = mul i32 %.29, %.30
%.32 = sitofp i32 %.31 to double
%.33 = fadd double %.28, %.32
%.34 = add i32 0, 2
%.35 = add i32 0, 2
%.36 = call i32 @method_overload_3(i32 %.34,i32 %.35)
%.37 = sitofp i32 %.36 to double
%.38 = fadd double %.33, %.37
ret double %.38
ret double 0.0
}
define i32 @method_overload_2(double %.b, double %.b1) {
%b = alloca double
store double %.b, double* %b
%b1 = alloca double
store double %.b1, double* %b1
%.1 = add i32 0, 2
%.2 = load i32, i32* @overload
%.3 = add i32 %.1, %.2
store i32 %.3, i32* @overload
%overload = alloca double
%.4 = call i32 (i8*, ...) @printf(i8* getelementptr  ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0))
%.5 = add i32 0, 5
ret i32 %.5
ret i32 0
}
define i32 @method_overload_3(i32 %.b, i32 %.b1) {
%b = alloca i32
store i32 %.b, i32* %b
%b1 = alloca i32
store i32 %.b1, i32* %b1
%.1 = add i32 0, 5
ret i32 %.1
ret i32 0
}
define i32 @method_main_0(i32 %.n) {
%n = alloca i32
store i32 %.n, i32* %n
%.1 = call i32 (i8*, ...) @printf(i8* getelementptr  ([19 x i8], [19 x i8]* @.str.3, i32 0, i32 0))
%.2 = add i32 0, 5
ret i32 %.2
ret i32 0
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
%.11 = sitofp i32 %.10 to double
%.12 = call double @method_overload_1(double %.11)
br label %ifCont1
else1:
%.13 = add i32 0, 5
%.14 = sitofp i32 %.13 to double
%.15 = call double @method_overload_1(double %.14)
br label %ifCont1
ifCont1:
%.16 = or i1 false, false
%.17 = alloca i1
br i1 %.16, label %then2, label %else2
then2:
store i1 false, i1* %.17
br label %ifCont2
else2:
store i1 true, i1* %.17
br label %ifCont2
ifCont2:
%.18 = load i1, i1* %.17
br i1 %.18, label %then3, label %else3
then3:
%.19 = call i32 (i8*, ...) @printf(i8* getelementptr  ([5 x i8], [5 x i8]* @.str.true, i32 0, i32 0))
br label %ifCont3
else3:
%.20 = call i32 (i8*, ...) @printf(i8* getelementptr  ([6 x i8], [6 x i8]* @.str.false, i32 0, i32 0))
br label %ifCont3
ifCont3:
%.21 = call i32 (i8*, ...) @printf(i8* getelementptr  ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
%a = alloca i32
%.22 = add i32 0, 2222222
store i32 %.22, i32* %a
%d = alloca double
%.23 = fadd double 0.000000, 232323320.0000000000000000
store double %.23, double* %d
%b = alloca i32
%.24 = add i32 0, 3
store i32 %.24, i32* %b
%.25 = load i32, i32* %a
%.26 = call i32 (i8*, ...) @printf(i8* getelementptr  ([3 x i8], [3 x i8]* @.str.int, i32 0, i32 0), i32 %.25)
%b1 = alloca i1
%.27 = or i1 false, true
store i1 %.27, i1* %b1
%.28 = load i32, i32* %a
%.29 = load i32, i32* %a
%.30 = add i32 %.28, %.29
%.31 = load i32, i32* %a
%.32 = add i32 %.30, %.31
%.33 = add i32 0, 8
%.34 = add i32 0, 2
%.35 = urem i32 %.33, %.34
%.36 = add i32 %.32, %.35
%.37 = load double, double* %d
%.38 = add i32 0, 3
%.39 = sitofp i32 %.38 to double
%.40 = fdiv double %.37, %.39
%.41 = sitofp i32 %.36 to double
%.42 = fadd double %.41, %.40
%.43 = load i32, i32* %a
%.44 = load double, double* %d
%.45 = sitofp i32 %.43 to double
%.46 = fmul double %.45, %.44
%.47 = fadd double %.42, %.46
%.48 = load double, double* %d
%.49 = fadd double %.47, %.48
%.50 = load i32, i32* %a
%.51 = sitofp i32 %.50 to double
%.52 = fsub double %.49, %.51
%.53 = load i32, i32* %a
%.54 = load i32, i32* %b
%.55 = mul i32 %.53, %.54
%.56 = load double, double* %d
%.57 = fadd double 0.0, %.56
%.58 = sitofp i32 %.55 to double
%.59 = fdiv double %.58, %.57
%.60 = load i32, i32* %a
%.61 = load i32, i32* %b
%.62 = mul i32 %.60, %.61
%.63 = load double, double* %d
%.64 = fadd double 0.0, %.63
%.65 = sitofp i32 %.62 to double
%.66 = fdiv double %.65, %.64
%.67 = fmul double %.59, %.66
%.68 = fadd double %.52, %.67
%.69 = fadd double 0.000000, 2.2000000000000002
%.70 = call double @method_overload_1(double %.69)
%.71 = fadd double %.68, %.70
%.72 = add i32 0, 1
%.73 = add i32 0, 1
%.74 = call i32 @method_overload_3(i32 %.72,i32 %.73)
%.75 = sitofp i32 %.74 to double
store double %.75, double* %d
%.76 = fadd double %.71, %.75
%.77 = add i32 0, 5
%.78 = call i32 @method_main_0(i32 %.77)
%.79 = sitofp i32 %.78 to double
%.80 = fadd double %.76, %.79
%.81 = load i32, i32* %size.
%.82 = sub i32 %.81, 1
%.83 = add i32 0, 1
%.84 = sub i32 %.82, %.83
%.85 = load i8**, i8*** %args
%.86 = add i32 1,%.84
%.87 = getelementptr i8*, i8** %.85, i32 %.86
%.88 = load i8*, i8** %.87
%.89 = call i32 @atoi(i8* %.88)
%.90 = sitofp i32 %.89 to double
%.91 = fadd double %.80, %.90
%.92 = call i32 (i8*, ...) @printf(i8* getelementptr  ([6 x i8], [6 x i8]* @.str.double, i32 0, i32 0), double %.91)
%.93 = call i32 (i8*, ...) @printf(i8* getelementptr  ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0))
%.94 = load i32, i32* %a
%.95 = call i32 (i8*, ...) @printf(i8* getelementptr  ([3 x i8], [3 x i8]* @.str.int, i32 0, i32 0), i32 %.94)
%.96 = call i32 (i8*, ...) @printf(i8* getelementptr  ([11 x i8], [11 x i8]* @.str.6, i32 0, i32 0))
%.97 = load i32, i32* %a
%.98 = add i32 0, 2
%.99 = add i32 0, 2
%.100 = mul i32 %.98, %.99
%.101 = add i32 0, 3
%.102 = add i32 0, 5
%.103 = udiv i32 %.101, %.102
%.104 = add i32 %.100, %.103
%.105 = add i32 0, 5
%.106 = call i32 @method_main_0(i32 %.105)
%.107 = add i32 %.104, %.106
%.108 = icmp sge i32 %.97, %.107
br i1 %.108, label %then4, label %else4
then4:
%.109 = load i32, i32* %a
%.110 = add i32 0, 2
%.111 = icmp sle i32 %.109, %.110
br i1 %.111, label %then5, label %else5
then5:
%.112 = add i32 0, 2
%.113 = load i32, i32* %a
%.114 = icmp sge i32 %.112, %.113
br i1 %.114, label %then6, label %else6
then6:
%.115 = add i32 0, 2
%.116 = load i32, i32* %a
%.117 = icmp sle i32 %.115, %.116
br i1 %.117, label %then7, label %else7
then7:
%.118 = load i32, i32* %a
%.119 = add i32 0, 2
%.120 = icmp eq i32 %.118, %.119
br i1 %.120, label %then8, label %else8
then8:
%.121 = add i32 0, 2
%.122 = load i32, i32* %a
%.123 = icmp eq i32 %.121, %.122
br i1 %.123, label %then9, label %else9
then9:
%.124 = load i32, i32* %a
%.125 = add i32 0, 2
%.126 = icmp sgt i32 %.124, %.125
br i1 %.126, label %then10, label %else10
then10:
%.127 = load i32, i32* %a
%.128 = add i32 0, 2
%.129 = icmp slt i32 %.127, %.128
br i1 %.129, label %then11, label %else11
then11:
%.130 = add i32 0, 2
%.131 = load i32, i32* %a
%.132 = icmp sgt i32 %.130, %.131
br i1 %.132, label %then12, label %else12
then12:
%.133 = add i32 0, 2
%.134 = load i32, i32* %a
%.135 = icmp slt i32 %.133, %.134
br i1 %.135, label %then13, label %else13
then13:
%.136 = load i32, i32* %a
%.137 = add i32 0, 2
%.138 = icmp ne i32 %.136, %.137
br i1 %.138, label %then14, label %else14
then14:
%.139 = add i32 0, 2
%.140 = load i32, i32* %a
%.141 = icmp ne i32 %.139, %.140
br i1 %.141, label %then15, label %else15
then15:
br label %ifCont15
else15:
br label %ifCont15
ifCont15:
br label %ifCont14
else14:
br label %ifCont14
ifCont14:
br label %ifCont13
else13:
br label %ifCont13
ifCont13:
br label %ifCont12
else12:
br label %ifCont12
ifCont12:
br label %ifCont11
else11:
br label %ifCont11
ifCont11:
br label %ifCont10
else10:
br label %ifCont10
ifCont10:
br label %ifCont9
else9:
br label %ifCont9
ifCont9:
br label %ifCont8
else8:
br label %ifCont8
ifCont8:
br label %ifCont7
else7:
br label %ifCont7
ifCont7:
br label %ifCont6
else6:
br label %ifCont6
ifCont6:
br label %ifCont5
else5:
br label %ifCont5
ifCont5:
br label %ifCont4
else4:
br label %ifCont4
ifCont4:
%.142 = call i32 (i8*, ...) @printf(i8* getelementptr  ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0))
%.143 = load double, double* %d
%.144 = add i32 0, 2
%.145 = sitofp i32 %.144 to double
%.146 = fcmp oge double %.143, %.145
br i1 %.146, label %then16, label %else16
then16:
%.147 = load double, double* %d
%.148 = add i32 0, 2
%.149 = sitofp i32 %.148 to double
%.150 = fcmp ole double %.147, %.149
br i1 %.150, label %then17, label %else17
then17:
%.151 = add i32 0, 2
%.152 = load double, double* %d
%.153 = sitofp i32 %.151 to double
%.154 = fcmp oge double %.153, %.152
br i1 %.154, label %then18, label %else18
then18:
%.155 = add i32 0, 2
%.156 = load double, double* %d
%.157 = sitofp i32 %.155 to double
%.158 = fcmp ole double %.157, %.156
br i1 %.158, label %then19, label %else19
then19:
%.159 = load double, double* %d
%.160 = add i32 0, 2
%.161 = sitofp i32 %.160 to double
%.162 = fcmp oeq double %.159, %.161
br i1 %.162, label %then20, label %else20
then20:
%.163 = add i32 0, 2
%.164 = load double, double* %d
%.165 = sitofp i32 %.163 to double
%.166 = fcmp oeq double %.165, %.164
br i1 %.166, label %then21, label %else21
then21:
%.167 = load double, double* %d
%.168 = add i32 0, 2
%.169 = sitofp i32 %.168 to double
%.170 = fcmp ogt double %.167, %.169
br i1 %.170, label %then22, label %else22
then22:
%.171 = load double, double* %d
%.172 = add i32 0, 2
%.173 = sitofp i32 %.172 to double
%.174 = fcmp olt double %.171, %.173
br i1 %.174, label %then23, label %else23
then23:
%.175 = add i32 0, 2
%.176 = load double, double* %d
%.177 = sitofp i32 %.175 to double
%.178 = fcmp ogt double %.177, %.176
br i1 %.178, label %then24, label %else24
then24:
%.179 = add i32 0, 2
%.180 = load double, double* %d
%.181 = sitofp i32 %.179 to double
%.182 = fcmp olt double %.181, %.180
br i1 %.182, label %then25, label %else25
then25:
%.183 = load double, double* %d
%.184 = add i32 0, 2
%.185 = sitofp i32 %.184 to double
%.186 = fcmp one double %.183, %.185
br i1 %.186, label %then26, label %else26
then26:
%.187 = add i32 0, 2
%.188 = load double, double* %d
%.189 = sitofp i32 %.187 to double
%.190 = fcmp one double %.189, %.188
br i1 %.190, label %then27, label %else27
then27:
br label %ifCont27
else27:
br label %ifCont27
ifCont27:
br label %ifCont26
else26:
br label %ifCont26
ifCont26:
br label %ifCont25
else25:
br label %ifCont25
ifCont25:
br label %ifCont24
else24:
br label %ifCont24
ifCont24:
br label %ifCont23
else23:
br label %ifCont23
ifCont23:
br label %ifCont22
else22:
br label %ifCont22
ifCont22:
br label %ifCont21
else21:
br label %ifCont21
ifCont21:
br label %ifCont20
else20:
br label %ifCont20
ifCont20:
br label %ifCont19
else19:
br label %ifCont19
ifCont19:
br label %ifCont18
else18:
br label %ifCont18
ifCont18:
br label %ifCont17
else17:
br label %ifCont17
ifCont17:
br label %ifCont16
else16:
br label %ifCont16
ifCont16:
%.191 = load double, double* %d
%.192 = fadd double 0.000000, 2.2000000000000002
%.193 = fcmp oge double %.191, %.192
br i1 %.193, label %then28, label %else28
then28:
%.194 = load double, double* %d
%.195 = fadd double 0.000000, 2.2000000000000002
%.196 = fcmp ole double %.194, %.195
br i1 %.196, label %then29, label %else29
then29:
%.197 = fadd double 0.000000, 2.2000000000000002
%.198 = load double, double* %d
%.199 = fcmp oge double %.197, %.198
br i1 %.199, label %then30, label %else30
then30:
%.200 = fadd double 0.000000, 2.2000000000000002
%.201 = load double, double* %d
%.202 = fcmp ole double %.200, %.201
br i1 %.202, label %then31, label %else31
then31:
%.203 = load double, double* %d
%.204 = fadd double 0.000000, 2.2000000000000002
%.205 = fcmp oeq double %.203, %.204
br i1 %.205, label %then32, label %else32
then32:
%.206 = fadd double 0.000000, 2.2000000000000002
%.207 = load double, double* %d
%.208 = fcmp oeq double %.206, %.207
br i1 %.208, label %then33, label %else33
then33:
%.209 = load double, double* %d
%.210 = fadd double 0.000000, 2.2000000000000002
%.211 = fcmp ogt double %.209, %.210
br i1 %.211, label %then34, label %else34
then34:
%.212 = load double, double* %d
%.213 = fadd double 0.000000, 2.2000000000000002
%.214 = fcmp olt double %.212, %.213
br i1 %.214, label %then35, label %else35
then35:
%.215 = fadd double 0.000000, 2.2000000000000002
%.216 = load double, double* %d
%.217 = fcmp ogt double %.215, %.216
br i1 %.217, label %then36, label %else36
then36:
%.218 = fadd double 0.000000, 2.2000000000000002
%.219 = load double, double* %d
%.220 = fcmp olt double %.218, %.219
br i1 %.220, label %then37, label %else37
then37:
%.221 = load double, double* %d
%.222 = fadd double 0.000000, 2.2000000000000002
%.223 = fcmp one double %.221, %.222
br i1 %.223, label %then38, label %else38
then38:
%.224 = fadd double 0.000000, 2.2000000000000002
%.225 = load double, double* %d
%.226 = fcmp one double %.224, %.225
br i1 %.226, label %then39, label %else39
then39:
br label %ifCont39
else39:
br label %ifCont39
ifCont39:
br label %ifCont38
else38:
br label %ifCont38
ifCont38:
br label %ifCont37
else37:
br label %ifCont37
ifCont37:
br label %ifCont36
else36:
br label %ifCont36
ifCont36:
br label %ifCont35
else35:
br label %ifCont35
ifCont35:
br label %ifCont34
else34:
br label %ifCont34
ifCont34:
br label %ifCont33
else33:
br label %ifCont33
ifCont33:
br label %ifCont32
else32:
br label %ifCont32
ifCont32:
br label %ifCont31
else31:
br label %ifCont31
ifCont31:
br label %ifCont30
else30:
br label %ifCont30
ifCont30:
br label %ifCont29
else29:
br label %ifCont29
ifCont29:
br label %ifCont28
else28:
br label %ifCont28
ifCont28:
%.227 = load i1, i1* %b1
%.228 = or i1 false, true
%.229 = icmp eq i1 %.227, %.228
%.230 = load double, double* %d
%.231 = fadd double 0.000000, 2.2000000000000002
%.232 = fcmp oge double %.230, %.231
%.233 = and i1 %.229, %.232
%.234 = add i32 0, 2
%.235 = load double, double* %d
%.236 = sitofp i32 %.234 to double
%.237 = fcmp oge double %.236, %.235
%.238 = and i1 %.233, %.237
%.239 = fadd double 0.000000, 2.2000000000000002
%.240 = load double, double* %d
%.241 = fcmp ole double %.239, %.240
%.242 = and i1 %.238, %.241
%.243 = fadd double 0.000000, 2.2000000000000002
%.244 = load double, double* %d
%.245 = fadd double 0.000000, 2.2999999999999998
%.246 = add i32 0, 2
store i32 %.246, i32* %a
%.247 = sitofp i32 %.246 to double
%.248 = fadd double %.245, %.247
%.249 = add i32 0, 2
%.250 = sitofp i32 %.249 to double
store double %.250, double* %d
%.251 = fadd double %.248, %.250
store double %.251, double* %d
%.252 = fadd double %.244, %.251
%.253 = fcmp oeq double %.243, %.252
%.254 = or i1 %.242, %.253
br i1 %.254, label %then40, label %else40
then40:
%.255 = or i1 false, true
%.256 = load i1, i1* %b1
%.257 = icmp eq i1 %.255, %.256
br i1 %.257, label %then41, label %else41
then41:
%.258 = load i1, i1* %b1
%.259 = or i1 false, true
%.260 = icmp ne i1 %.258, %.259
br i1 %.260, label %then42, label %else42
then42:
%.261 = or i1 false, true
%.262 = load i1, i1* %b1
%.263 = icmp ne i1 %.261, %.262
br i1 %.263, label %then43, label %else43
then43:
br label %ifCont43
else43:
br label %ifCont43
ifCont43:
br label %ifCont42
else42:
br label %ifCont42
ifCont42:
br label %ifCont41
else41:
br label %ifCont41
ifCont41:
br label %ifCont40
else40:
br label %ifCont40
ifCont40:
%.264 = load i1, i1* %b1
%.265 = or i1 false, true
%.266 = and i1 %.264, %.265
%.267 = load i1, i1* %b1
%.268 = or i1 %.266, %.267
%.269 = or i1 false, true
%.270 = load i1, i1* %b1
%.271 = alloca i1
br i1 %.270, label %then45, label %else45
then45:
store i1 false, i1* %.271
br label %ifCont45
else45:
store i1 true, i1* %.271
br label %ifCont45
ifCont45:
%.272 = load i1, i1* %.271
%.273 = and i1 %.269, %.272
%.274 = or i1 %.268, %.273
%.275 = or i1 false, false
%.276 = xor i1 %.274, %.275
br i1 %.276, label %then44, label %else44
then44:
%.277 = or i1 false, true
%.278 = load i1, i1* %b1
%.279 = and i1 %.277, %.278
%.280 = or i1 false, true
%.281 = or i1 %.279, %.280
%.282 = load i1, i1* %b1
%.283 = or i1 false, false
%.284 = and i1 %.282, %.283
%.285 = or i1 %.281, %.284
%.286 = load i1, i1* %b1
%.287 = alloca i1
br i1 %.286, label %then47, label %else47
then47:
store i1 false, i1* %.287
br label %ifCont47
else47:
store i1 true, i1* %.287
br label %ifCont47
ifCont47:
%.288 = load i1, i1* %.287
%.289 = xor i1 %.285, %.288
br i1 %.289, label %then46, label %else46
then46:
br label %ifCont46
else46:
br label %ifCont46
ifCont46:
br label %ifCont44
else44:
br label %ifCont44
ifCont44:
%.290 = call i32 (i8*, ...) @printf(i8* getelementptr  ([11 x i8], [11 x i8]* @.str.8, i32 0, i32 0))
%.291 = load i32, i32* %a
%.292 = load double, double* %d
%.293 = fsub double 0.0, %.292
%.294 = sitofp i32 %.291 to double
%.295 = fmul double %.294, %.293
%.296 = call i32 (i8*, ...) @printf(i8* getelementptr  ([6 x i8], [6 x i8]* @.str.double, i32 0, i32 0), double %.295)
%.297 = call i32 (i8*, ...) @printf(i8* getelementptr  ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
%.298 = or i1 false, false
%.299 = load i1, i1* %b1
%.300 = alloca i1
br i1 %.299, label %then48, label %else48
then48:
store i1 false, i1* %.300
br label %ifCont48
else48:
store i1 true, i1* %.300
br label %ifCont48
ifCont48:
%.301 = load i1, i1* %.300
%.302 = xor i1 %.298, %.301
br i1 %.302, label %then49, label %else49
then49:
%.303 = call i32 (i8*, ...) @printf(i8* getelementptr  ([5 x i8], [5 x i8]* @.str.true, i32 0, i32 0))
br label %ifCont49
else49:
%.304 = call i32 (i8*, ...) @printf(i8* getelementptr  ([6 x i8], [6 x i8]* @.str.false, i32 0, i32 0))
br label %ifCont49
ifCont49:
%.305 = call i32 (i8*, ...) @printf(i8* getelementptr  ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0))
%d1 = alloca double
%.306 = load i32, i32* %size.
%.307 = sub i32 %.306, 1
%.308 = fadd double 0.000000, 1.1000000000000001
%.309 = sitofp i32 %.307 to double
%.310 = fadd double %.309, %.308
%.311 = add i32 0, 3
%.312 = sitofp i32 %.311 to double
%.313 = call double @method_overload_1(double %.312)
%.314 = fadd double %.310, %.313
%.315 = add i32 0, 3
%.316 = add i32 0, 3
%.317 = mul i32 %.315, %.316
%.318 = sitofp i32 %.317 to double
%.319 = fadd double %.314, %.318
%.320 = add i32 0, 2
%.321 = sitofp i32 %.320 to double
%.322 = fadd double %.319, %.321
%.323 = add i32 0, 2
%.324 = sitofp i32 %.323 to double
%.325 = fadd double %.322, %.324
%.326 = add i32 0, 2
%.327 = sub i32 0, %.326
%.328 = sitofp i32 %.327 to double
%.329 = fadd double %.325, %.328
%.330 = add i32 0, 3
%.331 = add i32 0, 3
%.332 = udiv i32 %.330, %.331
%.333 = sitofp i32 %.332 to double
%.334 = fadd double %.329, %.333
store double %.334, double* %d1
%i = alloca i32
%.335 = add i32 0, 0
store i32 %.335, i32* %i
%j = alloca i32
%.336 = add i32 0, 0
store i32 %.336, i32* %j
%.337 = call i32 (i8*, ...) @printf(i8* getelementptr  ([14 x i8], [14 x i8]* @.str.11, i32 0, i32 0))
br label %while1
while1:
br label %while2
while2:
br label %while3
while3:
%.338 = load i32, i32* %i
%.339 = add i32 0, 1
%.340 = add i32 %.338, %.339
store i32 %.340, i32* %i
%.341 = load i32, i32* %j
%.342 = add i32 0, 1
%.343 = add i32 %.341, %.342
store i32 %.343, i32* %j
%.344 = load i32, i32* %i
%.345 = add i32 0, 10
%.346 = icmp eq i32 %.344, %.345
br i1 %.346, label %then50, label %else50
then50:
%.347 = load i32, i32* %j
%.348 = add i32 0, 9
%.349 = icmp eq i32 %.347, %.348
br i1 %.349, label %then51, label %else51
then51:
br label %ifCont51
else51:
br label %ifCont51
ifCont51:
br label %ifCont50
else50:
br label %ifCont50
ifCont50:
%.350 = add i32 0, 20
%.351 = load i32, i32* %j
%.352 = icmp sgt i32 %.350, %.351
%.353 = load i32, i32* %i
%.354 = add i32 0, 10
%.355 = icmp slt i32 %.353, %.354
%.356 = and i1 %.352, %.355
br i1 %.356, label %while3, label %whileCont3
whileCont3:
%.357 = add i32 0, 10
%.358 = load i32, i32* %i
%.359 = icmp sgt i32 %.357, %.358
br i1 %.359, label %while2, label %whileCont2
whileCont2:
%.360 = load i32, i32* %i
%.361 = add i32 0, 10
%.362 = icmp slt i32 %.360, %.361
br i1 %.362, label %while1, label %whileCont1
whileCont1:
%.363 = call i32 (i8*, ...) @printf(i8* getelementptr  ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0))
ret void
}
define i32 @main(i32 %.size,i8** %.args){
call void @main.entry(i32 %.size, i8** %.args)
ret i32 0
}
declare i32 @printf(i8*, ...)
declare i32 @atoi(i8*)
