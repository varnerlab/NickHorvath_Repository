#Ala=C3;Arg=C6;Asn=C4;Asp=C4;Cys=C3;Gln=C5;Glu=C5;Gly=C2;His=C6;Ile=C6;Leu=C6;Lys=C6;Met=C5;Phe=C9;Pro=C5;Ser=C3;Thr=C4;Trp=C11;Tyr=C9;Val=C5
X = readdlm("Best/X")

CAT = (X[301,98]-X[112,98])*1175
glc = (X[301,100]-X[112,100])*6

pyr = (X[301,102]-X[112,102])*3
lac = (X[301,104]-X[112,104])*3
ac  = (X[301,103]-X[112,103])*2
succ= (X[301,118]-X[112,118])*4
mal = (X[301,105]-X[112,105])*4

ala = (X[301,126]-X[112,126])*3
gln = (X[301,137]-X[112,137])*5
arg = (X[301,36]-X[112,36])*6
asp = (X[301,119]-X[112,119])*4
gly = (X[301,120]-X[112,120])*2
ile = (X[301,121]-X[112,121])*6
asn = (X[301,122]-X[112,122])*4
cys = (X[301,123]-X[112,123])*3
lys = (X[301,124]-X[112,124])*6
his = (X[301,125]-X[112,125])*6
phe = (X[301,127]-X[112,127])*9
pro = (X[301,128]-X[112,128])*5
ser = (X[301,129]-X[112,129])*3
thr = (X[301,130]-X[112,130])*4
trp = (X[301,131]-X[112,131])*11
tyr = (X[301,132]-X[112,132])*9
val = (X[301,133]-X[112,133])*5
met = (X[301,134]-X[112,134])*5
leu = (X[301,135]-X[112,135])*6
glu = (X[301,136]-X[112,136])*5

List = [
CAT "CAT"
glc "glc"
pyr "pyr"
lac "lac"
ac "ac"
succ "succ"
mal "mal"
ala "ala"
gln "gln"
arg "arg"
asp "asp"
gly "gly"
ile "ile"
asn "asn"
cys "cys"
lys "lys"
his "his"
phe "phe"
pro "pro"
ser "ser"
thr "thr"
trp "trp"
tyr "tyr"
val "val"
met "met"
leu "leu"
glu "glu"
]

sortrows(List)

#total_carbon_consumption = glc+arg+asp+gly+ile+asn+cys+lys+his+phe+pro+ser+thr+trp+tyr+val+met+leu+glu
total_carbon_consumption = abs(pyr+lac+succ+mal+arg+asp+gly+ile+asn+cys+lys+his+phe+thr+trp+tyr+val+met+leu+glu)

CAT_percent = round(CAT/total_carbon_consumption*100)
AA_percent = round((ala+gln+pro+ser)/total_carbon_consumption*100)
org_percent = round(ac/total_carbon_consumption*100)
other_percent = round(100-CAT_percent-AA_percent-org_percent)

#CAT_percent = 6
#AA_percent = 11
#org_percent = 31
#other_percent = 52





#succ = 11.5*atp
#mal = 10.5*atp
#ac = 5.5*atp
#lac = 9.5*atp
#gln = 16.5*atp
#ala = 9.5*atp

#glc = (X[301,100]-X[301,100])*21
pyr = (X[301,102]-X[112,102])*8
lac = (X[301,104]-X[112,104])*9.5
succ= (X[301,118]-X[112,118])*11.5
mal = (X[301,105]-X[112,105])*10.5

total_energy_consumption = abs(pyr+lac+succ+mal)

#CAT_ATP_number = 5337
CAT_ATP_number = 2196
CAT = (X[301,98]-X[112,98])*CAT_ATP_number

ala = (X[301,126]-X[112,126])*9.5
gln = (X[301,137]-X[112,137])*16.5
pro = (X[301,128]-X[112,128])*19.5
ser = (X[301,129]-X[112,129])*9

ac  = (X[301,103]-X[112,103])*5.5

CAT_percent = round(CAT/total_energy_consumption*100)
AA_percent = round((ala+gln+pro+ser)/total_energy_consumption*100)
org_percent = round((ac)/total_energy_consumption*100)
other_percent = round(100-CAT_percent-AA_percent-org_percent)

# ~540 proteins/mRNA; BN 104186

#CAT_percent = 6
#AA_percent = 18
#org_percent = 49
#other_percent = 27







