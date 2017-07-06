include("DataDictionary.jl")
using PyPlot

# Setup the timescale
TSTART = 0.0
TSTOP = 3.0
Ts = 0.01

# Create dictionary of parameters
data_dictionary = DataDictionary(TSTART,TSTOP,Ts)
experiment_data_dictionary = data_dictionary["EXPERIMENT_DATA_DICTIONARY"]

glc = experiment_data_dictionary["M_glc_D_c"].raw_measurement_array
pyr = experiment_data_dictionary["M_pyr_c"].raw_measurement_array
lac = experiment_data_dictionary["M_lac_D_c"].raw_measurement_array
ac = experiment_data_dictionary["M_ac_c"].raw_measurement_array
succ = experiment_data_dictionary["M_succ_c"].raw_measurement_array
mal = experiment_data_dictionary["M_mal_L_c"].raw_measurement_array
CAT = experiment_data_dictionary["CAT"].raw_measurement_array

atp = experiment_data_dictionary["M_atp_c"].raw_measurement_array
adp = experiment_data_dictionary["M_adp_c"].raw_measurement_array
amp = experiment_data_dictionary["M_amp_c"].raw_measurement_array
axp = atp+adp+amp
axp[:,1] = atp[:,1]
gtp = experiment_data_dictionary["M_gtp_c"].raw_measurement_array
gdp = experiment_data_dictionary["M_gdp_c"].raw_measurement_array
gmp = experiment_data_dictionary["M_gmp_c"].raw_measurement_array
gxp = gtp+gdp+gmp
gxp[:,1] = gtp[:,1]
ctp = experiment_data_dictionary["M_ctp_c"].raw_measurement_array
cdp = experiment_data_dictionary["M_cdp_c"].raw_measurement_array
cmp = experiment_data_dictionary["M_cmp_c"].raw_measurement_array
cxp = ctp+cdp+cmp
cxp[:,1] = ctp[:,1]
utp = experiment_data_dictionary["M_utp_c"].raw_measurement_array
udp = experiment_data_dictionary["M_udp_c"].raw_measurement_array
ump = experiment_data_dictionary["M_ump_c"].raw_measurement_array
uxp = utp+udp+ump
uxp[:,1] = utp[:,1]

xxp = axp+gxp+cxp+uxp
xxp[:,1] = axp[:,1]

ala = experiment_data_dictionary["M_ala_L_c"].raw_measurement_array
asn	= experiment_data_dictionary["M_asn_L_c"].raw_measurement_array
asp = experiment_data_dictionary["M_asp_L_c"].raw_measurement_array
cys = experiment_data_dictionary["M_cys_L_c"].raw_measurement_array
gln = experiment_data_dictionary["M_gln_L_c"].raw_measurement_array
gly = experiment_data_dictionary["M_gly_L_c"].raw_measurement_array
his	= experiment_data_dictionary["M_his_L_c"].raw_measurement_array
ile	= experiment_data_dictionary["M_ile_L_c"].raw_measurement_array
leu	= experiment_data_dictionary["M_leu_L_c"].raw_measurement_array
lys	= experiment_data_dictionary["M_lys_L_c"].raw_measurement_array
met	= experiment_data_dictionary["M_met_L_c"].raw_measurement_array
phe = experiment_data_dictionary["M_phe_L_c"].raw_measurement_array
pro	= experiment_data_dictionary["M_pro_L_c"].raw_measurement_array
ser = experiment_data_dictionary["M_ser_L_c"].raw_measurement_array
thr = experiment_data_dictionary["M_thr_L_c"].raw_measurement_array
trp = experiment_data_dictionary["M_trp_L_c"].raw_measurement_array
tyr	= experiment_data_dictionary["M_tyr_L_c"].raw_measurement_array
val	= experiment_data_dictionary["M_val_L_c"].raw_measurement_array

AA = ala+asn+asp+cys+gln+gly+his+ile+leu+lys+met+phe+pro+ser+thr+trp+tyr+val
AA[:,1] = ala[:,1]

