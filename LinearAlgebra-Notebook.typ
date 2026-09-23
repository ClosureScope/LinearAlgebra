#set text(lang: "zh", region: "cn")
#import "template.typ": *
#set text(font: (font-en, font-song))
#show strong: set text(font: (font-en, font-hei), weight: "regular")
#show emph: text.with(font: (font-en, font-kai), style: "normal")
#show: frame-style(styles.hint)
#show: ilm.with(
  title: [线性代数],
  author: "Closure",
  figure-index: (enabled: true),
)

= 线性方程组与矩阵

== 基本概念

#definition[数域][如果数集$F$中任意两个数作某种运算的结果仍属于$F$，则称$F$对这种运算封闭。]

#definition[][设$F$是包含$1$的数集，若$F$对四则运算封闭，则称$F$为一个数域。]

#theorem[][最小的数域是有理数域，最大的数域是复数域。]

$ Q(sqrt(2)) = {a + b sqrt(2) | a, b in Q} $

#definition[][常数项全为$0$，称为齐次线性方程组，否则为非齐次线性方程组。]

#definition[矩阵][
  $m$行$n$列的矩形阵列
  $
    mat(a_(11), a_(12), dots.c, a_(1 n); a_(21), a_(22), dots.c, a_(2 n); dots.v, dots.v, dots.down, dots.v; a_(m 1), a_(m 2), dots.c, a_(m n))
  $
  称为一个$m times n$矩阵，$a_(i j)$为位于第$i$行第$j$列的数，称为元素。简记为$(a_(i j))_(m times n)$或$[a_(i j)]_(m times n)$。

  用$A, B, C, dots.c, M, N, dots.c$表示矩阵，但$E, I, O$保留给特定的矩阵。
]

系数矩阵与增广矩阵：
$
  tilde(A) = mat(a_(11), a_(12), dots.c, a_(1 n), b_1; a_(21), a_(22), dots.c, a_(2 n), b_2; dots.v, dots.v, , dots.v, dots.v; a_(m 1), a_(m 2), dots.c, a_(m n), b_m)
$

#definition[][设$A = (a_(i j))_(m times n), B = (b_(i j))_(s times t)$，若$m=s, n=t$，称$A$与$B$同型。若$A$与$B$同型，且对每组$i,j$有$a_(i j)=b_(i j)$，则$A=B$。]

行向量、列向量、零矩阵$O$。

方阵$A=(a_(i j))_n$，有主对角线和主对角元。

方阵中有对角矩阵、三对角矩阵、上（下）三角矩阵、对称矩阵、反对称矩阵。

=== 特殊矩阵

#definition[对角矩阵][
  $ "diag"(a_(11),a_(22),dots.c,a_(n n)) := mat(a_(11), , ; , a_(22), ; , , dots.down; , , a_(n n)) $
]

上、下三角阵：
$
  mat(a_(11), a_(12), dots.c, a_(1 n); , a_(22), dots.c, a_(2 n); , , dots.down, dots.v; , , , a_(n n)) quad mat(a_(11), , , ; a_(21), a_(22), , ; dots.v, dots.v, dots.down, ; a_(n 1), a_(n 2), dots.c, a_(n n))
$

对称与反对称矩阵的例：
$ mat(1, 2, 0; 2, -1, 3; 0, 3, -2) quad mat(0, 2, -3; -2, 0, 1; 3, -1, 0) $

#definition[单位矩阵][$"diag"(1,1,dots.c,1)$记为$E$或$I$。]

$"diag"(c,c,dots.c,c)$称为数量矩阵。

=== 初等行变换与阶梯形矩阵

初等行变换：
+ 交换两行；
+ 用一非零数乘以某一行；
+ 将某一行的$k$倍加到另一行上去。

方程行初等行变换得到的是同解方程组。

#definition[阶梯形矩阵][
  + 非零行的标号小于零行的标号；
  + 设矩阵有$r$个非零行，第$i$个非零行的第一个非零元所在列标为$j_i$，则$j_1<j_2<dots.c<j_r$。
]

#definition[Hermite标准型][阶梯形矩阵还满足：
  + 每个非零行第一个非零元为$1$；
  + 每个非零行第一个非零元所在列的其它元素全为$0$。
]

#note[][可以证明一个矩阵可以化成的Hermite标准型是唯一的。]

#theorem[][任何矩阵都可以经初等行变换化为阶梯形矩阵/Hermite标准型。]

方程组有解当且仅当没有主元落在最后一列。主元的个数等于非零行数。有唯一解当且仅当没有自由未知量。

#theorem[线性代数基本定理][主未知量个数$+$自由未知量个数$=$总未知量个数。]

== 矩阵的运算

=== 加减法与数乘

#definition[][设$A=(a_(i j))_(m times n), B=(b_(i j))_(m times n)$，加（减）法定义为$C=(c_(i j))_(m times n)$，其中$c_(i j)=a_(i j) plus.minus b_(i j)$。]

设$A,B,C$为同类型矩阵：
$ A+B=B+A, quad (A+B)+C=A+(B+C), quad A+O=A, quad A+(-A)=O $

#definition[数乘][矩阵$A=(a_(i j))_(m times n)$与数$k$的乘法定义为$k dot A=k A=(k a_(i j))$。]

$ 1 A=A, quad k (l A)=(k l) A, quad k (A+B)=k A+k B, quad (k+l) A=k A+l A $

$-A$既是$O-A$又是$(-1) A$。

=== 矩阵乘法

#definition[][设$A=(a_(i j))_(m times p), B=(b_(i j))_(p times n)$，乘积$A B=C=(c_(i j))_(m times n)$，其中
  $ c_(i j)=a_(i 1) b_(1 j)+a_(i 2) b_(2 j)+dots.c+a_(i p) b_(p j) $
]

左行右列。

方程组的矩阵乘积记法：
$ A X = beta $

多元线性递归：
$
  mat(x_(i+1); y_(i+1); z_(i+1)) = mat(a_(11), a_(12), a_(13); a_(21), a_(22), a_(23); a_(31), a_(32), a_(33)) mat(x_i; y_i; z_i)
$

矩阵乘法不满足交换律。$A B=B A$时，称二者是可换的。

#definition[零因子][存在$A eq.not O, B eq.not O$且$A B=O$。对方阵，左零因子也一定是右零因子，反之亦然。]

零因子与消去律：$A B=A C arrow.r.double B=C$。什么样的$A$不是零因子？$arrow.r.double$可逆矩阵。$A$可能是零因子怎么办？$arrow.r.double$高斯消元法（乘以一个可逆矩阵）。

#proposition[矩阵乘法的性质][
  $ (A B) C=A (B C) $

  $ A (B+C)=A B+A C, quad (A+B) C=A C+B C $

  $ c (A B)=(c A) B=A (c B) $

  $ E_m A_(m times n) E_n=E_m A_(m times n)=A_(m times n) E_n=A_(m times n) $

  $ O_(k times m) A_(m times n)=O_(k times n), quad A_(m times n) O_(n times q)=O_(m times q) $
]

在$k (a_1,a_2,dots.c,a_n)$中，把$k$理解成$1 times 1$矩阵，作左乘与理解成数乘结果相同；对$1 times 1$矩阵右乘列向量也有类似结果。

=== 方阵的幂与多项式

#definition[][设$A$是$n$阶矩阵，$m in N^+$，$A^m=A A dots.c A$（$m$个$A$），$A^0=E$。]

$ A^m A^n=A^(m+n), quad (A^m)^n=A^(m n) $

