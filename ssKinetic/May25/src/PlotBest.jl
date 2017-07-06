include("DataDictionary.jl")
include("SolveBalances.jl")
include("CalcError.jl")
using PyPlot

if isdir("flux")
    rm("flux",recursive=true)
end

# Setup the timescale
TSTART = 0.0
TSTOP = 3.0
Ts = 0.01

# Create dictionary of parameters
data_dictionary = DataDictionary(TSTART,TSTOP,Ts)
experiment_data_dictionary = data_dictionary["EXPERIMENT_DATA_DICTIONARY"]

tic()
Tsim,X = SolveBalances(TSTART,TSTOP,Ts,data_dictionary)
time_elapsed = toc()

Error,Keys = CalcError(experiment_data_dictionary,Tsim,X)
cost = sum(Error)
println("cost: ",cost)

plot_color = "red"

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

#species = ["GLC" 101;"PYR" 103;"LAC" 105;"AC" 104;"SUCC" 119;"MAL" 106;"CAT" 99;"XXP" (107,108,109,110,111,112,113,114,115,116,117,118);"ATP" 107;"ADP" 108;"AMP" 109;"AXP" (107,108,109);"GTP" 110;"GDP" 111;"GMP" 112;"GXP" (110,111,112);"CTP" 116;"CDP" 117;"CMP" 118;"CXP" (116,117,118);"UTP" 113;"UDP" 114;"UMP" 115;"UXP" (113,114,115);"ALA" 127;"ARG" 36;"ASN" 123;"ASP" 120;"CYS" 124;"GLN" 138;"GLU" 137;"GLY" 121;"HIS" 126;"ILE" 122;"LEU" 136;"LYS" 125;"MET" 135;"PHE" 128;"PRO" 129;"SER" 130;"THR" 131;"TRP" 132;"TYR" 133;"VAL" 134]
species = [
"GLC" experiment_data_dictionary["M_glc_D_c"].model_index;
"PYR" experiment_data_dictionary["M_pyr_c"].model_index;
"LAC" experiment_data_dictionary["M_lac_D_c"].model_index;
"AC" experiment_data_dictionary["M_ac_c"].model_index;
"SUCC" experiment_data_dictionary["M_succ_c"].model_index;
"MAL" experiment_data_dictionary["M_mal_L_c"].model_index;
"CAT" experiment_data_dictionary["CAT"].model_index;
"XXP" (experiment_data_dictionary["M_atp_c"].model_index,
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
"ATP" experiment_data_dictionary["M_atp_c"].model_index;
"ADP" experiment_data_dictionary["M_adp_c"].model_index;
"AMP" experiment_data_dictionary["M_amp_c"].model_index;
"AXP" (experiment_data_dictionary["M_atp_c"].model_index,
experiment_data_dictionary["M_adp_c"].model_index,
experiment_data_dictionary["M_amp_c"].model_index)
"GTP" experiment_data_dictionary["M_gtp_c"].model_index;
"GDP" experiment_data_dictionary["M_gdp_c"].model_index;
"GMP" experiment_data_dictionary["M_gmp_c"].model_index;
"GXP" (experiment_data_dictionary["M_gtp_c"].model_index,
experiment_data_dictionary["M_gdp_c"].model_index,
experiment_data_dictionary["M_gmp_c"].model_index)
"CTP" experiment_data_dictionary["M_ctp_c"].model_index;
"CDP" experiment_data_dictionary["M_cdp_c"].model_index;
"CMP" experiment_data_dictionary["M_cmp_c"].model_index;
"CXP" (experiment_data_dictionary["M_ctp_c"].model_index,
experiment_data_dictionary["M_cdp_c"].model_index,
experiment_data_dictionary["M_cmp_c"].model_index)
"UTP" experiment_data_dictionary["M_utp_c"].model_index;
"UDP" experiment_data_dictionary["M_udp_c"].model_index;
"UMP" experiment_data_dictionary["M_ump_c"].model_index;
"UXP" (experiment_data_dictionary["M_utp_c"].model_index,
experiment_data_dictionary["M_udp_c"].model_index,
experiment_data_dictionary["M_ump_c"].model_index)
"ALA" experiment_data_dictionary["M_ala_L_c"].model_index;
"ARG" 36;
"ASN" experiment_data_dictionary["M_asn_L_c"].model_index;
"ASP" experiment_data_dictionary["M_asp_L_c"].model_index;
"CYS" experiment_data_dictionary["M_cys_L_c"].model_index;
"GLN" experiment_data_dictionary["M_gln_L_c"].model_index;
"GLU" 136;
"GLY" experiment_data_dictionary["M_gly_L_c"].model_index;
"HIS" experiment_data_dictionary["M_his_L_c"].model_index;
"ILE" experiment_data_dictionary["M_ile_L_c"].model_index;
"LEU" experiment_data_dictionary["M_leu_L_c"].model_index;
"LYS" experiment_data_dictionary["M_lys_L_c"].model_index;
"MET" experiment_data_dictionary["M_met_L_c"].model_index;
"PHE" experiment_data_dictionary["M_phe_L_c"].model_index;
"PRO" experiment_data_dictionary["M_pro_L_c"].model_index;
"SER" experiment_data_dictionary["M_ser_L_c"].model_index;
"THR" experiment_data_dictionary["M_thr_L_c"].model_index;
"TRP" experiment_data_dictionary["M_trp_L_c"].model_index;
"TYR" experiment_data_dictionary["M_tyr_L_c"].model_index;
"VAL" experiment_data_dictionary["M_val_L_c"].model_index]

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

figure("carbon",figsize=(23,7))
figure("energy",figsize=(20,12.5))
figure("amino",figsize=(15,12.5))
figure("Glycolysis",figsize=(23,12.5))
figure("TCA",figsize=(23,12.5))
figure("PP",figsize=(23,12.5))
figure("TXTL",figsize=(23,12.5))
figure("tRNA",figsize=(23,12.5))

figure("carbon")

subplot(2,4,1)
errorbar(glc[:,1],glc[:,2],glc[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,40])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:10:40)
ylabel("Glucose (mM)")
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
axis([0,TSTOP,0,20])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:5:20)
ylabel("Lactate (mM)")
xlabel("Time (h)")