species = ["GLC" 98;"PYR" 100;"LAC" 102;"AC" 101;"SUCC" 116;"MAL" 103;"CAT" 96;"XXP" (104,105,106,107,108,109,110,111,112,113,114,115);"ATP" 104;"ADP" 105;"AMP" 106;"AXP" (104,105,106);"GTP" 107;"GDP" 108;"GMP" 109;"GXP" (107,108,109);"CTP" 113;"CDP" 114;"CMP" 115;"CXP" (113,114,115);"UTP" 110;"UDP" 111;"UMP" 112;"UXP" (110,111,112);"ALA" 124;"ARG" 35;"ASN" 120;"ASP" 117;"CYS" 121;"GLN" 135;"GLU" 134;"GLY" 118;"HIS" 123;"ILE" 119;"LEU" 133;"LYS" 122;"MET" 132;"PHE" 125;"PRO" 126;"SER" 127;"THR" 128;"TRP" 129;"TYR" 130;"VAL" 131]

glc[:,1] *= TSTOP/3
pyr[:,1] *= TSTOP/3
lac[:,1] *= TSTOP/3
ac[:,1] *= TSTOP/3
succ[:,1] *= TSTOP/3
mal[:,1] *= TSTOP/3
CAT[:,1] *= TSTOP/3
atp[:,1] *= TSTOP/3
adp[:,1] *= TSTOP/3
amp[:,1] *= TSTOP/3
axp[:,1] *= TSTOP/3
gtp[:,1] *= TSTOP/3
gdp[:,1] *= TSTOP/3
gmp[:,1] *= TSTOP/3
gxp[:,1] *= TSTOP/3
ctp[:,1] *= TSTOP/3
cdp[:,1] *= TSTOP/3
cmp[:,1] *= TSTOP/3
cxp[:,1] *= TSTOP/3
utp[:,1] *= TSTOP/3
udp[:,1] *= TSTOP/3
ump[:,1] *= TSTOP/3
uxp[:,1] *= TSTOP/3
xxp[:,1] *= TSTOP/3
ala[:,1] *= TSTOP/3
asp[:,1] *= TSTOP/3
cys[:,1] *= TSTOP/3
gln[:,1] *= TSTOP/3
gly[:,1] *= TSTOP/3
phe[:,1] *= TSTOP/3
ser[:,1] *= TSTOP/3
thr[:,1] *= TSTOP/3
asn[:,1] *= TSTOP/3
his[:,1] *= TSTOP/3
ile[:,1] *= TSTOP/3
leu[:,1] *= TSTOP/3
lys[:,1] *= TSTOP/3
met[:,1] *= TSTOP/3
pro[:,1] *= TSTOP/3
trp[:,1] *= TSTOP/3
tyr[:,1] *= TSTOP/3
val[:,1] *= TSTOP/3

#figure("Carbon_100",figsize=(23,7))
#figure("Energy_100",figsize=(20,12.5))
#figure("Amino_100",figsize=(15,12.5))
figure("Carbon_100",figsize=(23,8))
figure("Energy_100",figsize=(23,13))
figure("Amino_100",figsize=(23,13))

figure("Carbon_100")

subplot(2,4,1)
errorbar(glc[:,1],glc[:,2],glc[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,40])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:10:40)
ylabel("Glucose (mM)")
xlabel("Time (h)")

subplot(2,4,2)
errorbar(CAT[:,1],1000*CAT[:,2],1000*CAT[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,25])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:5:25)
ylabel("CAT (μM)")
xlabel("Time (h)")

subplot(2,4,3)
errorbar(pyr[:,1],pyr[:,2],pyr[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,15])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:5:15)
ylabel("Pyruvate (mM)")
xlabel("Time (h)")

subplot(2,4,4)
errorbar(lac[:,1],lac[:,2],lac[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,15])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:5:15)
ylabel("Lactate (mM)")
xlabel("Time (h)")

subplot(2,4,5)
errorbar(ac[:,1],ac[:,2],ac[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,60])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:20:60)
ylabel("Acetate (mM)")
xlabel("Time (h)")

