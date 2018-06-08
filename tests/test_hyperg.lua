local gsl = require("lgsl.gsl")
local sf = require("lgsl.sf")
local GSL_DBL_EPSILON, GSL_SQRT_DBL_EPSILON, GSL_LOG_DBL_MAX = 2.2204460492503131e-16, 1.4901161193847656e-08, 7.0978271289338397e+02
local function sprintf(...) io.write(string.format(...)) end
local sqrt, log, exp, M_PI, M_PI_2, DBL_MAX = math.sqrt, math.log, math.exp, math.pi, math.pi/2, 1.7976931348623157E+308
local function compare(val, ref, name, eps)
  eps = eps or 1e-9
  local inc = 0
  if val==0 or ref==0 then inc = 1 end
  if gsl.gsl_fcmp(val+inc,ref+inc,eps*100)==0 then
    sprintf("Pass %-30s: % .15e\n", name, ref,"\n")
  else
    sprintf("Fail %-30s: % .15e ~= % .15e\n", name, val, ref)
  end
end
local TEST_TOL0 = (2.0*GSL_DBL_EPSILON)
local TEST_TOL1 = (16.0*GSL_DBL_EPSILON)
local TEST_TOL2 = (256.0*GSL_DBL_EPSILON)
local TEST_TOL3 = (2048.0*GSL_DBL_EPSILON)
local TEST_TOL4 = (16384.0*GSL_DBL_EPSILON)
local TEST_TOL5 = (131072.0*GSL_DBL_EPSILON)
local TEST_TOL6 = (1048576.0*GSL_DBL_EPSILON)
local TEST_SQRT_TOL0 = (2.0*GSL_SQRT_DBL_EPSILON)
local TEST_SNGL = (1.0e-06)
compare(sf.hyperg0F1(1, 0.5)             ,      1.5660829297563505373, "hyperg0F1(1, 0.5)", TEST_TOL0)
compare(sf.hyperg0F1(5, 0.5)             ,      1.1042674404828684574, "hyperg0F1(5, 0.5)", TEST_TOL1)
compare(sf.hyperg0F1(100, 30)            ,      1.3492598639485110176, "hyperg0F1(100, 30)", TEST_TOL2)
compare(sf.hyperg0F1(-0.5, 3)            ,      -39.29137997543434276, "hyperg0F1(-0.5, 3)", TEST_TOL1)
compare(sf.hyperg0F1(-100.5, 50)         ,      0.6087930289227538496, "hyperg0F1(-100.5, 50)", TEST_TOL3)
compare(sf.hyperg0F1(1, -5.0)            ,     -0.3268752818235339109, "hyperg0F1(1, -5.0)", TEST_TOL0)
compare(sf.hyperg0F1(-0.5, -5.0)         ,      -4.581634759005381184, "hyperg0F1(-0.5, -5.0)", TEST_TOL1)
compare(sf.hyperg1F1(1, 1.5, 1)          ,      2.0300784692787049755, "hyperg1F1(1, 1.5, 1)", TEST_TOL0)
compare(sf.hyperg1F1(1, 1.5, 10)         ,       6172.859561078406855, "hyperg1F1(1, 1.5, 10)", TEST_TOL0)
compare(sf.hyperg1F1(1, 1.5, 100)        ,  2.3822817898485692114e+42, "hyperg1F1(1, 1.5, 100)", TEST_TOL1)
compare(sf.hyperg1F1(1, 1.5, 500)        ,  5.562895351723513581e+215, "hyperg1F1(1, 1.5, 500)", TEST_TOL2)
compare(sf.hyperg1F1(1.5, 2.5, 1)        ,      1.8834451238277954398, "hyperg1F1(1.5, 2.5, 1)", TEST_TOL0)
compare(sf.hyperg1F1(1.5, 2.5, 10)       ,      3128.7352996840916381, "hyperg1F1(1.5, 2.5, 10)", TEST_TOL1)
compare(sf.hyperg1F1(10, 1.1, 1)         ,      110.17623733873889579, "hyperg1F1(10, 1.1, 1)", TEST_TOL1)
compare(sf.hyperg1F1(10, 1.1, 10)        ,   6.146657975268385438e+09, "hyperg1F1(10, 1.1, 10)", TEST_TOL1)
compare(sf.hyperg1F1(10, 1.1, 100)       ,   9.331833897230312331e+55, "hyperg1F1(10, 1.1, 100)", TEST_TOL2)
compare(sf.hyperg1F1(10, 1.1, 500)       ,  4.519403368795715843e+235, "hyperg1F1(10, 1.1, 500)", TEST_TOL2)
compare(sf.hyperg1F1(10, 50.1, 2)        ,      1.5001295507968071788, "hyperg1F1(10, 50.1, 2)", TEST_TOL0)
compare(sf.hyperg1F1(10, 50.1, 10)       ,       8.713385849265044908, "hyperg1F1(10, 50.1, 10)", TEST_TOL0)
compare(sf.hyperg1F1(10, 50.1, 100)      ,   5.909423932273380330e+18, "hyperg1F1(10, 50.1, 100)", TEST_TOL2)
compare(sf.hyperg1F1(10, 50.1, 500)      ,  9.740060618457198900e+165, "hyperg1F1(10, 50.1, 500)", TEST_TOL2)
compare(sf.hyperg1F1(100, 1.1, 1)        ,   5.183531067116809033e+07, "hyperg1F1(100, 1.1, 1)", TEST_TOL2)
compare(sf.hyperg1F1(100, 1.1, 10)       ,  1.6032649110096979462e+28, "hyperg1F1(100, 1.1, 10)", TEST_TOL2)
compare(sf.hyperg1F1(100, 1.1, 100)      ,  1.1045151213192280064e+110, "hyperg1F1(100, 1.1, 100)", TEST_TOL2)
compare(sf.hyperg1F1(100, 50.1, 1)       ,       7.222953133216603757, "hyperg1F1(100, 50.1, 1)", TEST_TOL1)
compare(sf.hyperg1F1(100, 50.1, 10)      ,  1.0998696410887171538e+08, "hyperg1F1(100, 50.1, 10)", TEST_TOL1)
compare(sf.hyperg1F1(100, 50.1, 100)     ,   7.235304862322283251e+63, "hyperg1F1(100, 50.1, 100)", TEST_TOL2)
compare(sf.hyperg1F1(1, 1.5, -1)         ,      0.5380795069127684191, "hyperg1F1(1, 1.5, -1)", TEST_TOL0)
compare(sf.hyperg1F1(1, 1.5, -10)        ,     0.05303758099290164485, "hyperg1F1(1, 1.5, -10)", TEST_TOL1)
compare(sf.hyperg1F1(1, 1.5, -100)       ,    0.005025384718759852803, "hyperg1F1(1, 1.5, -100)", TEST_TOL1)
compare(sf.hyperg1F1(1, 1.5, -500)       ,   0.0010010030151059555322, "hyperg1F1(1, 1.5, -500)", TEST_TOL1)
compare(sf.hyperg1F1(1, 1.1, -500)       ,  0.00020036137599690208265, "hyperg1F1(1, 1.1, -500)", TEST_TOL1)
compare(sf.hyperg1F1(10, 1.1, -1)        ,     0.07227645648935938168, "hyperg1F1(10, 1.1, -1)", TEST_TOL1)
compare(sf.hyperg1F1(10, 1.1, -10)       ,   0.0003192415409695588126, "hyperg1F1(10, 1.1, -10)", TEST_TOL1)
compare(sf.hyperg1F1(10, 1.1, -100)      ,  -8.293425316123158950e-16, "hyperg1F1(10, 1.1, -100)", 50.0*TEST_SNGL)
compare(sf.hyperg1F1(10, 1.1, -500)      ,  -3.400379216707701408e-23, "hyperg1F1(10, 1.1, -500)", TEST_TOL2)
compare(sf.hyperg1F1(50, 1.1, -90)       ,  -7.843129411802921440e-22, "hyperg1F1(50, 1.1, -90)", TEST_SQRT_TOL0)
compare(sf.hyperg1F1(50, 1.1, -100)      ,   4.632883869540640460e-24, "hyperg1F1(50, 1.1, -100)", TEST_SQRT_TOL0)
compare(sf.hyperg1F1(50, 1.1, -110.0)    ,   5.642684651305310023e-26, "hyperg1F1(50, 1.1, -110.0)", 0.03)
compare(sf.hyperg1F1(100, 1.1, -1)       ,      0.0811637344096042096, "hyperg1F1(100, 1.1, -1)", TEST_TOL2)
compare(sf.hyperg1F1(100, 1.1, -10)      ,  0.00025945610092231574387, "hyperg1F1(100, 1.1, -10)", TEST_TOL2)
compare(sf.hyperg1F1(100, 1.1, -50)      ,  2.4284830988994084452e-13, "hyperg1F1(100, 1.1, -50)", TEST_TOL2)
compare(sf.hyperg1F1(100, 1.1, -90)      ,  2.4468224638378426461e-22, "hyperg1F1(100, 1.1, -90)", TEST_TOL2)
compare(sf.hyperg1F1(100, 1.1, -99)      ,  1.0507096272617608461e-23, "hyperg1F1(100, 1.1, -99)", TEST_TOL2)
compare(sf.hyperg1F1(100, 1.1, -100)     ,  1.8315497474210138602e-24, "hyperg1F1(100, 1.1, -100)", TEST_TOL2)
--[[ GSL FIXMEs.
compare(sf.hyperg1F1(100, 1.1, -101)     ,  -2.3916306291344452490e-24, "hyperg1F1(100, 1.1, -101)", 0.04)
compare(sf.hyperg1F1(100, 1.1, -110)     ,  -4.517581986037732280e-26, "hyperg1F1(100, 1.1, -110)", TEST_TOL0)
compare(sf.hyperg1F1(100, 10.1, -220)    ,  -4.296130300021696573e-64, "hyperg1F1(100, 10.1, -220)", TEST_TOL1)
--]]
compare(sf.hyperg1F1(-10, -10.1, 10.0)   ,      10959.603204633058116, "hyperg1F1(-10, -10.1, 10.0)", TEST_TOL1)
compare(sf.hyperg1F1(-10, -10.1, 1000.0) ,  2.0942691895502242831e+23, "hyperg1F1(-10, -10.1, 1000.0)", TEST_TOL2)
compare(sf.hyperg1F1(-10, -100.1, 10.0)  ,      2.6012036337980078062, "hyperg1F1(-10, -100.1, 10.0)", TEST_TOL1)
compare(sf.hyperg1F1(-1000, -1000.1, 10.0),      22004.341698908631636, "hyperg1F1(-1000, -1000.1, 10.0)", TEST_TOL3)
compare(sf.hyperg1F1(-1000, -1000.1, 200.0),   7.066514294896245043e+86, "hyperg1F1(-1000, -1000.1, 200.0)", TEST_TOL3)
compare(sf.hyperg1F1(-8.1, -10.1, -10.0) ,  0.00018469685276347199258, "hyperg1F1(-8.1, -10.1, -10.0)", TEST_TOL0)
compare(sf.hyperg1F1(-10, -5.1, 1)       ,      16.936141866089601635, "hyperg1F1(-10, -5.1, 1)", TEST_TOL2)
compare(sf.hyperg1F1(-10, -5.1, 10)      ,       771534.0349543820541, "hyperg1F1(-10, -5.1, 10)", TEST_TOL2)
compare(sf.hyperg1F1(-10, -5.1, 100)     ,  2.2733956505084964469e+17, "hyperg1F1(-10, -5.1, 100)", TEST_TOL2)
compare(sf.hyperg1F1(-100, -50.1, -1)    ,     0.13854540373629275583, "hyperg1F1(-100, -50.1, -1)", TEST_TOL3)
compare(sf.hyperg1F1(-100, -50.1, -10)   ,  -9.142260314353376284e+19, "hyperg1F1(-100, -50.1, -10)", TEST_TOL3)
compare(sf.hyperg1F1(-100, -50.1, -100)  ,  -1.7437371339223929259e+87, "hyperg1F1(-100, -50.1, -100)", TEST_TOL3)
compare(sf.hyperg1F1(-100, -50.1, 1)     ,       7.516831748170351173, "hyperg1F1(-100, -50.1, 1)", TEST_TOL3)
compare(sf.hyperg1F1(-100, -50.1, 10)    ,  1.0551632286359671976e+11, "hyperg1F1(-100, -50.1, 10)", TEST_SQRT_TOL0)
--[[ GSL FIXMEs.
compare(sf.hyperg1F1(-100, -50.1, 50)    ,  -7.564755600940346649e+36, "hyperg1F1(-100, -50.1, 50)", TEST_TOL3)
compare(sf.hyperg1F1(-100, -50.1, 100)   ,      4.218776962675977e+55, "hyperg1F1(-100, -50.1, 100)", TEST_TOL3)
--]]
compare(sf.hyperg1F1(-10.5, -8.1, 0.1)   ,      1.1387201443786421724, "hyperg1F1(-10.5, -8.1, 0.1)", TEST_TOL0)
compare(sf.hyperg1F1(-10.5, -11.1, 1)    ,      2.5682766147138452362, "hyperg1F1(-10.5, -11.1, 1)", TEST_TOL1)
compare(sf.hyperg1F1(-100.5, -80.1, 10)  ,       355145.4517305220603, "hyperg1F1(-100.5, -80.1, 10)", TEST_TOL3)
compare(sf.hyperg1F1(-100.5, -102.1, 10) ,      18678.558725244365016, "hyperg1F1(-100.5, -102.1, 10)", TEST_TOL1)
compare(sf.hyperg1F1(-100.5, -500.1, 10) ,          7.342209011101454, "hyperg1F1(-100.5, -500.1, 10)", TEST_TOL0)
compare(sf.hyperg1F1(-100.5, -500.1, 100),   1.2077443075367177662e+8, "hyperg1F1(-100.5, -500.1, 100)", TEST_TOL1)
compare(sf.hyperg1F1(-500.5, -80.1, 2)   ,       774057.8541325341699, "hyperg1F1(-500.5, -80.1, 2)", TEST_TOL4)
--[[ GSL NYIs.
compare(sf.hyperg1F1(100, -10.1, 1)      ,  -2.1213846338338567395e+12, "hyperg1F1(100, -10.1, 1)", TEST_TOL0)
compare(sf.hyperg1F1(100, -10.1, 10)     ,  -6.624849346145112398e+39, "hyperg1F1(100, -10.1, 10)", TEST_TOL0)
compare(sf.hyperg1F1(100, -10.1, 100)    ,  -1.2413466759089171904e+129, "hyperg1F1(100, -10.1, 100)", TEST_TOL0)
compare(sf.hyperg1F1(100, -10.1, -1)     ,       34456.29405305551691, "hyperg1F1(100, -10.1, -1)", TEST_TOL0)
compare(sf.hyperg1F1(100, -10.1, -10)    ,  -7.809224251467710833e+07, "hyperg1F1(100, -10.1, -10)", TEST_TOL0)
compare(sf.hyperg1F1(100, -10.1, -100)   ,  -5.214065452753988395e-07, "hyperg1F1(100, -10.1, -100)", TEST_TOL0)
--]]
compare(sf.hyperg1F1(-100, 1.1, 1)       ,     0.21519810496314438414, "hyperg1F1(-100, 1.1, 1)", TEST_TOL2)
compare(sf.hyperg1F1(-100, 1.1, 10)      ,       8.196123715597869948, "hyperg1F1(-100, 1.1, 10)", TEST_TOL1)
compare(sf.hyperg1F1(-100, 1.1, 100)     ,  -1.4612966715976530293e+20, "hyperg1F1(-100, 1.1, 100)", TEST_TOL1)
compare(sf.hyperg1F1(-100, 20.1, 1)      ,   0.0021267655527278456412, "hyperg1F1(-100, 20.1, 1)", TEST_TOL2)
compare(sf.hyperg1F1(-100, 20.1, 10)     ,  2.0908665169032186979e-11, "hyperg1F1(-100, 20.1, 10)", TEST_TOL2)
compare(sf.hyperg1F1(-100, 20.1, 100)    ,    -0.04159447537001340412, "hyperg1F1(-100, 20.1, 100)", TEST_TOL2)
compare(sf.hyperg1F1(-100, 1.1, -1)      ,  2.1214770215694685282e+07, "hyperg1F1(-100, 1.1, -1)", TEST_TOL3)
compare(sf.hyperg1F1(-100, 1.1, -10)     ,  1.0258848879387572642e+24, "hyperg1F1(-100, 1.1, -10)", TEST_TOL3)
compare(sf.hyperg1F1(-100, 1.1, -100)    ,  1.1811367147091759910e+67, "hyperg1F1(-100, 1.1, -100)", TEST_TOL3)
compare(sf.hyperg1F1(-100, 50.1, -1)     ,       6.965259317271427390, "hyperg1F1(-100, 50.1, -1)", TEST_TOL3)
compare(sf.hyperg1F1(-100, 50.1, -10)    ,  1.0690052487716998389e+07, "hyperg1F1(-100, 50.1, -10)", TEST_TOL3)
compare(sf.hyperg1F1(-100, 50.1, -100)   ,   6.889644435777096248e+36, "hyperg1F1(-100, 50.1, -100)", TEST_TOL3)
compare(sf.hyperg1F1(-2.05, 1.0, 5.05)   ,       3.79393389516785e+00, "hyperg1F1(-2.05, 1.0, 5.05)", TEST_TOL3)
compare(sf.hyperg1F1(-26, 2.0, 100.0)    ,   1.444786781107436954e+19, "hyperg1F1(-26, 2.0, 100.0)", TEST_TOL3)
--[[ GSL FIXME.
compare(sf.hyperg1F1(-26.1, 2.0, 100.0)  ,   1.341557199575986995e+19, "hyperg1F1(-26.1, 2.0, 100.0)", TEST_TOL3)
--]]
compare(sf.hyperg1F1(1.2, 1.1e-15, 1.5)  ,        8254503159672429.02, "hyperg1F1(1.2, 1.1e-15, 1.5)", TEST_TOL3)
compare(sf.hyperg1F1(1.0, 1000000.5, 0.8e6 + 0.5),   4.999922505099443804e+00, "hyperg1F1(1.0, 1000000.5, 0.8e6 + 0.5)", TEST_TOL3)
compare(sf.hyperg1F1(1.0, 1000000.5, 1001000.5),      3480.3699557431856166, "hyperg1F1(1.0, 1000000.5, 1001000.5)", TEST_TOL4)
--[[ GSL FIXME.
compare(sf.hyperg1F1(1.1, 1000000.5, 1001000.5),      7304.6126942641350122, "hyperg1F1(1.1, 1000000.5, 1001000.5)", TEST_TOL3)
compare(sf.hyperg1F1(0.9, 1000000.5, 1001000.5),      1645.4879293475410982, "hyperg1F1(0.9, 1000000.5, 1001000.5)", TEST_TOL3)
--]]
compare(sf.hyperg1F1(-1.1, 1000000.5, 1001000.5),      -5.30066488697455e-04, "hyperg1F1(-1.1, 1000000.5, 1001000.5)", TEST_TOL3)
compare(sf.hyperg1F1(1.5, 1000000.5, 0.8e6 + 0.5),  11.18001288977894650469927615, "hyperg1F1(1.5, 1000000.5, 0.8e6 + 0.5)", TEST_TOL4)
compare(sf.hyperg1F1(-1.5, 1.5, -100.)   ,      456.44010011787485545, "hyperg1F1(-1.5, 1.5, -100.)", TEST_TOL4)
compare(sf.hyperg1F1(-1.5, 1.5, 99.)     ,  4.13360436014643309757065e36, "hyperg1F1(-1.5, 1.5, 99.)", TEST_TOL4)
compare(sf.hyperg1F1(-1.5, 1.5, 100.)    ,  1.0893724312430935129254e37, "hyperg1F1(-1.5, 1.5, 100.)", TEST_TOL4)
compare(sf.hyperg1F1(-1.5, 1.5, 709.)    ,  8.7396804160264899999692120e298, "hyperg1F1(-1.5, 1.5, 709.)", TEST_TOL4)
compare(sf.hyperg1F1(-1.5, 1.5, 710.)    ,  2.36563187217417898169834615e299, "hyperg1F1(-1.5, 1.5, 710.)", TEST_TOL4)
--[[ GSL FIXMEs.
compare(sf.hyperg1F1(-37.8, 2.01, 103.58),          -6.21927211009e17, "hyperg1F1(-37.8, 2.01, 103.58)", TEST_TOL1)
compare(sf.hyperg1F1(-1, -1, 0.1)        ,                        1.1, "hyperg1F1(-1, -1, 0.1)", TEST_TOL0)
--]]
compare(sf.hypergU(0.0001, 0.0001, 0.0001),      1.0000576350699863577, "hypergU(0.0001, 0.0001, 0.0001)", TEST_TOL1)
compare(sf.hypergU(0.0001, 0.0001, 1.0)  ,      0.9999403679233247536, "hypergU(0.0001, 0.0001, 1.0)", TEST_TOL0)
compare(sf.hypergU(0.0001, 0.0001, 100.0),      0.9995385992657260887, "hypergU(0.0001, 0.0001, 100.0)", TEST_TOL0)
compare(sf.hypergU(0.0001, 1, 0.0001)    ,      1.0009210608660065989, "hypergU(0.0001, 1, 0.0001)", TEST_TOL2)
compare(sf.hypergU(0.0001, 1.0, 1.0)     ,      0.9999999925484179084, "hypergU(0.0001, 1.0, 1.0)", TEST_TOL2)
compare(sf.hypergU(0.0001, 10, 1)        ,      13.567851006281412726, "hypergU(0.0001, 10, 1)", TEST_TOL3)
compare(sf.hypergU(0.0001, 10, 5)        ,      1.0006265020064596364, "hypergU(0.0001, 10, 5)", TEST_SQRT_TOL0)
compare(sf.hypergU(0.0001, 10, 10)       ,      0.9999244381454633265, "hypergU(0.0001, 10, 10)", TEST_TOL0)
compare(sf.hypergU(0.0001, 100, 1)       ,  2.5890615708804247881e+150, "hypergU(0.0001, 100, 1)", TEST_SQRT_TOL0)
compare(sf.hypergU(0.0001, 100, 10)      ,  2.3127845417739661466e+55, "hypergU(0.0001, 100, 10)", TEST_SQRT_TOL0)
compare(sf.hypergU(0.0001, 100, 50)      ,       6402.818715083582554, "hypergU(0.0001, 100, 50)", TEST_SQRT_TOL0)
compare(sf.hypergU(0.0001, 100, 98)      ,      0.9998517867411840044, "hypergU(0.0001, 100, 98)", TEST_TOL2)
compare(sf.hypergU(0.0001, 1000, 300)    ,  2.5389557274938010716e+213, "hypergU(0.0001, 1000, 300)", TEST_SQRT_TOL0)
compare(sf.hypergU(0.0001, 1000, 999)    ,      0.9997195294193261604, "hypergU(0.0001, 1000, 999)", TEST_TOL2)
compare(sf.hypergU(0.0001, 1000, 1100)   ,      0.9995342990014584713, "hypergU(0.0001, 1000, 1100)", TEST_TOL1)
compare(sf.hypergU(0.5, 1000, 300)       ,  1.1977955438214207486e+217, "hypergU(0.5, 1000, 300)", TEST_SQRT_TOL0)
compare(sf.hypergU(0.5, 1000, 800)       ,   9.103916020464797207e+08, "hypergU(0.5, 1000, 800)", TEST_TOL2)
compare(sf.hypergU(0.5, 1000, 998)       ,     0.21970269691801966806, "hypergU(0.5, 1000, 998)", TEST_TOL2)
compare(sf.hypergU(0.5, 0.5, 1.0)        ,      0.7578721561413121060, "hypergU(0.5, 0.5, 1.0)", TEST_TOL2)
compare(sf.hypergU(1, 0.0001, 0.0001)    ,      0.9992361337764090785, "hypergU(1, 0.0001, 0.0001)", TEST_TOL1)
compare(sf.hypergU(1, 0.0001, 1)         ,      0.4036664068111504538, "hypergU(1, 0.0001, 1)", TEST_TOL2)
compare(sf.hypergU(1, 0.0001, 100)       ,    0.009805780851264329587, "hypergU(1, 0.0001, 100)", TEST_TOL1)
compare(sf.hypergU(1, 1.2, 2.0)          ,      0.3835044780075602550, "hypergU(1, 1.2, 2.0)", TEST_TOL1)
compare(sf.hypergU(1, -0.0001, 1)        ,      0.4036388693605999482, "hypergU(1, -0.0001, 1)", TEST_TOL1)
compare(sf.hypergU(8, 10.5, 1)           ,      27.981926466707438538, "hypergU(8, 10.5, 1)", TEST_TOL1)
compare(sf.hypergU(8, 10.5, 10)          ,   2.4370135607662056809e-8, "hypergU(8, 10.5, 10)", TEST_TOL0)
compare(sf.hypergU(8, 10.5, 100)         ,  1.1226567526311488330e-16, "hypergU(8, 10.5, 100)", TEST_TOL2)
compare(sf.hypergU(10, -2.5, 10)         ,   6.734690720346560349e-14, "hypergU(10, -2.5, 10)", TEST_TOL1)
compare(sf.hypergU(10, 2.5, 10)          ,   6.787780794037971638e-13, "hypergU(10, 2.5, 10)", TEST_TOL0)
compare(sf.hypergU(10, 2.5, 50)          ,  2.4098720076596087125e-18, "hypergU(10, 2.5, 50)", TEST_TOL0)
compare(sf.hypergU(-10.5, 1.1, 1)        ,      -3.990841457734147e+6, "hypergU(-10.5, 1.1, 1)", TEST_TOL2)
compare(sf.hypergU(-10.5, 1.1, 10)       ,       1.307472052129343e+8, "hypergU(-10.5, 1.1, 10)", TEST_TOL1)
compare(sf.hypergU(-10.5, 1.1, 50)       ,      3.661978424114088e+16, "hypergU(-10.5, 1.1, 50)", TEST_TOL0)
compare(sf.hypergU(-10.5, 1.1, 90)       ,       8.09469542130868e+19, "hypergU(-10.5, 1.1, 90)", TEST_TOL1)
compare(sf.hypergU(-10.5, 1.1, 99)       ,      2.546328328942063e+20, "hypergU(-10.5, 1.1, 99)", TEST_TOL1)
compare(sf.hypergU(-10.5, 1.1, 100)      ,      2.870463201832814e+20, "hypergU(-10.5, 1.1, 100)", TEST_TOL1)
compare(sf.hypergU(-10.5, 1.1, 200)      ,       8.05143453769373e+23, "hypergU(-10.5, 1.1, 200)", TEST_TOL2)
compare(sf.hypergU(-10.5, 10.1, 0.1)     ,     -3.043016255306515e+20, "hypergU(-10.5, 10.1, 0.1)", TEST_TOL2)
compare(sf.hypergU(-10.5, 10.1, 1)       ,     -3.194745265896115e+12, "hypergU(-10.5, 10.1, 1)", TEST_TOL1)
compare(sf.hypergU(-10.5, 10.1, 4)       ,     -6.764203430361954e+07, "hypergU(-10.5, 10.1, 4)", TEST_TOL2)
compare(sf.hypergU(-10.5, 10.1, 10)      ,     -2.067399425480545e+09, "hypergU(-10.5, 10.1, 10)", TEST_TOL1)
compare(sf.hypergU(-10.5, 10.1, 50)      ,      4.661837330822824e+14, "hypergU(-10.5, 10.1, 50)", TEST_TOL1)
compare(sf.hypergU(-10.5, 100.4, 10)     ,     -6.805460513724838e+66, "hypergU(-10.5, 100.4, 10)", TEST_TOL1)
compare(sf.hypergU(-10.5, 100.4, 50)     ,     -2.081052558162805e+18, "hypergU(-10.5, 100.4, 50)", TEST_TOL1)
compare(sf.hypergU(-10.5, 100.4, 80)     ,      2.034113191014443e+14, "hypergU(-10.5, 100.4, 80)", TEST_TOL2)
compare(sf.hypergU(-10.5, 100.4, 100)    ,       6.85047268436107e+13, "hypergU(-10.5, 100.4, 100)", TEST_TOL1)
compare(sf.hypergU(-10.5, 100.4, 200)    ,      1.430815706105649e+20, "hypergU(-10.5, 100.4, 200)", TEST_TOL2)
compare(sf.hypergU(-19.5, 82.1, 10)      ,   5.464313196201917432e+60, "hypergU(-19.5, 82.1, 10)", TEST_TOL2)
compare(sf.hypergU(-50.5, 100.1, 10)     ,      -5.5740216266953e+126, "hypergU(-50.5, 100.1, 10)", TEST_TOL1)
compare(sf.hypergU(-50.5, 100.1, 40)     ,      5.937463786613894e+91, "hypergU(-50.5, 100.1, 40)", TEST_TOL1)
compare(sf.hypergU(-50.5, 100.1, 50)     ,     -1.631898534447233e+89, "hypergU(-50.5, 100.1, 50)", TEST_TOL1)
compare(sf.hypergU(-50.5, 100.1, 70)     ,      3.249026971618851e+84, "hypergU(-50.5, 100.1, 70)", TEST_TOL2)
compare(sf.hypergU(-50.5, 100.1, 100)    ,      1.003401902126641e+85, "hypergU(-50.5, 100.1, 100)", TEST_TOL1)
compare(sf.hypergU(-2.0, 4.0, 1.0)       ,                       11.0, "hypergU(-2.0, 4.0, 1.0)", TEST_TOL0)
compare(sf.hypergU(-2.0, 0.5, 3.14)      ,                     1.1896, "hypergU(-2.0, 0.5, 3.14)", TEST_TOL2)
compare(sf.hypergU(-2.0, 0.5, 1.13)      ,                    -1.3631, "hypergU(-2.0, 0.5, 1.13)", TEST_TOL2)
compare(sf.hypergU(-2.0, 0.5, 0.0)       ,                       0.75, "hypergU(-2.0, 0.5, 0.0)", TEST_TOL2)
compare(sf.hypergU(-2.0, 0.5, 1e-20)     ,                       0.75, "hypergU(-2.0, 0.5, 1e-20)", TEST_TOL2)
compare(sf.hypergU( 0, 0, -0.1)          ,                          1, "hypergU( 0, 0, -0.1)", TEST_TOL0)
--[[ unimplemented case
compare(sf.hypergU(-1, 0, -0.1)          ,                       -0.1, "hypergU(-1, 0, -0.1)", TEST_TOL0)
compare(sf.hypergU(-2, 0, -0.1)          ,                       0.21, "hypergU(-2, 0, -0.1)", TEST_TOL0)
compare(sf.hypergU(-3, 0, -0.1)          ,                     -0.661, "hypergU(-3, 0, -0.1)", TEST_TOL0)
compare(sf.hypergU(-4, 0, -0.1)          ,                     2.7721, "hypergU(-4, 0, -0.1)", TEST_TOL0)
compare(sf.hypergU(-5, 0, -0.1)          ,                  -14.52201, "hypergU(-5, 0, -0.1)", TEST_TOL0)
compare(sf.hypergU(-6, 0, -0.1)          ,                  91.230301, "hypergU(-6, 0, -0.1)", TEST_TOL0)
--]]
compare(sf.hypergU( 0, 1, -0.1)          ,                        1.0, "hypergU( 0, 1, -0.1)", TEST_TOL0)
compare(sf.hypergU(-1, 1, -0.1)          ,                       -1.1, "hypergU(-1, 1, -0.1)", TEST_TOL0)
compare(sf.hypergU(-2, 1, -0.1)          ,                       2.41, "hypergU(-2, 1, -0.1)", TEST_TOL1)
compare(sf.hypergU(-3, 1, -0.1)          ,                     -7.891, "hypergU(-3, 1, -0.1)", TEST_TOL2)
compare(sf.hypergU(-4, 1, -0.1)          ,                    34.3361, "hypergU(-4, 1, -0.1)", TEST_TOL2)
compare(sf.hypergU(-5, 1, -0.1)          ,                 -186.20251, "hypergU(-5, 1, -0.1)", TEST_TOL2)
compare(sf.hypergU(-6, 1, -0.1)          ,                1208.445361, "hypergU(-6, 1, -0.1)", TEST_TOL2)
--[[ unimplemented case 
compare(sf.hypergU( 1, 2, -0.1)          ,                      -10.0, "hypergU( 1, 2, -0.1)", TEST_TOL0)
--]]
compare(sf.hypergU( 0, 2, -0.1)          ,                        1.0, "hypergU( 0, 2, -0.1)", TEST_TOL2)
compare(sf.hypergU(-1, 2, -0.1)          ,                       -2.1, "hypergU(-1, 2, -0.1)", TEST_TOL2)
compare(sf.hypergU(-2, 2, -0.1)          ,                       6.61, "hypergU(-2, 2, -0.1)", TEST_TOL2)
compare(sf.hypergU(-3, 2, -0.1)          ,                    -27.721, "hypergU(-3, 2, -0.1)", TEST_TOL2)
compare(sf.hypergU(-4, 2, -0.1)          ,                   145.2201, "hypergU(-4, 2, -0.1)", TEST_TOL2)
compare(sf.hypergU(-5, 2, -0.1)          ,                 -912.30301, "hypergU(-5, 2, -0.1)", TEST_TOL2)
compare(sf.hypergU(-6, 2, -0.1)          ,                6682.263421, "hypergU(-6, 2, -0.1)", TEST_TOL2)
--[[ unimplemented case 
compare(sf.hypergU( 2, 3, -0.1)          ,                      100.0, "hypergU( 2, 3, -0.1)", TEST_TOL0)
--]]
compare(sf.hypergU( 1, 3, -0.1)          ,                       90.0, "hypergU( 1, 3, -0.1)", TEST_TOL2)
compare(sf.hypergU( 0, 3, -0.1)          ,                        1.0, "hypergU( 0, 3, -0.1)", TEST_TOL2)
compare(sf.hypergU(-1, 3, -0.1)          ,                      -3.10, "hypergU(-1, 3, -0.1)", TEST_TOL2)
compare(sf.hypergU(-2, 3, -0.1)          ,                      12.81, "hypergU(-2, 3, -0.1)", TEST_TOL2)
compare(sf.hypergU(-3, 3, -0.1)          ,                    -66.151, "hypergU(-3, 3, -0.1)", TEST_TOL2)
compare(sf.hypergU(-4, 3, -0.1)          ,                   409.8241, "hypergU(-4, 3, -0.1)", TEST_TOL2)
compare(sf.hypergU(-5, 3, -0.1)          ,                -2961.42351, "hypergU(-5, 3, -0.1)", TEST_TOL2)
compare(sf.hypergU(-6, 3, -0.1)          ,               24450.804481, "hypergU(-6, 3, -0.1)", TEST_TOL2)
--[[ unimplemented case 
compare(sf.hypergU( 3, 4, -0.1)          ,                    -1000.0, "hypergU( 3, 4, -0.1)", TEST_TOL0)
--]]
compare(sf.hypergU( 2, 4, -0.1)          ,                    -1900.0, "hypergU( 2, 4, -0.1)", TEST_TOL2)
compare(sf.hypergU( 1, 4, -0.1)          ,                    -1810.0, "hypergU( 1, 4, -0.1)", TEST_TOL2)
compare(sf.hypergU( 0, 4, -0.1)          ,                        1.0, "hypergU( 0, 4, -0.1)", TEST_TOL2)
compare(sf.hypergU(-1, 4, -0.1)          ,                      -4.10, "hypergU(-1, 4, -0.1)", TEST_TOL2)
compare(sf.hypergU(-2, 4, -0.1)          ,                      21.01, "hypergU(-2, 4, -0.1)", TEST_TOL2)
compare(sf.hypergU(-3, 4, -0.1)          ,                   -129.181, "hypergU(-3, 4, -0.1)", TEST_TOL2)
compare(sf.hypergU(-4, 4, -0.1)          ,                   926.5481, "hypergU(-4, 4, -0.1)", TEST_TOL2)
compare(sf.hypergU(-5, 4, -0.1)          ,                -7594.16401, "hypergU(-5, 4, -0.1)", TEST_TOL2)
compare(sf.hypergU(-6, 4, -0.1)          ,               70015.788541, "hypergU(-6, 4, -0.1)", TEST_TOL2)
compare(sf.hypergU( 0, -1, -0.1)         ,                        1.0, "hypergU( 0, -1, -0.1)", TEST_TOL2)
--[[ unimplemented case 
compare(sf.hypergU(-1, -1, -0.1)         ,                        0.9, "hypergU(-1, -1, -0.1)", TEST_TOL0)
compare(sf.hypergU(-2, -1, -0.1)         ,                       0.01, "hypergU(-2, -1, -0.1)", TEST_TOL0)
compare(sf.hypergU(-3, -1, -0.1)         ,                     -0.031, "hypergU(-3, -1, -0.1)", TEST_TOL0)
compare(sf.hypergU(-4, -1, -0.1)         ,                     0.1281, "hypergU(-4, -1, -0.1)", TEST_TOL0)
compare(sf.hypergU(-5, -1, -0.1)         ,                   -0.66151, "hypergU(-5, -1, -0.1)", TEST_TOL0)
compare(sf.hypergU(-6, -1, -0.1)         ,                   4.098241, "hypergU(-6, -1, -0.1)", TEST_TOL0)
--]]
compare(sf.hypergU( 0, -2, -0.1)         ,                        1.0, "hypergU( 0, -2, -0.1)", TEST_TOL2)
compare(sf.hypergU(-1, -2, -0.1)         ,                        1.9, "hypergU(-1, -2, -0.1)", TEST_TOL2)
compare(sf.hypergU(-2, -2, -0.1)         ,                       1.81, "hypergU(-2, -2, -0.1)", TEST_TOL2)
--[[ unimplemented case 
compare(sf.hypergU(-3, -2, -0.1)         ,                     -0.001, "hypergU(-3, -2, -0.1)", TEST_TOL0)
compare(sf.hypergU(-4, -2, -0.1)         ,                     0.0041, "hypergU(-4, -2, -0.1)", TEST_TOL0)
compare(sf.hypergU(-5, -2, -0.1)         ,                   -0.02101, "hypergU(-5, -2, -0.1)", TEST_TOL0)
compare(sf.hypergU(-6, -2, -0.1)         ,                   0.129181, "hypergU(-6, -2, -0.1)", TEST_TOL0)
--]]
compare(sf.hypergU( 0, -3, -0.1)         ,                        1.0, "hypergU( 0, -3, -0.1)", TEST_TOL2)
compare(sf.hypergU(-1, -3, -0.1)         ,                        2.9, "hypergU(-1, -3, -0.1)", TEST_TOL2)
compare(sf.hypergU(-2, -3, -0.1)         ,                       5.61, "hypergU(-2, -3, -0.1)", TEST_TOL2)
compare(sf.hypergU(-3, -3, -0.1)         ,                      5.429, "hypergU(-3, -3, -0.1)", TEST_TOL2)
--[[ unimplemented case 
compare(sf.hypergU(-4, -3, -0.1)         ,                     0.0001, "hypergU(-4, -3, -0.1)", TEST_TOL0)
compare(sf.hypergU(-5, -3, -0.1)         ,                   -0.00051, "hypergU(-5, -3, -0.1)", TEST_TOL0)
compare(sf.hypergU(-6, -3, -0.1)         ,                   0.003121, "hypergU(-6, -3, -0.1)", TEST_TOL0)
--]]
compare(sf.hypergU( 0, -4, -0.1)         ,                        1.0, "hypergU( 0, -4, -0.1)", TEST_TOL2)
compare(sf.hypergU(-1, -4, -0.1)         ,                        3.9, "hypergU(-1, -4, -0.1)", TEST_TOL2)
compare(sf.hypergU(-2, -4, -0.1)         ,                      11.41, "hypergU(-2, -4, -0.1)", TEST_TOL2)
compare(sf.hypergU(-3, -4, -0.1)         ,                     22.259, "hypergU(-3, -4, -0.1)", TEST_TOL2)
compare(sf.hypergU(-4, -4, -0.1)         ,                    21.7161, "hypergU(-4, -4, -0.1)", TEST_TOL2)
--[[ unimplemented case 
compare(sf.hypergU(-5, -4, -0.1)         ,                      -1e-5, "hypergU(-5, -4, -0.1)", TEST_TOL0)
compare(sf.hypergU(-6, -4, -0.1)         ,                   0.000061, "hypergU(-6, -4, -0.1)", TEST_TOL0)
compare(sf.hypergU(-7, -4, -0.1)         ,                 -0.0004341, "hypergU(-7, -4, -0.1)", TEST_TOL0)
--]]
compare(sf.hypergU(-3, 0.5, -0.5)        ,                       -9.5, "hypergU(-3, 0.5, -0.5)", TEST_TOL2)
compare(sf.hypergU(-8, 0.5, -0.5)        ,                180495.0625, "hypergU(-8, 0.5, -0.5)", TEST_TOL2)
compare(sf.hypergU(-8, 1.5, -0.5)        ,                827341.0625, "hypergU(-8, 1.5, -0.5)", TEST_TOL2)
compare(sf.hypergU(-8, 1.5, -10)         ,        7.162987810253906e9, "hypergU(-8, 1.5, -10)", TEST_TOL2)
compare(sf.hypergU(3, 6, -0.5)           ,                     -296.0, "hypergU(3, 6, -0.5)", TEST_TOL2)
compare(sf.hypergU(3, 7, -0.5)           ,                       2824, "hypergU(3, 7, -0.5)", TEST_TOL2)
compare(sf.hypergU(5, 12, -1.7)          ,  -153.262676210016018065768591104, "hypergU(5, 12, -1.7)", TEST_TOL2)
compare(sf.hypergU(0, 0, -0.5)           ,                          1, "hypergU(0, 0, -0.5)", TEST_TOL0)
compare(sf.hypergU(0, 1, -0.5)           ,                          1, "hypergU(0, 1, -0.5)", TEST_TOL0)
compare(sf.hypergU(0, 1, -0.001)         ,                          1, "hypergU(0, 1, -0.001)", TEST_TOL0)
compare(sf.hypergU(-1, 0.99, -0.1)       ,                      -1.09, "hypergU(-1, 0.99, -0.1)", TEST_TOL2)
--[[ unimplemented case 
compare(sf.hypergU(-1, 0, -0.5)          ,                       -0.5, "hypergU(-1, 0, -0.5)", TEST_TOL0)
compare(sf.hypergU(-2, 0, -0.5)          ,                       1.25, "hypergU(-2, 0, -0.5)", TEST_TOL0)
compare(sf.hypergU(-7, 0, -0.1)          ,               -668.2263421, "hypergU(-7, 0, -0.1)", TEST_TOL0)
--]]
compare(sf.hypergU(4.11, 0.11, 6.4)      ,  6.422378238765078623739153038e-5, "hypergU(4.11, 0.11, 6.4)", TEST_TOL2)
compare(sf.hyperg2F1(1, 1, 1, 0.5)       ,                        2.0, "hyperg2F1(1, 1, 1, 0.5)", TEST_TOL0)
compare(sf.hyperg2F1(8, 8, 1, 0.5)       ,                 12451584.0, "hyperg2F1(8, 8, 1, 0.5)", TEST_TOL0)
compare(sf.hyperg2F1(8, -8, 1, 0.5)      ,                 0.13671875, "hyperg2F1(8, -8, 1, 0.5)", TEST_TOL0)
--[[ Only works if error handling is disabled.
compare(sf.hyperg2F1(8, -8.1, 1, 0.5)    ,     0.14147385378899930422, "hyperg2F1(8, -8.1, 1, 0.5)", TEST_TOL4)
--]]
compare(sf.hyperg2F1(8, -8, 1, -0.5)     ,       4945.136718750000000, "hyperg2F1(8, -8, 1, -0.5)", TEST_TOL0)
compare(sf.hyperg2F1(8, -8, -5.5, 0.5)   ,      -906.6363636363636364, "hyperg2F1(8, -8, -5.5, 0.5)", TEST_TOL0)
compare(sf.hyperg2F1(8, -8, -5.5, -0.5)  ,      24565.363636363636364, "hyperg2F1(8, -8, -5.5, -0.5)", TEST_TOL0)
compare(sf.hyperg2F1(8, 8, 1, -0.5)      ,   -0.006476312098196747669, "hyperg2F1(8, 8, 1, -0.5)", TEST_TOL2)
compare(sf.hyperg2F1(8, 8, 5, 0.5)       ,       4205.714285714285714, "hyperg2F1(8, 8, 5, 0.5)", TEST_TOL0)
compare(sf.hyperg2F1(8, 8, 5, -0.5)      ,   0.0028489656290296436616, "hyperg2F1(8, 8, 5, -0.5)", TEST_TOL2)
compare(sf.hyperg2F1(9, 9, 1, 0.99)      ,  1.2363536673577259280e+38 , "hyperg2F1(9, 9, 1, 0.99)", TEST_TOL2)
compare(sf.hyperg2F1(9, 9, -1.5, 0.99)   ,   3.796186436458346579e+46, "hyperg2F1(9, 9, -1.5, 0.99)", TEST_TOL2)
compare(sf.hyperg2F1(9, 9, -1.5, -0.99)  ,     0.14733409946001025146, "hyperg2F1(9, 9, -1.5, -0.99)", TEST_TOL1)
compare(sf.hyperg2F1(9, 9, -8.5, 0.99)   ,  -1.1301780432998743440e+65, "hyperg2F1(9, 9, -8.5, 0.99)", TEST_TOL2)
compare(sf.hyperg2F1(9, 9, -8.5, -0.99)  ,      -8.856462606575344483, "hyperg2F1(9, 9, -8.5, -0.99)", TEST_TOL1)
compare(sf.hyperg2F1(9, 9, -21.5, 0.99)  ,  2.0712920991876073253e+95, "hyperg2F1(9, 9, -21.5, 0.99)", TEST_TOL3)
compare(sf.hyperg2F1(9, 9, -21.5, -0.99) ,      -74.30517015382249216, "hyperg2F1(9, 9, -21.5, -0.99)", TEST_TOL2)
compare(sf.hyperg2F1(9, 9, -100.5, 0.99) ,  -3.186778061428268980e+262, "hyperg2F1(9, 9, -100.5, 0.99)", TEST_TOL3)
compare(sf.hyperg2F1(9, 9, -100.5, -0.99),      2.4454358338375677520, "hyperg2F1(9, 9, -100.5, -0.99)", TEST_TOL1)
compare(sf.hyperg2F1(25, 25, 1, -0.5)    ,  -2.9995530823639545027e-06, "hyperg2F1(25, 25, 1, -0.5)", TEST_SQRT_TOL0)
compare(sf.hyperg2F1(1.5, 0.5, 2.0, 1.0-1.0/64.0),     3.17175539044729373926, "hyperg2F1(1.5, 0.5, 2.0, 1.0-1.0/64.0)", TEST_TOL3)
compare(sf.hyperg2F1(1.5, 0.5, 2.0, 1.0-1.0/128.0),     3.59937243502024563424, "hyperg2F1(1.5, 0.5, 2.0, 1.0-1.0/128.0)", TEST_TOL2)
compare(sf.hyperg2F1(1.5, 0.5, 2.0, 1.0-1.0/256.0),     4.03259299524392504369, "hyperg2F1(1.5, 0.5, 2.0, 1.0-1.0/256.0)", TEST_TOL1)
compare(sf.hyperg2F1(1.5, 0.5, 2.0, 1.0-1.0/1024.0),     4.90784159359675398250, "hyperg2F1(1.5, 0.5, 2.0, 1.0-1.0/1024.0)", TEST_TOL1)
compare(sf.hyperg2F1(1.5, 0.5, 2.0, 1.0-1.0/65536.0),       7.552266033399683914, "hyperg2F1(1.5, 0.5, 2.0, 1.0-1.0/65536.0)", TEST_TOL1)
compare(sf.hyperg2F1(1.5, 0.5, 2.0, 1.0-1.0/16777216.0),    11.08235454026043830363, "hyperg2F1(1.5, 0.5, 2.0, 1.0-1.0/16777216.0)", TEST_TOL1)
compare(sf.hyperg2F1(1.5, 0.5, 2.0, -1.0+1.0/1024.0),    0.762910940909954974527, "hyperg2F1(1.5, 0.5, 2.0, -1.0+1.0/1024.0)", TEST_TOL0)
compare(sf.hyperg2F1(1.5, 0.5, 2.0, -1.0+1.0/65536.0),    0.762762124908845424449, "hyperg2F1(1.5, 0.5, 2.0, -1.0+1.0/65536.0)", TEST_TOL0)
compare(sf.hyperg2F1(1.5, 0.5, 2.0, -1.0+1.0/1048576.0),    0.762759911089064738044, "hyperg2F1(1.5, 0.5, 2.0, -1.0+1.0/1048576.0)", TEST_TOL0)
compare(sf.hyperg2F1(1.5, 0.5, 3.0, 1.0) ,  1.6976527263135502482014268 , "hyperg2F1(1.5, 0.5, 3.0, 1.0)", TEST_TOL2)
compare(sf.hyperg2F1(1.5, -4.2, 3.0, 1.0),  .15583601560025710649555254 , "hyperg2F1(1.5, -4.2, 3.0, 1.0)", TEST_TOL2)
compare(sf.hyperg2F1(-7.4, 0.7, -1.5, 1.0),  -.34478866959246584996859 , "hyperg2F1(-7.4, 0.7, -1.5, 1.0)", TEST_TOL2)
compare(sf.hyperg2F1(0.1, -2.7, -1.5, 1.0),   1.059766766063610122925 , "hyperg2F1(0.1, -2.7, -1.5, 1.0)", TEST_TOL2)
compare(sf.hyperg2F1(0, -2, -4, 0.5)     ,                       1.0 , "hyperg2F1(0, -2, -4, 0.5)", TEST_TOL2)
compare(sf.hyperg2F1(-10.34, 2.05, 3.05, 0.1725),  0.310473552213130010351006093079548, "hyperg2F1(-10.34, 2.05, 3.05, 0.1725)", TEST_TOL2)
compare(sf.hyperg2F1(-9.99999999999, 2.05, 3.05, 0.1725),  0.32141934630197487540298837643890, "hyperg2F1(-9.99999999999, 2.05, 3.05, 0.1725)", TEST_TOL2)
compare(sf.hyperg2F1(11, -1, 11.0/2.0, 0.125 ),                       0.75, "hyperg2F1(11, -1, 11.0/2.0, 0.125 )", TEST_TOL2)
--[[ bug #39056
compare(sf.hyperg2F1(3.5, -0.5, 5.0, 0.9),  0.5923981284370653465208973272, "hyperg2F1(3.5, -0.5, 5.0, 0.9)", TEST_TOL2)
compare(sf.hyperg2F1(-1.0, -10.0, 1.0, 0.5),                        6.0, "hyperg2F1(-1.0, -10.0, 1.0, 0.5)", TEST_TOL0)
--]]
compare(sf.hyperg2F0(0.01, 1.0, -0.02)   ,  .99980388665511730901180717   , "hyperg2F0(0.01, 1.0, -0.02)", TEST_TOL0)
compare(sf.hyperg2F0(0.1,  0.5, -0.02)   ,  .99901595171179281891589794   , "hyperg2F0(0.1,  0.5, -0.02)", TEST_TOL0)
compare(sf.hyperg2F0(1,   1, -0.02)      ,  .98075549650574351826538049000    , "hyperg2F0(1,   1, -0.02)", TEST_TOL0)
compare(sf.hyperg2F0(8,   8, -0.02)      ,  .32990592849626965538692141   , "hyperg2F0(8,   8, -0.02)", TEST_TOL0)
compare(sf.hyperg2F0(50, 50, -0.02)      ,  .2688995263772964415245902e-12 , "hyperg2F0(50, 50, -0.02)", TEST_TOL0)
compare(sf.hyperg2F1_renorm(1, 1, 1, 0.5),                        2.0, "hyperg2F1_renorm(1, 1, 1, 0.5)", TEST_TOL0)
compare(sf.hyperg2F1_renorm(8, 8, 1, 0.5),                 12451584.0, "hyperg2F1_renorm(8, 8, 1, 0.5)", TEST_TOL0)
compare(sf.hyperg2F1_renorm(8, -8, 1, 0.5),                 0.13671875, "hyperg2F1_renorm(8, -8, 1, 0.5)", TEST_TOL0)
compare(sf.hyperg2F1_renorm(8, -8, 1, -0.5),              4945.13671875, "hyperg2F1_renorm(8, -8, 1, -0.5)", TEST_TOL0)
compare(sf.hyperg2F1_renorm(8, -8, -5.5, 0.5),      -83081.19167659493609, "hyperg2F1_renorm(8, -8, -5.5, 0.5)", TEST_TOL2)
compare(sf.hyperg2F1_renorm(8, -8, -5.5, -0.5),  2.2510895952730178518e+06, "hyperg2F1_renorm(8, -8, -5.5, -0.5)", TEST_TOL2)
compare(sf.hyperg2F1_renorm(8, 8, 5, 0.5),       175.2380952380952381, "hyperg2F1_renorm(8, 8, 5, 0.5)", TEST_TOL1)
compare(sf.hyperg2F1_renorm(9, 9, -1.5, 0.99),  1.6063266334913066551e+46, "hyperg2F1_renorm(9, 9, -1.5, 0.99)", TEST_TOL2)
compare(sf.hyperg2F1_renorm(9, 9, -1.5, -0.99),     0.06234327316254516616, "hyperg2F1_renorm(9, 9, -1.5, -0.99)", TEST_TOL2)
compare(sf.hyperg2F1_renorm(5, 5, -1, 0.5),                  4949760.0, "hyperg2F1_renorm(5, 5, -1, 0.5)", TEST_TOL1)
compare(sf.hyperg2F1_renorm(5, 5, -10, 0.5),    139408493229637632000.0, "hyperg2F1_renorm(5, 5, -10, 0.5)", TEST_TOL2)
compare(sf.hyperg2F1_renorm(5, 5, -100, 0.5),  3.0200107544594411315e+206, "hyperg2F1_renorm(5, 5, -100, 0.5)", TEST_TOL3)