subplot(2,4,5)
errorbar(ac[:,1],ac[:,2],ac[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,50])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:10:50)
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
axis([0,TSTOP,0,10])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:2:10)
ylabel("Malate (mM)")
xlabel("Time (h)")

subplot(2,4,2)
errorbar(CAT[:,1],1000*CAT[:,2],1000*CAT[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,25])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:5:25)
ylabel("CAT (μM)")
xlabel("Time (h)")

subplot(2,4,8)
errorbar(xxp[:,1],xxp[:,2],xxp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,8])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:2:8)
ylabel("Energy Total (mM)")
xlabel("Time (h)")

#subplot(2,4,8)
#errorbar(pyr[:,1],pyr[:,2]+lac[:,2],pyr[:,3]+lac[:,3],fmt="ro",color="k",linewidth=2)
#plot(Tsim,X[:,100]+X[:,102],plot_color)
#axis([0,TSTOP,0,30])
#plt[:xticks](0:1:TSTOP)
#plt[:yticks](0:10:30)
#ylabel("PYR+LAC (mM)")
#xlabel("Time (h)")





figure("energy")

subplot(4,4,1)
errorbar(atp[:,1],atp[:,2],atp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,2])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.5:2)
ylabel("ATP (mM)")
xlabel("Time (h)")

subplot(4,4,5)
errorbar(adp[:,1],adp[:,2],adp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,.8])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.2:.8)
ylabel("ADP (mM)")
xlabel("Time (h)")

subplot(4,4,9)
errorbar(amp[:,1],amp[:,2],amp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,.5])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.1:.5)
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
axis([0,TSTOP,0,.4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.1:.4)
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
axis([0,TSTOP,0,1])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.2:1)
ylabel("CTP (mM)")
xlabel("Time (h)")