#example[][若$A=mat(1, -1, 2; -2, 2, -4; 1, -1, 2)=mat(1; -2; 1) (1,-1,2)$，则
  $ A^n=mat(1; -2; 1) ((1,-1,2) mat(1; -2; 1))^(n-1) (1,-1,2)=5^(n-1) A $
]

#definition[方阵的多项式][$ f(A)=a_0 A^n+a_1 A^(n-1)+dots.c+a_(n-1) A+a_n E $。]

=== 矩阵的转置、迹与共轭

#definition[矩阵的转置][设$A=(a_(i j))$是$m times n$矩阵，定义$n times m$矩阵$A^T=(b_(k l))$为$A$的转置，其中$b_(k l)=a_(l k)$。]

$ (A^T)^T=A, quad (A+B)^T=A^T+B^T, quad (c A)^T=c A^T $
$ (A B)^T=B^T A^T, quad (A_1 A_2 dots.c A_m)^T=A_m^T dots.c A_2^T A_1^T, quad (A^m)^T=(A^T)^m $

#definition[对称矩阵][若$A^T=A$，称$A$为对称矩阵。]
#definition[反对称矩阵][若$A^T=-A$，称$A$为反对称矩阵。]

每个方阵都可写成对称矩阵与反对称矩阵的和：
$ A=1/2(A+A^T)+1/2(A-A^T) $

#definition[迹][对方阵$A=(a_(i j))$，称$sum_(i=1)^n a_(i i)$为$A$的迹，记为$"tr"(A)$，即$"tr"(A)=a_(11)+a_(22)+dots.c+a_(n n)$。]

$ "tr"(A+B)="tr"(A)+"tr"(B), quad "tr"(k A)=k"tr"(A) $
$ "tr"(A B)="tr"(B A), quad "tr"(A^T)="tr"(A) $

#definition[矩阵的共轭][对复矩阵$A=(a_(i j))$，定义$overline(A)=(overline(a_(i j)))$为$A$的共轭。]

$
  overline(A+B)=overline(A)+overline(B), quad overline(c A)=overline(c) overline(A), quad overline(A B)=overline(A) overline(B)
$

$ overline(A^T)=(overline(A))^T $

#definition[Hermite矩阵][若$overline(A)^T=A$，称$A$为Hermite矩阵。]
#definition[斜Hermite矩阵][若$overline(A)^T=-A$，称$A$为斜Hermite矩阵。]

= 行列式、可逆矩阵与秩

== 行列式

=== 排列与$n$阶行列式

#definition[排列][把$n$个不同的元素按一定的顺序排成一行（$n>=2$），称为这$n$个元素的排列，用$i_1 i_2 dots.c i_n$或$i_1,i_2,dots.c,i_n$表示一个$n$阶排列。]

#definition[排列的奇偶性][在一个$n$阶排列中，取$(i_j,i_k),j<k$，若$i_j<i_k$称为一个数对构成顺序，否则称构成逆序。逆序的个数称为逆序数，记作$tau(i_1 i_2 dots.c i_n)$。若$tau$为偶数称为偶排列，否则称为奇排列。]

对换：交换某两个数的位置。任意两个$n$阶排列可以通过若干次对换互相转化。

#theorem[][对换改变排列的奇偶性。]

#definition[$n$阶行列式][对$n^2$个数$a_(i j),1<=i,j<=n$，
  $ |a_(i j)|=sum_(j_1 dots.c j_n) (-1)^(tau(j_1 dots.c j_n)) a_(1 j_1) a_(2 j_2) dots.c a_(n j_n) $
]

上、下三角行列式及对角行列式均有$D=a_(11) a_(22) dots.c a_(n n)$。

#theorem[几个等价的计算方式][对任意给定排列$k_1 k_2 dots.c k_n$，有
  $
    D=(-1)^(tau(k_1 dots.c k_n)) sum_(j_1 dots.c j_n) (-1)^(tau(j_1 dots.c j_n)) a_(k_1 j_1) a_(k_2 j_2) dots.c a_(k_n j_n)
  $
  $ =sum_(i_1 dots.c i_n) (-1)^(tau(i_1 dots.c i_n)) a_(i_1 1) a_(i_2 2) dots.c a_(i_n n) $
]

#proposition[行列式的性质][
  + $D^T=D$。
  + 交换行列式中两行的位置，行列式变号。推论：两行相同，行列式为$0$。
  + 某一行乘$c$，行列式乘$c$。推论：两行成比例，行列式为$0$。
  + 某行可按和拆开。
  + 某一行加上另一行的$k$倍，行列式不变。
]

#definition[余子式与代数余子式][划去$a_(i j)$所在行和列，剩下$(n-1)^2$个元素按原位置构成的$n-1$阶行列式为$a_(i j)$的余子式，记作$M_(i j)$；$(-1)^(i+j) M_(i j)$为$a_(i j)$的代数余子式，记作$A_(i j)$。]

$ D=a_(i 1) A_(i 1)+a_(i 2) A_(i 2)+dots.c+a_(i n) A_(i n)=sum_(j=1)^n a_(i j) A_(i j) $

#proposition[][一个行列式某一行（列）乘以别人的代数余子式等于$0$。]

#definition[Kronecker符号][$ delta_(i j)=cases(1, &i=j, 0, &i eq.not j) $]

$ sum_(k=1)^n a_(i k) A_(j k)=delta_(i j) D $

=== 几类行列式

行（列）和相等的行列式：
$
  D=mat(delim: "|", lambda, a, a, dots.c, a; a, lambda, a, dots.c, a; dots.v, dots.v, dots.v, , dots.v; a, a, a, dots.c, lambda)=(lambda+(n-1) a) (lambda-a)^(n-1)
$

爪形行列式：若$d_k$均不为$0$，
$ D=(a_0-sum_(k=1)^n (a_k b_k)/d_k) d_1 d_2 dots.c d_n $

若存在$i$使$d_i=0$，则$D=-a_i b_i d_1 dots.c d_(i-1) d_(i+1) dots.c d_n$。

三对角行列式：
$ D_n=alpha_n D_(n-1)-beta_(n-1) gamma_(n-1) D_(n-2) $

Vandermonde行列式：
$ V_n=product_(1<=i<j<=n) (x_j-x_i) $

#example[][对原笔记中的行列式$D$，三种方法（提取因子、升阶法、多项式系数法）均得到$D=x^2 y^2$。]

#definition[子式][在$n$阶行列式$D$中任取$k$行$k$列，交叉点的$k^2$个元素构成$D$的一个$k$阶子式，记为$D (i_1 i_2 dots.c i_k)/(j_1 j_2 dots.c j_k)$。]

#definition[余子式][在$D$中划去$D (i_1 dots.c i_k)/(j_1 dots.c j_k)$的行列，剩下$(n-k)^2$个元素为其余子式，记为$M (i_1 dots.c i_k)/(j_1 dots.c j_k)$。]

#definition[代数余子式][$ tilde(D) (i_1 dots.c i_k)/(j_1 dots.c j_k)=(-1)^((i_1+dots.c+i_k)+(j_1+dots.c+j_k)) M (i_1 dots.c i_k)/(j_1 dots.c j_k) $。]

#theorem[Laplace定理][在$n$阶行列式$D$中任取$k$行，含于这$k$行的全部$k$阶子式与它们对应的代数余子式乘积之和为$D$。]

#note[Laplace定理的应用][
  $ mat(delim: "|", A, O; *, B)=|A| |B|=mat(delim: "|", A, *; O, B)) $

  $ mat(delim: "|", O, A; B, *)=(-1)^(m n) |A| |B| $
]

