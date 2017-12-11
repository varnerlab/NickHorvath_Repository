Tsim = readdlm("Ensemble_100/1/Tsim")
X = readdlm("Ensemble_100/1/X")
Glc = X[:,100]
Pyr = X[:,102]
Lac = X[:,104]
Ac = X[:,103]
Cat = X[:,98]
Succ = X[:,118]
Mal = X[:,105]

Atp = X[:,106]
Adp = X[:,107]
Amp = X[:,108]
Gtp = X[:,109]
Gdp = X[:,110]
Gmp = X[:,111]
Utp = X[:,112]
Udp = X[:,113]
Ump = X[:,114]
Ctp = X[:,115]
Cdp = X[:,116]
Cmp = X[:,117]

Ala = X[:,126]
Arg = X[:,36]
Asn = X[:,122]
Asp = X[:,119]
Cys = X[:,123]
Gln = X[:,137]
Glu = X[:,136]
Gly = X[:,120]
His = X[:,125]
Ile = X[:,121]
Leu = X[:,135]
Lys = X[:,124]
Met = X[:,134]
Phe = X[:,127]
Pro = X[:,128]
Ser = X[:,129]
Thr = X[:,130]
Trp = X[:,131]
Tyr = X[:,132]
Val = X[:,133]

for i in 2:100
#if isdir("Ensemble_100/$i")
    println(i)
    X = readdlm("Ensemble_100/$i/X")
    glc = X[:,100]
    pyr = X[:,102]
    lac = X[:,104]
    ac = X[:,103]
    cat = X[:,98]
    succ = X[:,118]
    mal = X[:,105]
    
    atp = X[:,106]
    adp = X[:,107]
    amp = X[:,108]
    gtp = X[:,109]
    gdp = X[:,110]
    gmp = X[:,111]
    utp = X[:,112]
    udp = X[:,113]
    ump = X[:,114]
    ctp = X[:,115]
    cdp = X[:,116]
    cmp = X[:,117]
    
    ala = X[:,126]
    arg = X[:,36]
    asn = X[:,122]
    asp = X[:,119]
    cys = X[:,123]
    gln = X[:,137]
    glu = X[:,136]
    gly = X[:,120]
    his = X[:,125]
    ile = X[:,121]
    leu = X[:,135]
    lys = X[:,124]
    met = X[:,134]
    phe = X[:,127]
    pro = X[:,128]
    ser = X[:,129]
    thr = X[:,130]
    trp = X[:,131]
    tyr = X[:,132]
    val = X[:,133]
    
    Glc = [Glc glc]
    Pyr = [Pyr pyr]
    Lac = [Lac lac]
    Ac = [Ac ac]
    Cat = [Cat cat]
    Succ = [Succ succ]
    Mal = [Mal mal]
    
    Atp = [Atp atp]
    Adp = [Adp adp]
    Amp = [Amp amp]
    Gtp = [Gtp gtp]
    Gdp = [Gdp gdp]
    Gmp = [Gmp gmp]
    Utp = [Utp utp]
    Udp = [Udp udp]
    Ump = [Ump ump]
    Ctp = [Ctp ctp]
    Cdp = [Cdp cdp]
    Cmp = [Cmp cmp]
    
    Ala = [Ala ala]
    Arg = [Arg arg]
    Asn = [Asn asn]
    Asp = [Asp asp]
    Cys = [Cys cys]
    Gln = [Gln gln]
    Glu = [Glu glu]
    Gly = [Gly gly]
    His = [His his]
    Ile = [Ile ile]
    Leu = [Leu leu]
    Lys = [Lys lys]
    Met = [Met met]
    Phe = [Phe phe]
    Pro = [Pro pro]
    Ser = [Ser ser]
    Thr = [Thr thr]
    Trp = [Trp trp]
    Tyr = [Tyr tyr]
    Val = [Val val]
#end
end

writedlm("Ens_100/glc",Glc)
writedlm("Ens_100/cat",Cat)
writedlm("Ens_100/pyr",Pyr)
writedlm("Ens_100/lac",Lac)
writedlm("Ens_100/ac",Ac)
writedlm("Ens_100/succ",Succ)
writedlm("Ens_100/mal",Mal)
writedlm("Ens_100/atp",Atp)
writedlm("Ens_100/adp",Adp)
writedlm("Ens_100/amp",Amp)
writedlm("Ens_100/gtp",Gtp)
writedlm("Ens_100/gdp",Gdp)
writedlm("Ens_100/gmp",Gmp)
writedlm("Ens_100/utp",Utp)
writedlm("Ens_100/udp",Udp)
writedlm("Ens_100/ump",Ump)
writedlm("Ens_100/ctp",Ctp)
writedlm("Ens_100/cdp",Cdp)
writedlm("Ens_100/cmp",Cmp)
writedlm("Ens_100/ala",Ala)
writedlm("Ens_100/arg",Arg)
writedlm("Ens_100/asn",Asn)
writedlm("Ens_100/asp",Asp)
writedlm("Ens_100/cys",Cys)
writedlm("Ens_100/gln",Gln)
writedlm("Ens_100/glu",Glu)
writedlm("Ens_100/gly",Gly)
writedlm("Ens_100/his",His)
writedlm("Ens_100/ile",Ile)
writedlm("Ens_100/leu",Leu)
writedlm("Ens_100/lys",Lys)
writedlm("Ens_100/met",Met)
writedlm("Ens_100/phe",Phe)
writedlm("Ens_100/pro",Pro)
writedlm("Ens_100/ser",Ser)
writedlm("Ens_100/thr",Thr)
writedlm("Ens_100/trp",Trp)
writedlm("Ens_100/tyr",Tyr)
writedlm("Ens_100/val",Val)

atp = readdlm("Ens_100/atp")
adp = readdlm("Ens_100/adp")
amp = readdlm("Ens_100/amp")
axp = atp+adp+amp
writedlm("Ens_100/axp",axp)

gtp = readdlm("Ens_100/gtp")
gdp = readdlm("Ens_100/gdp")
gmp = readdlm("Ens_100/gmp")
gxp = gtp+gdp+gmp
writedlm("Ens_100/gxp",gxp)

utp = readdlm("Ens_100/utp")
udp = readdlm("Ens_100/udp")
ump = readdlm("Ens_100/ump")
uxp = utp+udp+ump
writedlm("Ens_100/uxp",uxp)

ctp = readdlm("Ens_100/ctp")
cdp = readdlm("Ens_100/cdp")
cmp = readdlm("Ens_100/cmp")
cxp = ctp+cdp+cmp
writedlm("Ens_100/cxp",cxp)

xxp = axp+gxp+uxp+cxp
writedlm("Ens_100/xxp",xxp)

keys = [
"glc"
"pyr"
"lac"
"ac"
"cat"
"succ"
"mal"
"xxp"
"atp"
"adp"
"amp"
"axp"
"gtp"
"gdp"
"gmp"
"gxp"
"utp"
"udp"
"ump"
"uxp"
"ctp"
"cdp"
"cmp"
"cxp"
"ala"
"arg"
"asn"
"asp"
"cys"
"gln"
"glu"
"gly"
"his"
"ile"
"leu"
"lys"
"met"
"phe"
"pro"
"ser"
"thr"
"trp"
"tyr"
"val"]

for key in keys
    tmp = readdlm("Ens_100/"*key)
    M = Float64[]
    S = Float64[]
    for j in 1:301
        m = mean(tmp[j,:])
        s = std(tmp[j,:])
        push!(M,m)
        push!(S,s)
    end
    writedlm("Ens_100/"*key*"_m",M)
    writedlm("Ens_100/"*key*"_s",S)
end