subplot(2,4,6)
errorbar(succ[:,1],succ[:,2],succ[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("Succinate (mM)")
xlabel("Time (h)")

subplot(2,4,7)
errorbar(mal[:,1],mal[:,2],mal[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,8])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:2:8)
ylabel("Malate (mM)")
xlabel("Time (h)")

subplot(2,4,8)
errorbar(xxp[:,1],xxp[:,2],xxp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,8])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:2:8)
ylabel("Energy_100 Total (mM)")
xlabel("Time (h)")





figure("Energy_100")

subplot(4,4,1)
errorbar(atp[:,1],atp[:,2],atp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,2])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.5:2)
ylabel("ATP (mM)")
xlabel("Time (h)")

subplot(4,4,5)
errorbar(adp[:,1],adp[:,2],adp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,1])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.2:1)
ylabel("ADP (mM)")
xlabel("Time (h)")

subplot(4,4,9)
errorbar(amp[:,1],amp[:,2],amp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,.4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.1:.4)
ylabel("AMP (mM)")
xlabel("Time (h)")

subplot(4,4,13)
errorbar(axp[:,1],axp[:,2],axp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,2])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.5:2)
ylabel("Σ AXP (mM)")
xlabel("Time (h)")

subplot(4,4,2)
errorbar(gtp[:,1],gtp[:,2],gtp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,1.5])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.5:1.5)
ylabel("GTP (mM)")
xlabel("Time (h)")

subplot(4,4,6)
errorbar(gdp[:,1],gdp[:,2],gdp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,.8])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.2:.8)
ylabel("GDP (mM)")
xlabel("Time (h)")

subplot(4,4,10)
errorbar(gmp[:,1],gmp[:,2],gmp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,.3])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.1:.3)
ylabel("GMP (mM)")
xlabel("Time (h)")

subplot(4,4,14)
errorbar(gxp[:,1],gxp[:,2],gxp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,2])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.5:2)
ylabel("Σ GXP (mM)")
xlabel("Time (h)")

subplot(4,4,3)
errorbar(ctp[:,1],ctp[:,2],ctp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,1.2])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.2:1.2)
ylabel("CTP (mM)")
xlabel("Time (h)")

subplot(4,4,7)
errorbar(cdp[:,1],cdp[:,2],cdp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,.6])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.2:.6)
ylabel("CDP (mM)")
xlabel("Time (h)")

subplot(4,4,11)
errorbar(cmp[:,1],cmp[:,2],cmp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,.8])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.2:.8)
ylabel("CMP (mM)")
xlabel("Time (h)")

subplot(4,4,15)
errorbar(cxp[:,1],cxp[:,2],cxp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,2])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.5:2)
ylabel("Σ CXP (mM)")
xlabel("Time (h)")

subplot(4,4,4)
errorbar(utp[:,1],utp[:,2],utp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,1])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.2:1)
ylabel("UTP (mM)")
xlabel("Time (h)")

subplot(4,4,8)
errorbar(udp[:,1],udp[:,2],udp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,.6])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.2:.6)
ylabel("UDP (mM)")
xlabel("Time (h)")

subplot(4,4,12)
errorbar(ump[:,1],ump[:,2],ump[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,.4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.1:.4)
ylabel("UMP (mM)")
xlabel("Time (h)")

subplot(4,4,16)
errorbar(uxp[:,1],uxp[:,2],uxp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,1.5])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.5:1.5)
ylabel("Σ UXP (mM)")
xlabel("Time (h)")





figure("Amino_100")

subplot(5,4,1)
errorbar(ala[:,1],ala[:,2],ala[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,10])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:2:10)
ylabel("ALA (mM)")
xlabel("Time (h)")

subplot(5,4,2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("ARG (mM)")
xlabel("Time (h)")

subplot(5,4,3)
errorbar(asn[:,1],asn[:,2],asn[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,3])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:3)
ylabel("ASN (mM)")
xlabel("Time (h)")

subplot(5,4,4)
errorbar(asp[:,1],asp[:,2],asp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("ASP (mM)")
xlabel("Time (h)")

subplot(5,4,5)
errorbar(cys[:,1],cys[:,2],cys[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,3])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:3)
ylabel("CYS (mM)")
xlabel("Time (h)")

subplot(5,4,6)
errorbar(gln[:,1],gln[:,2],gln[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,5])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:5)
ylabel("GLN (mM)")
xlabel("Time (h)")