行列式的乘积法则（左行右列）。原笔记给出的四阶例满足$D^2=D D^T=(a^2+b^2+c^2+d^2)^4$，又$a^4$项系数为$1$，故$D=(a^2+b^2+c^2+d^2)^2$。

循环行列式：令$f(x)=a_1+a_2 x+dots.c+a_n x^(n-1)$，$n$个$n$次单位根为$epsilon_1,dots.c,epsilon_n$，取Vandermonde行列式$V$，有$D V=f(epsilon_1) f(epsilon_2) dots.c f(epsilon_n) V$。$V eq.not 0$，故$D=f(epsilon_1) dots.c f(epsilon_n)$。

#theorem[Cramer法则][如果方程组的系数行列式不等于$0$，则它有唯一解
  $ x_1=D_1/D, x_2=D_2/D, dots.c, x_n=D_n/D $
  其中$D_j$是把$D$的第$j$列各元素依次换成右端常数列得到的行列式。
]

#proposition[][若齐次线性方程组的系数行列式不等于$0$，则它只有零解。]
#proposition[][若齐次线性方程组有非零解，则它的系数行列式等于$0$。]

== 可逆矩阵

#definition[可逆矩阵][设$A$是$n$阶方阵，若存在方阵$B$使$A B=B A=E_n$，称$B$是$A$的逆，记为$B=A^(-1)$；有逆的矩阵称为可逆矩阵。若$B=A^(-1)$，也有$A=B^(-1)$。若有$C A=E_n$，称$C$是$A$的左逆，$A$是$C$的右逆。]

#theorem[唯一性][若$A$既有左逆$B$又有右逆$C$，则$A$可逆且$A^(-1)=B=C$。]

#proposition[][若$A$可逆，则其逆唯一。]

#theorem[][设方阵$A$满足，对任意同阶方阵$B$，有$A B=B A=B$，则$A=E$。]

#theorem[存在性][$|A| eq.not 0 <-> A$可逆。]

#definition[伴随矩阵][设$A_(i j)$为$A=(a_(i j))_n$的代数余子式，矩阵$mat(A_(11), A_(21), dots.c, A_(n 1); A_(12), A_(22), dots.c, A_(n 2); dots.v, dots.v, , dots.v; A_(1 n), A_(2 n), dots.c, A_(n n))$为$A$的伴随矩阵，记为$A^*$。注意$A_(i j)$在$(j,i)$位置。]

$ A A^*=A^*A=|A|E $

#theorem[][$|A| eq.not 0$是$A$可逆的充要条件，有$A^(-1)=|A|^(-1) A^*$。]

#definition[][行列式不等于$0$的矩阵又称为非奇异矩阵（即可逆矩阵）。]

#example[][设$A^3+A-2E=O$，则$A [1/2(A^2+E)]=E$，故$A^(-1)=1/2(A^2+E)$。一般地，$f(lambda)=(lambda-k) g(lambda)+c$（$c eq.not 0$）且$f(A)=O$，则$(A-k E)^(-1)=-1/c g(A)$。]

#example[][设$A+B+A B=O$，则$(A+E) (B+E)=E$，$(A+E)^(-1)=B+E$，$(B+E) (A+E)=E$，$B A=-A-B=A B$。]

#theorem[Cramer法则的矩阵形式][若$A_m$与$B_n$可逆，对任意$C_(m times n)$，矩阵方程$A X B=C$有唯一解$X=A^(-1) C B^(-1)$。]

#proposition[逆矩阵的性质][
  $ (A^(-1))^(-1)=A, quad (k A)^(-1)=1/k A^(-1) $
  $ (A B)^(-1)=B^(-1) A^(-1), quad (A_1 A_2 dots.c A_s)^(-1)=A_s^(-1) dots.c A_2^(-1) A_1^(-1) $
  $ (A^T)^(-1)=(A^(-1))^T, quad |A^(-1)|=|A|^(-1), quad (A^s)^(-1)=(A^(-1))^s $
]

$ (A B)^*=B^*A^* $

== 矩阵的分块、初等变换与秩

#definition[分块矩阵][对$m times n$矩阵$A$，用若干条横线分成$r$个条，用若干条竖线分成$s$个条，得到分块矩阵$A=(A_(i j))_(r times s)$。]

#proposition[][矩阵的分块乘积与不分块乘积是一致的。]

常用的乘法：$A (beta_1,beta_2,dots.c,beta_n)=(A beta_1,A beta_2,dots.c,A beta_n)$；矩阵乘列向量为各列的相应线性组合。$epsilon_j$为标准单位列向量，$e_i=(0,dots.c,0,1,0,dots.c,0)$为标准单位行向量。

分块对角矩阵$"diag"(A_1,A_2,dots.c,A_s)$：若每个$A_i$均为$n_i$阶可逆方阵，则它也可逆，逆为$"diag"(A_1^(-1),dots.c,A_s^(-1))$。

分块矩阵的转置按块转置并交换块位置；共轭逐块共轭。

=== 矩阵的初等变换与矩阵的秩

#definition[（相抵）标准形矩阵][$mat(E_r, O; O, O)$。]

#theorem[][任何矩阵都可以经过初等变换化为标准形矩阵。]

#definition[矩阵的秩][若在矩阵$A=(a_(i j))_(m times n)$中存在一个$r$阶子式不为$0$，但$A$中任意$r+1$阶子式都为$0$，称$r$为$A$的秩，记为$r(A)$或$"rank"(A)$。即矩阵的秩等于它的非零子式的最高阶数。]

#proposition[秩的简单性质][
  $ r(A_(m times n))<=min{m,n} $
  若$r(A)=m$（$n$），称$A$是行（列）满秩矩阵；若$r(A)=m=n$称$A$是满秩矩阵。
  $A$是满秩矩阵$<->$ $A$是可逆矩阵。
  若有$r$阶子式不为$0$，则$r(A)>=r$；若所有$r$阶子式为$0$，则$r(A)<r$。
  对$A$的任意子矩阵$A_1$，$r(A_1)<=r(A)$。
  $r(A^T)=r(A)$。
  阶梯型矩阵的秩等于非零行数，标准形矩阵的秩等于其单位阵阶数。
]

#theorem[][初等变换不改变矩阵的秩。]

#definition[初等矩阵][单位矩阵经过一次初等变换得到的矩阵为初等矩阵。]

#theorem[][初等矩阵左乘$A$等价于对$A$作初等行变换；右乘$A$等价于对$A$作初等列变换。]

#proposition[][初等矩阵都是可逆矩阵，逆为同类型初等矩阵。]

#proposition[][对任何$m times n$矩阵$A$，存在$m$阶可逆矩阵$P$及$n$阶可逆矩阵$Q$使$P A Q=mat(E_r, O; O, O)$，其中$r=r(A)$。]

#proposition[][$A$可逆$<->$ $A$的标准形为单位矩阵。]
#proposition[][$A$可逆$<->$ $A=P_1 P_2 dots.c P_k$，$P_i$为初等矩阵。]
#proposition[][任何一个可逆矩阵可用初等行变换化为单位矩阵。]
#proposition[][可逆矩阵（乘）不改变矩阵的秩。]

#theorem[满秩分解][对$m times n$阶矩阵$A$，$r(A)=r$，存在$m times r$矩阵$B$与$r times n$矩阵$C$使$A=B C$，且$r(B)=r(C)=r$。]

#proof[][
  $P A Q=mat(E_r, O; O, O)$，故$A=P^(-1) mat(E_r; O) (E_r,O) Q^(-1)$。
  取$B=P^(-1) mat(E_r; O)$，$C=(E_r,O) Q^(-1)$，则$A=B C$且$r(B)=r(C)=r$。
]

