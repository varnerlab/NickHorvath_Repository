Tsim = readdlm("Ensemble/1/Tsim")
X = readdlm("Ensemble/1/X_nc")
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

for i in 2:1000
#if isdir("Ensemble/$i")
    println(i)
    X = readdlm("Ensemble/$i/X_nc")
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

writedlm("Ens_nc/glc",Glc)
writedlm("Ens_nc/cat",Cat)
writedlm("Ens_nc/pyr",Pyr)
writedlm("Ens_nc/lac",Lac)
writedlm("Ens_nc/ac",Ac)
writedlm("Ens_nc/succ",Succ)
writedlm("Ens_nc/mal",Mal)
writedlm("Ens_nc/atp",Atp)
writedlm("Ens_nc/adp",Adp)
writedlm("Ens_nc/amp",Amp)
writedlm("Ens_nc/gtp",Gtp)
writedlm("Ens_nc/gdp",Gdp)
writedlm("Ens_nc/gmp",Gmp)
writedlm("Ens_nc/utp",Utp)
writedlm("Ens_nc/udp",Udp)
writedlm("Ens_nc/ump",Ump)
writedlm("Ens_nc/ctp",Ctp)
writedlm("Ens_nc/cdp",Cdp)
writedlm("Ens_nc/cmp",Cmp)
writedlm("Ens_nc/ala",Ala)
writedlm("Ens_nc/arg",Arg)
writedlm("Ens_nc/asn",Asn)
writedlm("Ens_nc/asp",Asp)
writedlm("Ens_nc/cys",Cys)
writedlm("Ens_nc/gln",Gln)
writedlm("Ens_nc/glu",Glu)
writedlm("Ens_nc/gly",Gly)
writedlm("Ens_nc/his",His)
writedlm("Ens_nc/ile",Ile)
writedlm("Ens_nc/leu",Leu)
writedlm("Ens_nc/lys",Lys)
writedlm("Ens_nc/met",Met)
writedlm("Ens_nc/phe",Phe)
writedlm("Ens_nc/pro",Pro)
writedlm("Ens_nc/ser",Ser)
writedlm("Ens_nc/thr",Thr)
writedlm("Ens_nc/trp",Trp)
writedlm("Ens_nc/tyr",Tyr)
writedlm("Ens_nc/val",Val)

atp = readdlm("Ens_nc/atp")
adp = readdlm("Ens_nc/adp")
amp = readdlm("Ens_nc/amp")
axp = atp+adp+amp
writedlm("Ens_nc/axp",axp)

gtp = readdlm("Ens_nc/gtp")
gdp = readdlm("Ens_nc/gdp")
gmp = readdlm("Ens_nc/gmp")
gxp = gtp+gdp+gmp
writedlm("Ens_nc/gxp",gxp)

utp = readdlm("Ens_nc/utp")
udp = readdlm("Ens_nc/udp")
ump = readdlm("Ens_nc/ump")
uxp = utp+udp+ump
writedlm("Ens_nc/uxp",uxp)

ctp = readdlm("Ens_nc/ctp")
cdp = readdlm("Ens_nc/cdp")
cmp = readdlm("Ens_nc/cmp")
cxp = ctp+cdp+cmp
writedlm("Ens_nc/cxp",cxp)

xxp = axp+gxp+uxp+cxp
writedlm("Ens_nc/xxp",xxp)

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
    tmp = readdlm("Ens_nc/"*key)
    M = Float64[]
    S = Float64[]
    for j in 1:301
        m = mean(tmp[j,:])
        s = std(tmp[j,:])
        push!(M,m)
        push!(S,s)
    end
    writedlm("Ens_nc/"*key*"_m",M)
    writedlm("Ens_nc/"*key*"_s",S)
end