subplot(5,4,7)
axis([0,TSTOP,0,200])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:50:200)
ylabel("GLU (mM)")
xlabel("Time (h)")

subplot(5,4,8)
errorbar(gly[:,1],gly[:,2],gly[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,5])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:5)
ylabel("GLY (mM)")
xlabel("Time (h)")

subplot(5,4,9)
errorbar(his[:,1],his[:,2],his[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("HIS (mM)")
xlabel("Time (h)")

subplot(5,4,10)
errorbar(ile[:,1],ile[:,2],ile[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("ILE (mM)")
xlabel("Time (h)")

subplot(5,4,11)
errorbar(leu[:,1],leu[:,2],leu[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("LEU (mM)")
xlabel("Time (h)")

subplot(5,4,12)
errorbar(lys[:,1],lys[:,2],lys[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("LYS (mM)")
xlabel("Time (h)")

subplot(5,4,13)
errorbar(met[:,1],met[:,2],met[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("MET (mM)")
xlabel("Time (h)")

subplot(5,4,14)
errorbar(phe[:,1],phe[:,2],phe[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("PHE (mM)")
xlabel("Time (h)")

subplot(5,4,15)
errorbar(pro[:,1],pro[:,2],pro[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("PRO (mM)")
xlabel("Time (h)")

subplot(5,4,16)
errorbar(ser[:,1],ser[:,2],ser[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("SER (mM)")
xlabel("Time (h)")

subplot(5,4,17)
errorbar(thr[:,1],thr[:,2],thr[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("THR (mM)")
xlabel("Time (h)")

subplot(5,4,18)
errorbar(trp[:,1],trp[:,2],trp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("TRP (mM)")
xlabel("Time (h)")

subplot(5,4,19)
errorbar(tyr[:,1],tyr[:,2],tyr[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,3])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:3)
ylabel("TYR (mM)")
xlabel("Time (h)")

subplot(5,4,20)
errorbar(val[:,1],val[:,2],val[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("VAL (mM)")
xlabel("Time (h)")

Tsim = readdlm("Ensemble_100/Best/Tsim")
X = readdlm("Ensemble_100/Best/X")

species = [
"glc" experiment_data_dictionary["M_glc_D_c"].model_index;
"cat" experiment_data_dictionary["CAT"].model_index;
"pyr" experiment_data_dictionary["M_pyr_c"].model_index;
"lac" experiment_data_dictionary["M_lac_D_c"].model_index;
"ac" experiment_data_dictionary["M_ac_c"].model_index;
"succ" experiment_data_dictionary["M_succ_c"].model_index;
"mal" experiment_data_dictionary["M_mal_L_c"].model_index;
"xxp" (experiment_data_dictionary["M_atp_c"].model_index,
experiment_data_dictionary["M_adp_c"].model_index,
experiment_data_dictionary["M_amp_c"].model_index,
experiment_data_dictionary["M_gtp_c"].model_index,
experiment_data_dictionary["M_gdp_c"].model_index,
experiment_data_dictionary["M_gmp_c"].model_index,
experiment_data_dictionary["M_utp_c"].model_index,
experiment_data_dictionary["M_udp_c"].model_index,
experiment_data_dictionary["M_ump_c"].model_index,
experiment_data_dictionary["M_ctp_c"].model_index,
experiment_data_dictionary["M_cdp_c"].model_index,
experiment_data_dictionary["M_cmp_c"].model_index)
"atp" experiment_data_dictionary["M_atp_c"].model_index;
"adp" experiment_data_dictionary["M_adp_c"].model_index;
"amp" experiment_data_dictionary["M_amp_c"].model_index;
"axp" (experiment_data_dictionary["M_atp_c"].model_index,
experiment_data_dictionary["M_adp_c"].model_index,
experiment_data_dictionary["M_amp_c"].model_index)
"gtp" experiment_data_dictionary["M_gtp_c"].model_index;
"gdp" experiment_data_dictionary["M_gdp_c"].model_index;
"gmp" experiment_data_dictionary["M_gmp_c"].model_index;
"gxp" (experiment_data_dictionary["M_gtp_c"].model_index,
experiment_data_dictionary["M_gdp_c"].model_index,
experiment_data_dictionary["M_gmp_c"].model_index)
"ctp" experiment_data_dictionary["M_ctp_c"].model_index;
"cdp" experiment_data_dictionary["M_cdp_c"].model_index;
"cmp" experiment_data_dictionary["M_cmp_c"].model_index;
"cxp" (experiment_data_dictionary["M_ctp_c"].model_index,
experiment_data_dictionary["M_cdp_c"].model_index,
experiment_data_dictionary["M_cmp_c"].model_index)
"utp" experiment_data_dictionary["M_utp_c"].model_index;
"udp" experiment_data_dictionary["M_udp_c"].model_index;
"ump" experiment_data_dictionary["M_ump_c"].model_index;
"uxp" (experiment_data_dictionary["M_utp_c"].model_index,
experiment_data_dictionary["M_udp_c"].model_index,
experiment_data_dictionary["M_ump_c"].model_index)
"ala" experiment_data_dictionary["M_ala_L_c"].model_index;
"arg" 36;
"asn" experiment_data_dictionary["M_asn_L_c"].model_index;
"asp" experiment_data_dictionary["M_asp_L_c"].model_index;
"cys" experiment_data_dictionary["M_cys_L_c"].model_index;
"gln" experiment_data_dictionary["M_gln_L_c"].model_index;
"glu" 136;
"gly" experiment_data_dictionary["M_gly_L_c"].model_index;
"his" experiment_data_dictionary["M_his_L_c"].model_index;
"ile" experiment_data_dictionary["M_ile_L_c"].model_index;
"leu" experiment_data_dictionary["M_leu_L_c"].model_index;
"lys" experiment_data_dictionary["M_lys_L_c"].model_index;
"met" experiment_data_dictionary["M_met_L_c"].model_index;
"phe" experiment_data_dictionary["M_phe_L_c"].model_index;
"pro" experiment_data_dictionary["M_pro_L_c"].model_index;
"ser" experiment_data_dictionary["M_ser_L_c"].model_index;
"thr" experiment_data_dictionary["M_thr_L_c"].model_index;
"trp" experiment_data_dictionary["M_trp_L_c"].model_index;
"tyr" experiment_data_dictionary["M_tyr_L_c"].model_index;
"val" experiment_data_dictionary["M_val_L_c"].model_index]

z = 1.959964 # Z-value corresponding to 95% CI

for j in 1:size(species,1)
    key = species[j,1]
    index = species[j,2]
    
    if typeof(index) == Int
        tmp = X[:,index]
    elseif typeof(index) == Tuple{Int,Int,Int}
        tmp = X[:,index[1]]+X[:,index[2]]+X[:,index[3]]
    elseif typeof(index) == Tuple{Int,Int,Int,Int,Int,Int,Int,Int,Int,Int,Int,Int}
        tmp = X[:,index[1]]+X[:,index[2]]+X[:,index[3]]+X[:,index[4]]+X[:,index[5]]+X[:,index[6]]+X[:,index[7]]+X[:,index[8]]+X[:,index[9]]+X[:,index[10]]+X[:,index[11]]+X[:,index[12]]
    else
        throw("Wrong type")
    end
    
    m = readdlm("Ens_100/"*key*"_m")
    s = readdlm("Ens_100/"*key*"_s")
    
    if key == "CAT" || key == "cat" # Convert from mM to μM
        m *= 1000
        s *= 1000
        tmp *= 1000
    end
    
    Energy_100_order = [1 5 9 13 2 6 10 14 3 7 11 15 4 8 12 16] # Reorder Energy_100 species by column
    
    if j < 9
        figure("Carbon_100")
        subplot(2,4,j)
    elseif j >= 9 && j < 25
        figure("Energy_100")
        subplot(4,4,Energy_100_order[j-8])
    else
        figure("Amino_100")
        subplot(5,4,j-24)
    end
    
    fill_between(vec(Tsim),vec(m+z*s),vec(max(0,m-z*s)),color="#A0D5FF")#"lightblue")
    plot(Tsim,vec(tmp),"orangered",linewidth=1.5)
    
    tight_layout()
end