#note[][可用以对秩为$1$的方阵求其方幂。]

一组初等变换将$A$变成$E$，它们将$E$变成$A^(-1)$：$Q_1 Q_2 dots.c Q_t (A,E)=(E,A^(-1))$。

#definition[矩阵的等价（相抵）][若$A$经有限次初等变换后变为矩阵$B$，称二者等价或相抵。]

#theorem[][$A$与$B$相抵的充要条件是存在可逆矩阵$P,Q$使$P A Q=B$。]

相抵关系满足自反性、对称性、传递性。

分块矩阵的三类块初等行（列）变换：交换两块位置；用可逆矩阵左乘某一块行或右乘某一块列；以某一矩阵左（右）乘某一块行（列）后加到另一块行（列）。第三类不改变行列式；块初等行（列）变换等于在其左（右）边乘相应块初等矩阵。

#theorem[行列式的降阶公式][设$A$是$m$阶可逆矩阵，$D$是$n$阶矩阵，$B$是$m times n$矩阵，$C$是$n times m$矩阵，则
  $ mat(delim: "|", A, B; C, D)=|A| |D-C A^(-1) B| $
  若$D$可逆，则$mat(delim: "|", A, B; C, D)=|D| |A-B D^(-1) C|$。
]

#proposition[关于秩的一些定理][
  $ r(A B)<=min{r(A),r(B)} $
  $ r(A+B)<=r(A,B)<=r(mat(A, O; O, B)) $
  设$A_(m times n),B_(p times q)$，$r(mat(A, O; O, B))=r(A)+r(B)$。
  $r(mat(A, O; C, B))>=r(A)+r(B)$。
  若$n=p$，$r(A B)>=r(A)+r(B)-n$。
]

#theorem[伴随矩阵的秩][设$A$是$n$阶方阵，则
  $ r(A^*)=cases(n, &r(A)=n, 1, &r(A)=n-1, 0, &r(A)<n-1) $
]

#theorem[Gauss消元法解线性方程组的补充][设$A$是$m times n$矩阵，$beta$是$n$维列向量，记$tilde(A)=(A beta)$，则
  + $A X=beta$有解当且仅当$r(A)=r(tilde(A))$；
  + 有唯一解当且仅当$r(A)=r(tilde(A))=n$；
  + 有无穷多解当且仅当$r(A)=r(tilde(A))<n$；
  + 无解当且仅当$r(A) eq.not r(tilde(A))$。
]

#note[][$r(A) eq.not r(tilde(A)) <-> r(A)<r(tilde(A)) <-> r(tilde(A))=r(A)+1$。]

= $n$维向量与线性方程组

#definition[$n$维向量][$alpha=mat(a_1; a_2; dots.v; a_n)$为$n$维列向量，$alpha^T=(a_1,a_2,dots.c,a_n)$为$n$维行向量。]

向量的运算规则：
$ alpha+beta=beta+alpha, quad (alpha+beta)+gamma=alpha+(beta+gamma), quad alpha+0=alpha, quad alpha+(-alpha)=0 $
$ 1 alpha=alpha, quad k (alpha+beta)=k alpha+k beta, quad (k+l) alpha=k alpha+l alpha, quad k (l alpha)=(k l) alpha $

#definition[][$n$维实向量的全体称为（$R$上）$n$维向量空间，记为$R^n$。]

#definition[向量的线性表示][设$alpha_1,alpha_2,dots.c,alpha_m$和$beta$都是$n$维列向量，若存在$m$个数$k_1,dots.c,k_m$使$beta=k_1 alpha_1+dots.c+k_m alpha_m$，则称$beta$是$alpha_1,dots.c,alpha_m$的线性组合，或$beta$可用它们线性表示，$k_i$称为组合系数。]

$ (alpha_1,alpha_2,dots.c,alpha_m) mat(k_1; k_2; dots.v; k_m)=beta $

#theorem[][$beta$可由$alpha_1,dots.c,alpha_m$线性表示当且仅当$A X=beta$有解。]
#proposition[][$beta$可由$alpha_1,dots.c,alpha_m$线性表示当且仅当$r(A)=r(A,beta)$。]

#definition[向量组的线性表示][设有向量组(I)$alpha_1,dots.c,alpha_s$，(I I)$beta_1,dots.c,beta_t$。若(I)中的每个向量都能由(I I)线性表示，称向量组(I)可由向量组(I I)线性表示。]

$
  (alpha_1,dots.c,alpha_s)=(beta_1,dots.c,beta_t) mat(a_(11), dots.c, a_(s 1); dots.v, , dots.v; a_(1 t), dots.c, a_(s t))
$

#definition[向量组的等价][若向量组(I)可由向量组(I I)线性表示，(I I)可由(I)线性表示，称它们等价。]
#theorem[][向量组的等价是等价关系。]

#definition[线性相关][设$alpha_1,dots.c,alpha_m$是$m$个$n$维向量，若存在$R$中$m$个不全为$0$的数$k_1,dots.c,k_m$使$k_1 alpha_1+dots.c+k_m alpha_m=0$，则称线性相关，否则线性无关。]

#theorem[][$alpha_1,dots.c,alpha_m$线性相关当且仅当$A X=0$有非零解。]
#proposition[][$alpha_1,dots.c,alpha_m$线性相关当且仅当$r(A)<m$。]
#proposition[][方阵的列向量线性相关当且仅当$|A|=0$。]
#proposition[][若$m>n$，则$alpha_1,dots.c,alpha_m$必线性相关。]

#theorem[线性无关][$alpha_1,dots.c,alpha_m$线性无关当且仅当$A X=0$只有零解。]
#proposition[][线性无关当且仅当$r(A)=m$。]
#proposition[][线性无关当且仅当$|A| eq.not 0$。]

初等行变换不改变向量组的线性关系。

小组相关则大组相关；若$alpha_1,dots.c,alpha_m$线性无关，则任意部分组也无关。短组无关则长组无关；若$mat(alpha_1; beta_1),dots.c,mat(alpha_m; beta_m)$线性无关，则$alpha_1,dots.c,alpha_m$线性无关；若横接长组相关，则截短组相关。

#theorem[][向量组$alpha_1,dots.c,alpha_m$线性相关当且仅当其中至少一个向量能被其余向量线性表示。]

#theorem[无关向量组表示的唯一性][若$beta$可被无关向量组$alpha_1,dots.c,alpha_m$表示，则表示方式唯一。]

#theorem[从无关到相关][若$alpha_1,dots.c,alpha_m$无关，$alpha_1,dots.c,alpha_m,beta$相关，则$beta$可被$alpha_1,dots.c,alpha_m$表示，且表示方式唯一。]

#theorem[表出组的无关][设$alpha_1,dots.c,alpha_s$可由无关组$beta_1,dots.c,beta_t$表示，系数矩阵为$A$，则$alpha_1,dots.c,alpha_s$无关当且仅当$r(A)=s$；相关当且仅当$r(A)<s$。若$t<s$，则必相关。]

#theorem[][无关的向量组不能被更少的向量表示。]

#definition[极大无关组][设向量组I有一部分组I I：$alpha_(i 1),dots.c,alpha_(i r)$，满足I I线性无关且I中每个向量都可由I I表示，称I I是I的一个极大无关组。]

#theorem[][一个向量组的任意两个极大无关组等价。]
#theorem[][一个向量组的任意两个极大无关组所含向量个数相等。]

