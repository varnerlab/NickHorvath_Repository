#Ala=C3;Arg=C6;Asn=C4;Asp=C4;Cys=C3;Gln=C5;Glu=C5;Gly=C2;His=C6;Ile=C6;Leu=C6;Lys=C6;Met=C5;Phe=C9;Pro=C5;Ser=C3;Thr=C4;Trp=C11;Tyr=C9;Val=C5
X = readdlm("Best/X")

CAT = (X[112,98]-X[1,98])*1175
glc = (X[112,100]-X[1,100])*6

pyr = (X[112,102]-X[1,102])*3
lac = (X[112,104]-X[1,104])*3
ac  = (X[112,103]-X[1,103])*2
succ= (X[112,118]-X[1,118])*4
mal = (X[112,105]-X[1,105])*4

ala = (X[112,126]-X[1,126])*3
gln = (X[112,137]-X[1,137])*5
arg = (X[112,36]-X[1,36])*6
asp = (X[112,119]-X[1,119])*4
gly = (X[112,120]-X[1,120])*2
ile = (X[112,121]-X[1,121])*6
asn = (X[112,122]-X[1,122])*4
cys = (X[112,123]-X[1,123])*3
lys = (X[112,124]-X[1,124])*6
his = (X[112,125]-X[1,125])*6
phe = (X[112,127]-X[1,127])*9
pro = (X[112,128]-X[1,128])*5
ser = (X[112,129]-X[1,129])*3
thr = (X[112,130]-X[1,130])*4
trp = (X[112,131]-X[1,131])*11
tyr = (X[112,132]-X[1,132])*9
val = (X[112,133]-X[1,133])*5
met = (X[112,134]-X[1,134])*5
leu = (X[112,135]-X[1,135])*6
glu = (X[112,136]-X[1,136])*5

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
total_carbon_consumption = abs(glc+arg+asp+gly+asn+cys+lys+his+phe+ser+thr+trp+val+met+leu+glu)

CAT_percent = round(CAT/total_carbon_consumption*100)
AA_percent = round((ala+ile+tyr+gln+pro)/total_carbon_consumption*100)
org_percent = round((pyr+lac+ac+succ+mal)/total_carbon_consumption*100)
other_percent = round(100-CAT_percent-AA_percent-org_percent)

#CAT_percent = 5
#AA_percent = 4
#org_percent = 39
#other_percent = 52





#succ = 11.5*atp
#mal = 10.5*atp
#ac = 5.5*atp
#lac = 9.5*atp
#gln = 16.5*atp
#ala = 9.5*atp

glc = (X[112,100]-X[1,100])*21

total_energy_from_glucose = abs(glc)

#CAT_ATP_number = 5337
CAT_ATP_number = 2196
CAT = (X[112,98]-X[1,98])*CAT_ATP_number


ala = (X[112,126]-X[1,126])*9.5
gln = (X[112,137]-X[1,137])*16.5
ile = (X[112,121]-X[1,121])*26.5
pro = (X[112,128]-X[1,128])*19.5
tyr = (X[112,132]-X[1,132])*36.5

pyr = (X[112,102]-X[1,102])*8
lac = (X[112,104]-X[1,104])*9.5
ac  = (X[112,103]-X[1,103])*5.5
succ= (X[112,118]-X[1,118])*11.5
mal = (X[112,105]-X[1,105])*10.5

CAT_percent = round(CAT/total_energy_from_glucose*100)
AA_percent = round((ala+ile+tyr+gln+pro)/total_energy_from_glucose*100)
org_percent = round((pyr+lac+ac+succ+mal)/total_energy_from_glucose*100)
other_percent = round(100-CAT_percent-AA_percent-org_percent)

# ~540 proteins/mRNA; BN 104186

#CAT_percent = 3
#AA_percent = 4
#org_percent = 41
#other_percent = 52