subplot(4,4,7)
errorbar(cdp[:,1],cdp[:,2],cdp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,.8])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.2:.8)
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
axis([0,TSTOP,0,.3])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.1:.3)
ylabel("UMP (mM)")
xlabel("Time (h)")

subplot(4,4,16)
errorbar(uxp[:,1],uxp[:,2],uxp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,1.5])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:.5:1.5)
ylabel("Σ UXP (mM)")
xlabel("Time (h)")





figure("amino")

subplot(5,5,1)
errorbar(ala[:,1],ala[:,2],ala[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,10])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:2:10)
ylabel("ALA (mM)")
xlabel("Time (h)")

subplot(5,5,2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("ARG (mM)")
xlabel("Time (h)")

subplot(5,5,3)
errorbar(asn[:,1],asn[:,2],asn[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("ASN (mM)")
xlabel("Time (h)")

subplot(5,5,4)
errorbar(asp[:,1],asp[:,2],asp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,3])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:TSTOP)
ylabel("ASP (mM)")
xlabel("Time (h)")

subplot(5,5,5)
errorbar(cys[:,1],cys[:,2],cys[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("CYS (mM)")
xlabel("Time (h)")

subplot(5,5,6)
errorbar(gln[:,1],gln[:,2],gln[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("GLN (mM)")
xlabel("Time (h)")

subplot(5,5,7)
axis([0,TSTOP,0,200])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:50:200)
ylabel("GLU (mM)")
xlabel("Time (h)")

subplot(5,5,8)
errorbar(gly[:,1],gly[:,2],gly[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("GLY (mM)")
xlabel("Time (h)")

subplot(5,5,9)
errorbar(his[:,1],his[:,2],his[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("HIS (mM)")
xlabel("Time (h)")

subplot(5,5,10)
errorbar(ile[:,1],ile[:,2],ile[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("ILE (mM)")
xlabel("Time (h)")

subplot(5,5,11)
errorbar(leu[:,1],leu[:,2],leu[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("LEU (mM)")
xlabel("Time (h)")

subplot(5,5,12)
errorbar(lys[:,1],lys[:,2],lys[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("LYS (mM)")
xlabel("Time (h)")

subplot(5,5,13)
errorbar(met[:,1],met[:,2],met[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("MET (mM)")
xlabel("Time (h)")

subplot(5,5,14)
errorbar(phe[:,1],phe[:,2],phe[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("PHE (mM)")
xlabel("Time (h)")

subplot(5,5,15)
errorbar(pro[:,1],pro[:,2],pro[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("PRO (mM)")
xlabel("Time (h)")

subplot(5,5,16)
errorbar(ser[:,1],ser[:,2],ser[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("SER (mM)")
xlabel("Time (h)")

subplot(5,5,17)
errorbar(thr[:,1],thr[:,2],thr[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("THR (mM)")
xlabel("Time (h)")

subplot(5,5,18)
errorbar(trp[:,1],trp[:,2],trp[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("TRP (mM)")
xlabel("Time (h)")

subplot(5,5,19)
errorbar(tyr[:,1],tyr[:,2],tyr[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,3])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:3)
ylabel("TYR (mM)")
xlabel("Time (h)")

subplot(5,5,20)
errorbar(val[:,1],val[:,2],val[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,4])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:1:4)
ylabel("VAL (mM)")
xlabel("Time (h)")

subplot(5,5,21)
errorbar(AA[:,1],AA[:,2],AA[:,3],fmt="ro",color="k",linewidth=2)
axis([0,TSTOP,0,40])
plt[:xticks](0:1:TSTOP)
plt[:yticks](0:10:40)
ylabel("Σ AA (mM)")
xlabel("Time (h)")

X_AA = vec(X[:,119]+X[:,120]+X[:,121]+X[:,122]+X[:,123]+X[:,124]+X[:,125]+X[:,126]+X[:,127]+X[:,128]+X[:,129]+X[:,130]+X[:,131]+X[:,132]+X[:,133]+X[:,134]+X[:,135]+X[:,137])
plot(Tsim,X_AA,plot_color,linewidth=1.5)




for j in 1:size(species,1)
    str = species[j,1]
    index = species[j,2]
    
    amino_ = [1 5 9 13 2 6 10 14 3 7 11 15 4 8 12 16]
    core_ = [1 3 4 5 6 7 2 8]
    
    if j < 9
        figure("carbon")
        subplot(2,4,core_[j])
    elseif j >= 9 && j < 25
        figure("energy")
        subplot(4,4,amino_[j-8])
    else
        figure("amino")
        subplot(5,5,j-8-16)
    end
    
    if typeof(index) == Int
        tmp = X[:,index]
    elseif typeof(index) == Tuple{Int,Int,Int}
        tmp = X[:,index[1]]+X[:,index[2]]+X[:,index[3]]
    elseif typeof(index) == Tuple{Int,Int,Int,Int,Int,Int,Int,Int,Int,Int,Int,Int}
        tmp = X[:,index[1]]+X[:,index[2]]+X[:,index[3]]+X[:,index[4]]+X[:,index[5]]+X[:,index[6]]+X[:,index[7]]+X[:,index[8]]+X[:,index[9]]+X[:,index[10]]+X[:,index[11]]+X[:,index[12]]
    else
        throw("Wrong type")
    end
    
    if str == "CAT"
        tmp *= 1000
    end
    
    plot(Tsim,tmp,plot_color,linewidth=1.5)
    
    tight_layout()
end





figure("Glycolysis")

subplot(3,3,1)
plot(Tsim,X[:,1],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("G6P (mM)")
xlabel("Time (h)")

subplot(3,3,2)
plot(Tsim,X[:,2],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("F6P (mM)")
xlabel("Time (h)")

subplot(3,3,3)
plot(Tsim,X[:,3],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("FDP (mM)")
xlabel("Time (h)")

subplot(3,3,4)
plot(Tsim,X[:,5],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("G3P (mM)")
xlabel("Time (h)")

subplot(3,3,5)
plot(Tsim,X[:,6],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("13DPG (mM)")
xlabel("Time (h)")

subplot(3,3,6)
plot(Tsim,X[:,7],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("3PG (mM)")
xlabel("Time (h)")

subplot(3,3,7)
plot(Tsim,X[:,8],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("2PG (mM)")
xlabel("Time (h)")

subplot(3,3,8)
plot(Tsim,X[:,101],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("PEP (mM)")
xlabel("Time (h)")

subplot(3,3,9)
plot(Tsim,X[:,11],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("ACCOA (mM)")
xlabel("Time (h)")

tight_layout()





figure("TCA")

subplot(3,3,1)
plot(Tsim,X[:,20],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("CIT (mM)")
xlabel("Time (h)")

subplot(3,3,2)
plot(Tsim,X[:,21],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("ICIT (mM)")
xlabel("Time (h)")

subplot(3,3,3)
plot(Tsim,X[:,22],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("AKG (mM)")
xlabel("Time (h)")

subplot(3,3,4)
plot(Tsim,X[:,23],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("SUCCOA (mM)")
xlabel("Time (h)")

subplot(3,3,5)
plot(Tsim,X[:,118],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("SUCC (mM)")
xlabel("Time (h)")

subplot(3,3,6)
plot(Tsim,X[:,25],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("FUM (mM)")
xlabel("Time (h)")

subplot(3,3,7)
plot(Tsim,X[:,105],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("MAL (mM)")
xlabel("Time (h)")

subplot(3,3,8)
plot(Tsim,X[:,9],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("OAA (mM)")
xlabel("Time (h)")

tight_layout()





figure("PP")

subplot(3,3,1)
plot(Tsim,X[:,12],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("6PGL (mM)")
xlabel("Time (h)")

subplot(3,3,2)
plot(Tsim,X[:,13],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("6PGC (mM)")
xlabel("Time (h)")

subplot(3,3,3)
plot(Tsim,X[:,14],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("RU5P (mM)")
xlabel("Time (h)")

subplot(3,3,4)
plot(Tsim,X[:,15],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("XU5P (mM)")
xlabel("Time (h)")

subplot(3,3,5)
plot(Tsim,X[:,16],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("R5P (mM)")
xlabel("Time (h)")

subplot(3,3,6)
plot(Tsim,X[:,17],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("S7P (mM)")
xlabel("Time (h)")

subplot(3,3,7)
plot(Tsim,X[:,18],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("E4P (mM)")
xlabel("Time (h)")

subplot(3,3,8)
plot(Tsim,X[:,19],plot_color)
#axis([0,3,0,.1])
plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("2DDG6P (mM)")
xlabel("Time (h)")

tight_layout()





figure("TXTL")

subplot(3,3,1)
plot(Tsim,1e6*X[:,72],plot_color)
axis([0,3,0,8])
plt[:xticks](0:1:3)
plt[:yticks](0:2:8)
ylabel("GENE_CAT (nM)")
xlabel("Time (h)")

subplot(3,3,2)
plot(Tsim,1e6*X[:,73],plot_color)
axis([0,3,0,100])
plt[:xticks](0:1:3)
plt[:yticks](0:20:100)
ylabel("RNAP (nM)")
xlabel("Time (h)")

subplot(3,3,3)
plot(Tsim,1e6*X[:,74],plot_color)
axis([0,3,0,8])
plt[:xticks](0:1:3)
plt[:yticks](0:2:8)
ylabel("OPEN_GENE_CAT (nM)")
xlabel("Time (h)")

subplot(3,3,4)
plot(Tsim,X[:,75],plot_color)
axis([0,3,0,0.001])
plt[:xticks](0:1:3)
plt[:yticks](0:0.0002:0.001)
ylabel("mRNA_CAT (mM)")
xlabel("Time (h)")

subplot(3,3,5)
plot(Tsim,1e6*X[:,76],plot_color)
axis([0,3,0,3])
plt[:xticks](0:1:3)
plt[:yticks](0:1:3)
ylabel("Ribosome (nM)")
xlabel("Time (h)")

subplot(3,3,6)
plot(Tsim,1e6*X[:,77],plot_color)
axis([0,3,0,3])
plt[:xticks](0:1:3)
plt[:yticks](0:1:3)
ylabel("Ribosome_START_CAT (nM)")
xlabel("Time (h)")

subplot(3,3,7)
plot(Tsim,X[:,99],plot_color)
axis([0,3,0,2])
plt[:xticks](0:1:3)
plt[:yticks](0:.5:2)
ylabel("tRNA (mM)")
xlabel("Time (h)")

subplot(3,3,8)
plot(Tsim,X[:,78]+X[:,79]+X[:,80]+X[:,81]+X[:,82]+X[:,83]+X[:,84]+X[:,85]+X[:,86]+X[:,87]+X[:,88]+X[:,89]+X[:,90]+X[:,91]+X[:,92]+X[:,93]+X[:,94]+X[:,95]+X[:,96]+X[:,97],plot_color)
axis([0,3,0,2])
plt[:xticks](0:1:3)
plt[:yticks](0:.5:2)
ylabel("AA_tRNA (mM)")
xlabel("Time (h)")      

subplot(3,3,9)
plot(Tsim,X[:,98],plot_color)
#axis([0,3,0,1e-12])
plt[:xticks](0:1:3)
#plt[:yticks](0:2e-13:1e-12)
ylabel("PROTEIN_CAT (mM)")
xlabel("Time (h)")

tight_layout()




figure("tRNA")

subplot(5,4,1)
plot(Tsim,X[:,78],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("ala_tRNA (mM)")
xlabel("Time (h)")

subplot(5,4,2)
plot(Tsim,X[:,79],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("arg_tRNA (mM)")
xlabel("Time (h)")

subplot(5,4,3)
plot(Tsim,X[:,80],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("asn_tRNA (mM)")
xlabel("Time (h)")

subplot(5,4,4)
plot(Tsim,X[:,81],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("asp_tRNA (mM)")
xlabel("Time (h)")

subplot(5,4,5)
plot(Tsim,X[:,82],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("cys_tRNA (mM)")
xlabel("Time (h)")

subplot(5,4,6)
plot(Tsim,X[:,83],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("glu_tRNA (mM)")
xlabel("Time (h)")

subplot(5,4,7)
plot(Tsim,X[:,84],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("gln_tRNA (mM)")
xlabel("Time (h)")

subplot(5,4,8)
plot(Tsim,X[:,85],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("gly_tRNA (mM)")
xlabel("Time (h)")

subplot(5,4,9)
plot(Tsim,X[:,86],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("his_tRNA (mM)")
xlabel("Time (h)")

subplot(5,4,10)
plot(Tsim,X[:,87],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("ile_tRNA (mM)")
xlabel("Time (h)")

subplot(5,4,11)
plot(Tsim,X[:,88],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("leu_tRNA (mM)")
xlabel("Time (h)")

subplot(5,4,12)
plot(Tsim,X[:,89],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("lys_tRNA (mM)")
xlabel("Time (h)")

subplot(5,4,13)
plot(Tsim,X[:,90],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("met_tRNA (mM)")
xlabel("Time (h)")

subplot(5,4,14)
plot(Tsim,X[:,91],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("phe_tRNA (mM)")
xlabel("Time (h)")

subplot(5,4,15)
plot(Tsim,X[:,92],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("pro_tRNA (mM)")
xlabel("Time (h)")

subplot(5,4,16)
plot(Tsim,X[:,93],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("ser_tRNA (mM)")
xlabel("Time (h)")

subplot(5,4,17)
plot(Tsim,X[:,94],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("thr_tRNA (mM)")
xlabel("Time (h)")

subplot(5,4,18)
plot(Tsim,X[:,95],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("trp_tRNA (mM)")
xlabel("Time (h)")

subplot(5,4,19)
plot(Tsim,X[:,96],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("tyr_tRNA (mM)")
xlabel("Time (h)")

subplot(5,4,20)
plot(Tsim,X[:,97],plot_color)
#axis([0,3,0,.1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.025:.1)
ylabel("val_tRNA (mM)")
xlabel("Time (h)")

tight_layout()

#include("PlotFluxPYR.jl")





figure("OxPhos",figsize=(23,7))

subplot(2,4,1)
plot(Tsim,X[:,145],plot_color)
#axis([0,3,0,1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.25:1)
ylabel("NAD (mM)")
xlabel("Time (h)")

subplot(2,4,2)
plot(Tsim,X[:,146],plot_color)
#axis([0,3,0,1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.25:1)
ylabel("NADH (mM)")
xlabel("Time (h)")

subplot(2,4,3)
plot(Tsim,X[:,147],plot_color)
#axis([0,3,0,1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.25:1)
ylabel("NADP (mM)")
xlabel("Time (h)")

subplot(2,4,4)
plot(Tsim,X[:,148],plot_color)
#axis([0,3,0,1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.25:1)
ylabel("NADPH (mM)")
xlabel("Time (h)")

subplot(2,4,5)
plot(Tsim,X[:,24],plot_color)
#axis([0,3,0,1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.25:1)
ylabel("q8 (mM)")
xlabel("Time (h)")

subplot(2,4,6)
plot(Tsim,X[:,26],plot_color)
#axis([0,3,0,1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.25:1)
ylabel("q8h2 (mM)")
xlabel("Time (h)")

subplot(2,4,7)
plot(Tsim,X[:,29],plot_color)
#axis([0,3,0,1])
#plt[:xticks](0:1:3)
#plt[:yticks](0:.25:1)
ylabel("h_e (mM)")
xlabel("Time (h)")

tight_layout()






#num_flux = convert(Int64,readcsv("flux/num_flux")[1])

#freq = 50
#flux_array = readcsv("flux/$freq")

#for i in 2*freq:freq:num_flux
#    flux = readcsv("flux/$i")
#    flux_array = [flux_array flux]
#end

#flux_array = sortrows(flux_array')' # This sorts the columns of flux_array, in case timepoints are out of order

#Tsim = vec(flux_array[1,:])
#flux_array = flux_array[2:end,:]

#figure("PYR",figsize=(23,12.5))
#subplot(5,5,1)
#title("18: produces")
#plot(Tsim,vec(flux_array[18,:]),plot_color)
#subplot(5,5,2)
#title("21: consumes")
#plot(Tsim,vec(flux_array[21,:]),plot_color)
#subplot(5,5,3)
#title("22: consumes")
#plot(Tsim,vec(flux_array[22,:]),plot_color)
#subplot(5,5,4)
#title("38: produces")
#plot(Tsim,vec(flux_array[38,:]),plot_color)
#subplot(5,5,5)
#title("65: produces")
#plot(Tsim,vec(flux_array[65,:]),plot_color)
#subplot(5,5,6)
#title("66: produces")
#plot(Tsim,vec(flux_array[66,:]),plot_color)
#subplot(5,5,7)
#title("74: consumes")
#plot(Tsim,vec(flux_array[74,:]),plot_color)
#subplot(5,5,8)
#title("75: produces")
#plot(Tsim,vec(flux_array[75,:]),plot_color)
#subplot(5,5,9)
#title("76: consumes")
#plot(Tsim,vec(flux_array[76,:]),plot_color)
#subplot(5,5,10)
#title("77: consumes")
#plot(Tsim,vec(flux_array[77,:]),plot_color)
#subplot(5,5,11)
#title("90: consumes")
#plot(Tsim,vec(flux_array[90,:]),plot_color)
#subplot(5,5,12)
#title("91: consumes 2 units")
#plot(Tsim,vec(flux_array[91,:]),plot_color)
#subplot(5,5,13)
#title("92: produces")
#plot(Tsim,vec(flux_array[92,:]),plot_color)
#subplot(5,5,14)
#title("93: produces")
#plot(Tsim,vec(flux_array[93,:]),plot_color)
#subplot(5,5,15)
#title("98: produces")
#plot(Tsim,vec(flux_array[98,:]),plot_color)
#subplot(5,5,16)
#title("100: consumes 2 units")
#plot(Tsim,vec(flux_array[100,:]),plot_color)
#subplot(5,5,17)
#title("111: consumes")
#plot(Tsim,vec(flux_array[111,:]),plot_color)
#subplot(5,5,18)
#title("113: produces")
#plot(Tsim,vec(flux_array[113,:]),plot_color)
#subplot(5,5,19)
#title("114: consumes")
#plot(Tsim,vec(flux_array[114,:]),plot_color)
#subplot(5,5,20)
#title("115: produces")
#plot(Tsim,vec(flux_array[115,:]),plot_color)
#subplot(5,5,21)
#title("117: produces")
#plot(Tsim,vec(flux_array[117,:]),plot_color)
#subplot(5,5,22)
#title("118: produces")
#plot(Tsim,vec(flux_array[118,:]),plot_color)
#subplot(5,5,23)
#title("119: produces")
#plot(Tsim,vec(flux_array[119,:]),plot_color)
#subplot(5,5,24)
#title("128: produces")
#plot(Tsim,vec(flux_array[128,:]),plot_color)
#subplot(5,5,25)
#title("Net")
#plot(Tsim,vec(flux_array[18,:]-flux_array[21,:]-flux_array[22,:]+flux_array[38,:]+flux_array[65,:]+flux_array[66,:]-flux_array[74,:]+flux_array[75,:]-flux_array[76,:]-flux_array[77,:]-flux_array[90,:]-2*flux_array[91,:]+flux_array[92,:]+flux_array[93,:]+flux_array[98,:]-2*flux_array[110,:]-flux_array[112,:]+flux_array[113,:]-flux_array[114,:]+flux_array[115,:]+flux_array[117,:]+flux_array[118,:]+flux_array[119,:]+flux_array[128,:]),plot_color)
#tight_layout()