#definition[向量组的秩][向量组$alpha_1,dots.c,alpha_m$的极大无关组所含向量个数称为向量组的秩，记为$r(alpha_1,dots.c,alpha_m)$。]

#theorem[][$alpha_1,dots.c,alpha_m$线性无关$<->$ $r(alpha_1,dots.c,alpha_m)=m$。]
#theorem[][等价的向量组有相同的秩。]

行向量组的秩$=$列向量组的秩$=$矩阵的秩。

#definition[齐次线性方程组的基础解系][设$eta_1,dots.c,eta_p$是$A X=0$的一组解向量，若它们线性无关，且方程的任意一个解可由它们表示，则称为基础解系。]

#theorem[][若$r(A_(m times n))=r$，则$A X=0$存在一个由$n-r$个向量$eta_1,dots.c,eta_(n-r)$组成的基础解系，它们的线性组合给出$A X=0$的所有解。]

#theorem[齐次线性方程组解的结构][系数矩阵的秩$+$基础解系解向量个数$=$未知量个数。]

#theorem[非齐次线性方程组解的结构][若$A X=beta$满足$r(A)=r(A,beta)=r$，且$eta_1,dots.c,eta_(n-r)$是$A X=0$的一个基础解系，$gamma_0$是$A X=beta$的某个解，则全部解为
  $ X=gamma_0+k_1 eta_1+dots.c+k_(n-r) eta_(n-r) $
  $gamma_0$为特解。
]

同解方程组与秩：对$A X=0$与$B A X=0$，由于解集有包含关系，$r(A)=r(B A)$当且仅当二者同解。

= 线性空间

== 线性空间与子空间

#definition[线性空间][设$K$是一个数域，$V$是一个集合。在$V$上定义了加法运算，定义了$K$中元素对$V$中元素的数乘运算。若两种运算满足
  $ forall k,l in K, alpha,beta,gamma in V $
  $ alpha+beta=beta+alpha, quad (alpha+beta)+gamma=alpha+(beta+gamma), quad alpha+0=alpha, quad alpha+(-alpha)=0 $
  $
    1 dot alpha=alpha, quad k (alpha+beta)=k alpha+k beta, quad (k+l) alpha=k alpha+l alpha, quad k (l alpha)=(k l) alpha
  $
  称$V$是$K$上的线性空间。
]

数域$K$上$n$维列向量集合是$K$上线性空间，记为$K^n$。

$A X=0$的解集构成解空间。$A$为$0$或可逆时，得到$R^n$或零空间。$A$的列向量的所有线性组合构成像空间。

#proposition[线性空间的简单性质][在数域$K$上的线性空间$V$中，设$alpha,beta,gamma in V,k in K$，有
  + 零向量唯一；
  + $alpha$的负向量$-alpha$唯一；
  + 消去律：$alpha+beta=alpha+gamma arrow.r.double beta=gamma$；
  + $0 alpha=0,k 0=0,(-1) alpha=-alpha$；
  + 若$k alpha=0$，则$alpha=0$或$k=0$。
]

#definition[线性子空间][设$V$是$K$上的线性空间，$W$是$V$的非空子集，若对于$V$上的加法和数乘运算，$W$也是$K$上的线性空间，称$W$是$V$的一个线性子空间。]

#theorem[][设$V$是$K$上的线性空间，$W$是$V$的非空子集，若$W$中元素对于$V$中加法和数乘封闭，则$W$是$V$的一个子空间。]

#theorem[][设$V$是$K$上的线性空间，$W$是$V$的非空子集，则$W$是$V$的一个子空间当且仅当$forall alpha,beta in W,k in K$，有$alpha+beta in W$且$k alpha in W$；或等价地，$k alpha+beta in W$。]

任意线性空间都含有两个平凡的子空间：零空间和全子空间。非平凡的子空间称为真子空间。

#definition[由向量生成的子空间][设$V$是$K$上的线性空间，$alpha_1,dots.c,alpha_m$是$V$中一组向量，则
  $ L(alpha_1,dots.c,alpha_m)={alpha | alpha=sum_(i=1)^m k_i alpha_i,k_i in K,1<=i<=m} $
  是$V$的包含$alpha_1,dots.c,alpha_m$的最小子空间，称为生成子空间。
]

子空间的交与并：$W,U$是$V$的子空间，则$W inter U$也是$V$的子空间；若它们互不包含，则$W union U$不是$V$的子空间。

#definition[子空间的和][若$W,U$是$V$的子空间，则
  $ W+U={w+u | w in W,u in U} $
  也是$V$的子空间，称为$W$与$U$的和子空间。
]

#theorem[][设$U_1,U_2,dots.c,U_m$是线性空间$V$的真子空间，则$union_(i=1)^m U_i eq.not V$。]

== 线性空间的维数、基与坐标

#definition[维数、基][设$V$是$K$上的线性空间，$alpha_1,dots.c,alpha_n$是$V$中$n$个无关向量，$V$中任意向量都可用$alpha_1,dots.c,alpha_n$线性表示，则称$V$是$n$维线性空间，记为$dim V=n$，称$alpha_1,dots.c,alpha_n$是$V$的基。$V$的基就是$V$的极大无关组，维数就是$V$的秩。]

#definition[坐标][给定线性空间$V$的一组基$alpha_1,dots.c,alpha_n$，任意$gamma in V$必可唯一表示成它们的线性组合。设
  $ gamma=x_1 alpha_1+x_2 alpha_2+dots.c+x_n alpha_n=(alpha_1,dots.c,alpha_n) mat(x_1; x_2; dots.v; x_n) $
  称$X=(x_1,x_2,dots.c,x_n)^T$为$gamma$在该基下的坐标。
]

选定一组基，$gamma,xi$坐标为$X,Y$，则$gamma+xi$坐标为$X+Y$，$k gamma$坐标为$k X$。

#definition[同构][设$V(+ , dot)$与$V'(plus.o,times.o)$都是$K$上线性空间，$sigma$是从$V$到$V'$的一一映射，若$forall alpha,beta in V,k in K$，有
  $ sigma(k dot alpha+beta)=k times.o sigma(alpha) plus.o sigma(beta) $
  则称$sigma$是从$V$到$V'$的同构，称$V$与$V'$同构。
]

#proposition[同构的简单性质][设$sigma$是$K$上$V$到$V'$的同构：$sigma(0)=0$；
  $ sigma(k_1 alpha_1+dots.c+k_s alpha_s)=k_1 sigma(alpha_1)+dots.c+k_s sigma(alpha_s) $
  $V$中$alpha_1,dots.c,alpha_s$线性相关$<->$ $V'$中$sigma(alpha_1),dots.c,sigma(alpha_s)$线性相关。
]

#theorem[][$K$上两个线性空间同构当且仅当它们有相同的维数。]

== 基变换与坐标变换

#definition[基变换][设两组基满足
  $ (eta_1,eta_2,dots.c,eta_n)=(epsilon_1,epsilon_2,dots.c,epsilon_n) C $
]

#definition[基过渡矩阵][$C=(c_(i j))_(n times n)$为从$epsilon_1,dots.c,epsilon_n$到$eta_1,dots.c,eta_n$的过渡矩阵。$C$是过渡矩阵的充要条件是$C$可逆。]

#theorem[][若从$epsilon_1,dots.c,epsilon_n$到$eta_1,dots.c,eta_n$的过渡矩阵为$C$，从$eta_1,dots.c,eta_n$到$epsilon_1,dots.c,epsilon_n$的过渡矩阵为$B$，则$B=C^(-1)$。]

#theorem[][若从$epsilon$到$eta$的过渡矩阵为$C$，从$eta$到$gamma$的过渡矩阵为$D$，则从$epsilon$到$gamma$的过渡矩阵为$A=C D$。]

