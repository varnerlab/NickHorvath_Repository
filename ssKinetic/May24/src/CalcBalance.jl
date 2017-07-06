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

carbon_consumption_first = abs(glc+arg+asp+gly+asn+cys+lys+his+phe+ser+thr+trp+val+met+leu+glu)

CAT_carbon_first = round(CAT/carbon_consumption_first*100)
AA_carbon_first = round((ala+gln+ile+pro+tyr)/carbon_consumption_first*100)
org_carbon_first = round((pyr+lac+ac+succ+mal)/carbon_consumption_first*100)
other_carbon_first = round(100-CAT_carbon_first-AA_carbon_first-org_carbon_first)

glc = (X[112,100]-X[1,100])*21

energy_consumption_first = abs(glc)

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

CAT_energy_first = round(CAT/energy_consumption_first*100)
AA_energy_first = round((ala+gln+ile+pro+tyr)/energy_consumption_first*100)
org_energy_first = round((pyr+lac+ac+succ+mal)/energy_consumption_first*100)
other_energy_first = round(100-CAT_energy_first-AA_energy_first-org_energy_first)

#-----------------------------------------------------------------------------------
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

carbon_consumption_second = abs(pyr+lac+succ+mal+arg+asp+gly+ile+asn+cys+lys+his+phe+thr+trp+tyr+val+met+leu+glu)

CAT_carbon_second = round(CAT/carbon_consumption_second*100)
AA_carbon_second = round((ala+gln+pro+ser)/carbon_consumption_second*100)
org_carbon_second = round(ac/carbon_consumption_second*100)
other_carbon_second = round(100-CAT_carbon_second-AA_carbon_second-org_carbon_second)

pyr = (X[301,102]-X[112,102])*8
lac = (X[301,104]-X[112,104])*9.5
succ= (X[301,118]-X[112,118])*11.5
mal = (X[301,105]-X[112,105])*10.5

energy_consumption_second = abs(pyr+lac+succ+mal)

CAT_ATP_number = 2196
CAT = (X[301,98]-X[112,98])*CAT_ATP_number

ala = (X[301,126]-X[112,126])*9.5
gln = (X[301,137]-X[112,137])*16.5
pro = (X[301,128]-X[112,128])*19.5
ser = (X[301,129]-X[112,129])*9

ac  = (X[301,103]-X[112,103])*5.5

CAT_energy_second = round(CAT/energy_consumption_second*100)
AA_energy_second = round((ala+gln+pro+ser)/energy_consumption_second*100)
org_energy_second = round((ac)/energy_consumption_second*100)
other_energy_second = round(100-CAT_energy_second-AA_energy_second-org_energy_second)

#-----------------------------------------------------------------------------------
CAT = (X[301,98]-X[1,98])*1175
glc = (X[301,100]-X[1,100])*6

pyr = (X[301,102]-X[1,102])*3
lac = (X[301,104]-X[1,104])*3
ac  = (X[301,103]-X[1,103])*2
succ= (X[301,118]-X[1,118])*4
mal = (X[301,105]-X[1,105])*4

ala = (X[301,126]-X[1,126])*3
gln = (X[301,137]-X[1,137])*5
arg = (X[301,36]-X[1,36])*6
asp = (X[301,119]-X[1,119])*4
gly = (X[301,120]-X[1,120])*2
ile = (X[301,121]-X[1,121])*6
asn = (X[301,122]-X[1,122])*4
cys = (X[301,123]-X[1,123])*3
lys = (X[301,124]-X[1,124])*6
his = (X[301,125]-X[1,125])*6
phe = (X[301,127]-X[1,127])*9
pro = (X[301,128]-X[1,128])*5
ser = (X[301,129]-X[1,129])*3
thr = (X[301,130]-X[1,130])*4
trp = (X[301,131]-X[1,131])*11
tyr = (X[301,132]-X[1,132])*9
val = (X[301,133]-X[1,133])*5
met = (X[301,134]-X[1,134])*5
leu = (X[301,135]-X[1,135])*6
glu = (X[301,136]-X[1,136])*5

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

carbon_consumption_total = abs(glc+glu+lys+asp+asn+thr+leu+trp+gly+cys+val+phe+ser+met+arg+his+tyr)

CAT_carbon_total = round(CAT/carbon_consumption_total*100)
AA_carbon_total = round((ala+gln+ile+pro)/carbon_consumption_total*100)
org_carbon_total = round((pyr+lac+ac+succ+mal)/carbon_consumption_total*100)
other_carbon_total = round(100-CAT_carbon_total-AA_carbon_total-org_carbon_total)

glc = (X[112,100]-X[1,100])*21

energy_consumption_total = abs(glc)

CAT_ATP_number = 2196
CAT = (X[301,98]-X[1,98])*CAT_ATP_number

ala = (X[301,126]-X[1,126])*9.5
gln = (X[301,137]-X[1,137])*16.5
pro = (X[301,128]-X[1,128])*19.5
ser = (X[301,129]-X[1,129])*9

ac  = (X[301,103]-X[1,103])*5.5

CAT_energy_total = round(CAT/energy_consumption_total*100)
AA_energy_total = round((ala+gln+ile+pro)/energy_consumption_total*100)
org_energy_total = round((pyr+lac+ac+succ+mal)/energy_consumption_total*100)
other_energy_total = round(100-CAT_energy_total-AA_energy_total-org_energy_total)

#-----------------------------------------------------------------------------------
Carbon = [["Carbon" "First" "Second" "Total"];[["CAT";"AA";"org";"other"] [CAT_carbon_first;AA_carbon_first;org_carbon_first;other_carbon_first] [CAT_carbon_second;AA_carbon_second;org_carbon_second;other_carbon_second] [CAT_carbon_total;AA_carbon_total;org_carbon_total;other_carbon_total]]]

Energy = [["Energy" "First" "Second" "Total"];[["CAT";"AA";"org";"other"] [CAT_energy_first;AA_energy_first;org_energy_first;other_energy_first] [CAT_energy_second;AA_energy_second;org_energy_second;other_energy_second] [CAT_energy_total;AA_energy_total;org_energy_total;other_energy_total]]]