#theorem[坐标变换][若从$epsilon_1,dots.c,epsilon_n$到$eta_1,dots.c,eta_n$过渡矩阵为$C$，$xi$在$epsilon$下坐标为$X$、在$eta$下坐标为$Y$，则$X=C Y$。]

= 欧氏空间

== 内积

#definition[内积][设$V$是实线性空间，$V$上内积是一个映射$phi.alt:V times V -> R$，$forall alpha,beta,gamma in V,k in R$，$phi.alt(alpha, beta)=(alpha,beta)$满足
  + $(alpha,beta)=(beta,alpha)$（对称性）；
  + $(k alpha+beta,gamma)=k (alpha,gamma)+(beta,gamma)$（线性）；
  + $(alpha,alpha)>=0$且等号成立当且仅当$alpha=0$（正定性）。
  定义了内积的实线性空间为欧氏空间或内积空间。
]

#definition[长度][设$V$是欧氏空间，$forall alpha in V$，定义长度$|alpha|=sqrt((alpha,alpha))$。长度为$1$的向量称为单位向量；对任意向量$alpha eq.not 0$，$alpha/|alpha|$一定是单位向量，这一过程称为单位化。]

常用的内积：在$R^n$中，$X=(x_1,dots.c,x_n)^T,Y=(y_1,dots.c,y_n)^T$，
$ (X,Y)=X^T Y=x_1 y_1+dots.c+x_n y_n, quad |X|=sqrt(x_1^2+dots.c+x_n^2) $

$C[a,b]$中两连续函数$f(x),g(x)$内积为$(f,g)=integral_a^b f(x) g(x) dif x$。

$R^n$中内积的其它定义：$k_1,dots.c,k_n$都是正实数，$(X,Y)=k_1 x_1 y_1+dots.c+k_n x_n y_n$；一般地，对任意可逆$n$阶矩阵$A$，$(X,Y)=X^T A^T A Y$构成内积。

#definition[距离][设$V$是欧氏空间，$alpha,beta in V$，定义$alpha,beta$的距离为$|alpha-beta|$。]

#theorem[内积和长度的性质][设$alpha,beta$是欧氏空间中的向量，$k$是任意实数，则
  + $(0,alpha)=0$；
  + $|alpha|>=0$且等号成立当且仅当$alpha=0$；
  + $|k alpha|=|k||alpha|$；
  + $|(alpha,beta)|<=|alpha||beta|$，等号成立当且仅当$alpha,beta$线性相关；
  + $|alpha+beta|<=|alpha|+|beta|$，等号成立当且仅当存在$t>=0$使$alpha=t beta$或$beta=t alpha$；
  + $|alpha-beta|>=|alpha|-|beta|$。
]

#definition[向量的夹角][设$V$是欧氏空间，对非零向量$alpha,beta in V$，定义夹角
  $ chevron.l alpha,beta chevron.r=arccos((alpha,beta)/(|alpha||beta|)) $
]

#definition[正交][当$chevron.l alpha,beta chevron.r=pi/2$时，称$alpha,beta$正交，记为$alpha perp beta$。]

#theorem[][非零向量$alpha,beta$正交当且仅当$(alpha,beta)=0$。]

正交与齐次方程组：与所有$alpha_i$都正交的向量$X=(x_1,dots.c,x_n)^T$是方程组$(alpha_1,alpha_2,dots.c,alpha_m)^T X=0$的所有非零解。

#definition[正交向量组][欧氏空间$V$中的一组向量$alpha_1,dots.c,alpha_m$两两正交，称为正交向量组。]

#theorem[][正交向量组一定线性无关。]

#definition[标准正交基][欧氏空间$V$的一组基$epsilon_1,dots.c,epsilon_n$满足：每个$epsilon_i$都是单位向量，且$i eq.not j$时$epsilon_i perp epsilon_j$，称为标准正交基。即$(epsilon_i,epsilon_j)=delta_(i j)$。]

#definition[度量矩阵][对一组基$alpha_1,dots.c,alpha_n$，矩阵$A=((alpha_i,alpha_j))_(n times n)$为度量矩阵。若$alpha=(alpha_1,dots.c,alpha_n) X,beta=(alpha_1,dots.c,alpha_n) Y$，则$(alpha,beta)=X^T A Y$；在标准正交基下$(alpha,beta)=X^T Y$。]

=== 正交补

设$alpha_1$是$n$维欧氏空间$V$中向量，令$W={w | (w,alpha_1)=0}$，则$W$是$V$的子空间。设$U=L(alpha_1,dots.c,alpha_m)$，则$forall u in U,w in W$，$(u,w)=0$，$dim U+dim W=n$，$U$与$W$互为正交补。

=== Schmidt正交化

对$V$的任意一组基$alpha_1,dots.c,alpha_m$：
$ beta_1=alpha_1 $
$ beta_2=alpha_2-((alpha_2,beta_1)/(beta_1,beta_1)) beta_1 $
$ dots.c $
$ beta_m=alpha_m-sum_(i=1)^(m-1) ((alpha_m,beta_i)/(beta_i,beta_i)) beta_i $

$beta_1,dots.c,beta_m$是$V$的一组正交基。

从$beta_1,dots.c,beta_m$到$alpha_1,dots.c,alpha_m$的过渡矩阵为对角线元素为$1$的上三角矩阵；从$alpha_1,dots.c,alpha_m$到标准正交基$epsilon_1,dots.c,epsilon_m$的过渡矩阵是一个对角线元素非零的上三角矩阵。

= 线性变换

#definition[线性变换][线性代数是研究线性空间上的线性变换的一门学问。$V$是数域$K$上的线性空间，$V$到自身的映射$cal(A)$称为一个变换，即$forall alpha in V$，$V$中存在唯一向量$cal(A) alpha$与之对应。$cal(A) alpha$称为$alpha$在变换$cal(A)$下的像，$alpha$称为$cal(A) alpha$的原像。]

#definition[][若变换$cal(A)$满足$forall alpha,beta in V,k in K$，
  $ cal(A) (k alpha+beta)=k cal(A) (alpha)+cal(A) (beta) $
  称$cal(A)$是$V$上线性变换。
]

数乘变换$cal(A) alpha=cal(C) alpha$；恒等变换$cal(E) alpha=alpha$；零变换$cal(O) alpha=0$；微分变换$cal(D) f(x)=f'(x)$；积分变换$cal(F) f(x)=integral_a^x f(t) dif t$。

#proposition[线性变换的简单性质][
  $ cal(A)0=0, quad cal(A) (-alpha)=-cal(A) alpha $
  $ cal(A) (k_1 alpha_1+dots.c+k_m alpha_m)=k_1 cal(A) alpha_1+dots.c+k_m cal(A) alpha_m $
  线性变换把相关向量组变成相关向量组。
]

#definition[给定基下的线性变换][若基为$alpha_1,dots.c,alpha_n$，矩阵$A=(a_(i j))$满足
  $ cal(A) (alpha_1,alpha_2,dots.c,alpha_n)=(alpha_1,dots.c,alpha_n) A $
  则$A$为线性变换$cal(A)$在该基下的矩阵。
]

#theorem[坐标变换公式][设$alpha_1,dots.c,alpha_n$是$V$的一组基，$cal(A)$在该基下矩阵为$A$。若$alpha$在此基下坐标为$X$，则$cal(A) alpha$在该基下坐标为$A X$。]

#definition[像与核][
  像：$"Im"(cal(A))={cal(A) xi | xi in V}$。

  秩：$r(cal(A))=dim("Im"(cal(A)))$。

  核：$ker(cal(A))={xi | cal(A) xi=0}$。

  零度：$r(ker(cal(A)))=dim(ker(cal(A)))$。
]

$ r(cal(A))=r(A), quad r(ker(cal(A)))=n-r(A) $

#definition[线性变换的运算][和：$(cal(A)+cal(B)) (alpha)=cal(A) alpha+cal(B) alpha$；数乘：$(k cal(A)) (alpha)=k (cal(A) alpha)$；积：$(cal(A) cal(B)) (alpha)=cal(A) (cal(B) alpha)$。]

$cal(A)+cal(B)$的矩阵为$A+B$，$k cal(A)$的矩阵为$k A$，$cal(A) cal(B)$的矩阵为$A B$。

#theorem[线性变换在两组基下的矩阵的关系][设$alpha_1,dots.c,alpha_n$和$beta_1,dots.c,beta_n$是$V$的两组基，从$alpha$到$beta$过渡矩阵为$P$，线性变换$cal(A)$在两组基下的矩阵为$A,B$，则$B=P^(-1) A P$。]

= 相似、对角化与二次型

== 相似与特征值

#definition[相似矩阵][若$A,B$为$n$阶方阵，若存在$n$阶可逆矩阵$P$使$P^(-1) A P=B$，称$A$相似于$B$，记为$A tilde B$。]

相似对角化：对于$A$，寻找可逆矩阵$P$及对角阵$Lambda$，使$P^(-1) A P=Lambda$。

#theorem[相似的简单性质][$A tilde B$，对任意多项式有$g(A) tilde g(B)$，且$g(B)=P^(-1) g(A) P$。]

#theorem[][矩阵的相似是等价关系。]

=== 特征值与特征向量

#definition[特征值与特征向量][设$A$为元素属于$K$的$n$阶矩阵，若存在$K$中的$lambda$与元素属于$K$的$n$维非零向量$alpha$，使
  $ A alpha=lambda alpha $
  称$lambda$为$A$的特征值，$alpha$为特征值$lambda$的特征向量。
]

#theorem[][$n$阶矩阵$A$相似于对角矩阵当且仅当它有$n$个无关的特征向量。]

#definition[特征多项式][
  $ f_A(lambda)=|lambda E-A| $
  称为$A$的特征多项式，$f_A(lambda)=0$称为$A$的特征方程。$lambda_0$是特征值当且仅当$lambda_0$是特征方程的根，特征值也叫特征根。
]

由代数基本定理：
$ f(lambda)=a_n lambda^n+dots.c+a_1 lambda+a_0=a_n (lambda-lambda_1) dots.c (lambda-lambda_n) $

$n$阶矩阵按重数恰有$n$个特征值。

#definition[特征子空间][设$lambda_0$是$A$的特征值，称$(lambda_0 E-A) alpha=0$的解空间为$A$的特征值$lambda_0$的特征子空间。]

#proposition[][对应于同一个特征值$lambda_0$的特征向量的非零线性组合仍然是$lambda_0$的特征向量。]

上三角矩阵（对角矩阵、下三角矩阵）的特征值为其对角线上的$n$个元素。

对$g(x)=sum_(k=0)^m a_k x^k$，若$g(A)=0$，则对$A$的特征值$lambda$也必有$g(lambda)=0$。

=== 特征值的简单性质

#theorem[][设$lambda_1,dots.c,lambda_n$是$n$阶矩阵$A=(a_(i j))_n$的所有特征值，则
  $ sum_(j=1)^n lambda_j=sum_(i=1)^n a_(i i)="tr"(A), quad product_(j=1)^n lambda_j=|A| $
]

#proposition[][$A$可逆当且仅当$A$的特征值都不为$0$。]

#definition[主子式][方阵或行列式$A$的子式$D (i_1 dots.c i_k)/(i_1 dots.c i_k)$为$A$的一个$k$阶主子式。]

#theorem[][所有特征值的$k$重乘积之和等于所有$k$阶主子式之和。]

=== 特征向量的无关性

#theorem[][设$lambda_1,dots.c,lambda_s$是$A$的两两不等的特征值，$alpha_1,dots.c,alpha_s$分别是对应的特征向量，则$alpha_1,dots.c,alpha_s$线性无关。]

#theorem[][设$lambda_1,dots.c,lambda_s$是$A$的两两不等的特征值，$alpha_(i 1),dots.c,alpha_(i t_i)$是对应$lambda_i$的无关特征向量，则所有这些特征向量合在一起线性无关。]

#definition[代数重数与几何重数][在
  $ f_A(lambda)=(lambda-lambda_1)^(n_1) (lambda-lambda_2)^(n_2) dots.c (lambda-lambda_s)^(n_s) $
  中一次因式$(lambda-lambda_i)$出现的次数$n_i$称为特征值$lambda_i$的代数重数。对每个特征值$lambda_i$，$(lambda_i E-A) X=0$的解空间维数称为$lambda_i$的几何重数。
]

#theorem[][对$A$的任意特征值$lambda_0$，几何重数$g_0$不大于代数重数$n_0$。]

#corollary[][相似的矩阵有相同的特征多项式。]
#proposition[][相似的矩阵有相同的特征值、行列式及迹。]

若能找到$k$个无关的特征向量，则就能做$k$个列的对角化。

#proposition[][若$A$有$n$个不等的特征值，则$A$一定相似于对角矩阵。]

#theorem[可对角化的矩阵][$n$阶矩阵$A$可以对角化当且仅当它的每个特征值的代数重数等于几何重数。]

=== 零化多项式与极小多项式

#definition[][若$f(lambda)$是多项式、$A$为方阵，且$f(A)=0$，则$f(lambda)$称为$A$的一个零化多项式。在$A$的所有零化多项式中，次数最低的首一多项式称为$A$的极小多项式。]

#theorem[][$A$可以对角化当且仅当$A$的极小多项式无重根。]

#corollary[][若$A$的某个零化多项式无重根，则$A$可以对角化。]

#theorem[Cayley-Hamilton][设$f_A(lambda)$是$A$的特征多项式，则$f_A(A)=0$。]

#theorem[上三角化][每一个矩阵$A$必相似于上三角矩阵$Lambda$。]

#proposition[][设$A$的特征值按重数计为$lambda_1,dots.c,lambda_n$，$g(lambda)$是多项式，$g(A)$的所有特征值为$g(lambda_1),dots.c,g(lambda_n)$。进而
  $ |g(A)|=product_(i=1)^n g(lambda_i) $
  若$A$可逆，则$A^(-1)$的所有特征值为$lambda_1^(-1),dots.c,lambda_n^(-1)$；且$A$可逆时，$A^*$的所有特征值为$|A|lambda_1^(-1),dots.c,|A|lambda_n^(-1)$。
]

#theorem[特征向量方法][设$alpha$是$A$的特征值$lambda$对应的特征向量，则对多项式$g(lambda)$有
  $ g(A) alpha=g(lambda) alpha $
  若$A$可逆，还有$A^(-1) alpha=lambda^(-1) alpha$。
]

#note[][若$A$的某个特征值的代数重数大于几何重数，这个定理只能给出$g(A)$的部分特征值。]

== 正交矩阵与实对称矩阵的相似对角矩阵

#definition[正交矩阵][设$A$为$n$阶实矩阵，且$A^T A=E$，称$A$为（实）正交矩阵。]

#theorem[正交矩阵的简单性质][
  + 若$A$是正交矩阵，则$|A|=plus.minus 1$；
  + 实矩阵$A$为正交矩阵$<->$ $A^T=A^(-1)$；
  + 实矩阵$A$为正交矩阵$<->$ $A$的列（行）向量组是标准正交组；
  + 设$A,B$都是正交矩阵，则$A^T,A B$都是正交矩阵。
]

注：由列（行）向量组$alpha_1,dots.c,alpha_n$构成正交矩阵$A$。$|A|=1$时为右手系，$|A|=-1$时为左手系。

#theorem[][正交矩阵的特征值模为$1$。]

#theorem[][实对称矩阵的特征值都是实数。]

#theorem[][实对称矩阵对应于不同特征值的特征向量正交。]

#definition[正交相似][若存在正交矩阵$Q$使$Q^T A Q=Q^(-1) A Q=B$，称$A$正交相似于$B$。]

#theorem[][正交相似是等价关系。]

#theorem[][实对称矩阵$A$必可正交相似于对角矩阵。]

= 实二次型

== 二次型与合同

#definition[二次型][设$A$是一个实对称矩阵，$A$为二次型$f(X)=X^T A X$的矩阵，$f(X)$为$A$的二次型，$A$的秩称为$f$的秩。]

=== 坐标变换

选取空间的另一组基并记过渡矩阵为$P$，则有$X=P Y$，
$ f(X)=X^T A X=Y^T P^T A P Y=g(Y) $
关于$X$的二次型$f$转化为关于$Y$的二次型$g(Y)=Y^T A_1 Y$，其中$A_1=P^T A P$。

#definition[][坐标变换在二次型的语言中称为非退化的线性代换。]

#definition[实对称矩阵的合同][对实对称矩阵$A,A_1$，若存在可逆矩阵$P$使$A_1=P^T A P$，称$A_1$合同于$A$。]

#theorem[][合同是等价关系。]

#definition[标准型（对角型）][一个只含变量的平方项的二次型称为标准型（对角型）。]

#theorem[正交相似也是合同][对任意二次型$f(X)=X^T A X$，存在正交代换$X=Q Y$，使
  $ f=lambda_1 y_1^2+lambda_2 y_2^2+dots.c+lambda_n y_n^2 $
  其中$lambda_1,dots.c,lambda_n$是$A$的特征值。
]

#note[][正交变换不改变内积，保持长度、角度，把一组标准正交基变为另一组标准正交基。]

== 配方法与规范标准型

配方法：
+ $f$中含有平方项。不妨$a_(11) eq.not 0$，令
  $ y_1=x_1+a_(12)/a_(11) x_2+dots.c+a_(1 n)/a_(11) x_n, quad y_i=x_i (2<=i<=n) $
  则$f=a_(11) y_1^2+b_(22) y_2^2+dots.c+2b_(2 n) y_2 y_n+dots.c+b_(n n) y_n^2$。
+ $f$中不含完全平方项。若有某个交叉项系数不为$0$且$x_1 x_2$系数不为$0$，令$x_1=y_1+y_2,x_2=y_1-y_2,x_i=y_i (3<=i<=n)$，得到的新二次型中已含平方项，可用上一步处理。递归反复使用两步即可化为标准型。

初等变换法：$P$可分解为若干初等矩阵之积$P_1 P_2 dots.c P_s$，$P^T A P=Lambda$。构造$mat(A; E)$，对它同时做初等行、列变换，$A$化为标准型时，$E$就变成了$P$。

#definition[规范标准型][若$f(X)=X^T A X$通过坐标变换$X=P Z$化为
  $ h(Z)=z_1^2+dots.c+z_p^2-z_(p+1)^2-dots.c-z_(p+q)^2 $
  称$h(Z)$为$f(X)$的规范标准型。
]

#proof[存在性][不妨$1<=i<=p$时$lambda_i>0$，令$z_i=y_i sqrt(lambda_i)$；当$p+1<=i<=p+q$时$lambda_i<0$，令$z_i=y_i sqrt(-lambda_i)$；$i>=p+q+1$时$lambda_i=0,z_i=y_i$。于是$Y=R Z$。对角型$g(Y)$进一步化成规范标准型$h(Z)$。]

#theorem[惯性定理][二次型$f(X)=X^T A X$有唯一规范标准型
  $ h(Z)=z_1^2+dots.c+z_p^2-z_(p+1)^2-dots.c-z_(p+q)^2 $
]

#definition[正负惯性指数与符号差][$p$称为$f$的正惯性指数，$q$称为$f$的负惯性指数，$s=p-q$为符号差，$r=p+q$为秩。]

#theorem[][两个二次型合同当且仅当它们有相同的规范标准型，当且仅当它们有相同的正惯性指数和负惯性指数。四个关键变量中任意两个都是全系不变量。]

=== 平面二次曲线的分类

设$X=(x,y)^T,A=mat(a, b/2; b/2, c),alpha=(d,e)^T$，则平面上的二次方程为
$ X^T A X+alpha^T X+f=0 $
当$r(A)=1$时为抛物线；当$r(A)=2$且符号差为$plus.minus 2$时为椭圆；当$r(A)=2$且符号差为$0$时为双曲线。

== 正定二次型

#definition[正定二次型][设$f(X)=X^T A X$是一个$n$元二次型，若$forall X eq.not 0$，$f(X)>0$，则$f(X)$为正定二次型，$A$为正定矩阵。]

若$P$为可逆矩阵且$X=P Y$，则关于$X$的二次型化为
$ g(Y)=X^T A X=Y^T P^T A P Y $
由$P$可逆，$f$与$g$值域相同，且$X eq.not 0$当且仅当$Y eq.not 0$，从而$f$正定当且仅当$g$正定。

#theorem[正定性的判定][设$f(X)=X^T A X$是一个$n$元二次型，下述命题与$f$正定等价：
  + $A$是正定矩阵；
  + $f$的正惯性指数为$n$；
  + $A$的特征值都大于$0$；
  + $A$合同于单位阵；
  + 存在可逆矩阵$M$，使$A=M^T M$。
]

#proposition[][正定矩阵的行列式大于$0$。]

若$A,B$是正定矩阵，$k,l$为任意正数，则$k A+l B,B A B,A^(-1),A^*$是正定矩阵。

#definition[顺序主子式][对$n$阶矩阵$A=(a_(i j))$，由其前$k$行前$k$列给出的子式称为$A$的$k$阶顺序主子式。]

#theorem[][二次型$f(X)=X^T A X$正定当且仅当$A$的所有顺序主子式大于$0$。]

#theorem[][二次型$f(X)=X^T A X$正定当且仅当$A$的所有主子式大于$0$。]

#definition[负定二次型][设$f(X)=X^T A X$是$n$元二次型，$forall X eq.not 0$，若$f(X)<0$，则$f(X)$为负定二次型，$A$为负定矩阵。]

#theorem[][$f$负定当且仅当$-f$正定。]

#definition[半正定二次型][设$f(X)=X^T A X$是$n$元二次型，若$forall X$，$f(X)>=0$，则$f(X)$为半正定二次型，$A$为半正定矩阵。]

#note[][相应结论平行，但所有顺序主子式都大于等于$0$也不能保证半正定；但所有主子式判别法不失效。]

== TODO

#highlight[TODO: PDF page 10：行（列）和相等的行列式中个别通项下标需人工复核]

#highlight[TODO: PDF page 13：循环行列式的根记号较浅，已按可辨认内容转录]

#highlight[TODO: PDF page 15：分块矩阵最后一行标准单位行向量下标需人工复核]

#highlight[TODO: PDF page 42：配方法推导中变换矩阵的省略项按原图保留为省略号]
