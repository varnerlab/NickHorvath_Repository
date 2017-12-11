CI = readdlm("Flux/CI")/3
CI_NC = readdlm("Flux/CI_NC")/3.0
CI_1 = readdlm("Flux/CI_1")/1.0
CI_2 = readdlm("Flux/CI_2")/(3.0-1.0)
ref_val_control = CI[1]
ref_val_phases = CI_1[1]

ci = CI/ref_val_control
ci_nc = CI_NC/ref_val_control
ci_1 = CI_1/ref_val_phases
ci_2 = CI_2/ref_val_phases
writedlm("Flux/ci",ci)
writedlm("Flux/ci_nc",ci_nc)
writedlm("Flux/ci_1",ci_1)
writedlm("Flux/ci_2",ci_2)

indices = [
1,
[23 24],
[2 3],
[16 17],
20,
19,
18,
22,
[73 74],
21,
#86,
#[80 83 97 113 119 133 138 139 142 151],
#57,
#58,
[12 13],
18,
45,
55,
[68 69],
181,
collect(185:204),
161,
160,
162,
184
]

reactions = [
"glk"
"zwf"
"pgi"
"eno"
"ppc"
"pck"
"pyk"
"pps"
"ldh"
"pdh"
"pgk"
"pyk"
"sucCD"
"ox phos"
"ackA"
"mRNA"
"tRNA"
"CTP"
"UTP"
"GTP"
"Protein"]

weights = [
1,
[1 -1],
[1 -1],
[1 -1],
1,
1,
1,
1,
[1 -1],
1,
#1,
#[1 2 1 1 1 1 1 1 1 1],
#1,
#1,
[1 -1],
1,
1,
1,
[1 -1],
176,
2*[15 5 10 12 5 12 13 10 12 9 13 12 9 20 7 10 13 5 11 16],
1,
1,
1,
438
]

Fluxes_with_control = zeros(length(indices),1)
Fluxes_without_control = zeros(length(indices),1)
Fluxes_first_phase = zeros(length(indices),1)
Fluxes_second_phase = zeros(length(indices),1)
for i in 1:length(indices)
	Fluxes_with_control[i] = sum(ci[indices[i]].*weights[i])
	Fluxes_without_control[i] = sum(ci_nc[indices[i]].*weights[i])
	Fluxes_first_phase[i] = sum(ci_1[indices[i]].*weights[i])
	Fluxes_second_phase[i] = sum(ci_2[indices[i]].*weights[i])
end

a = round([Fluxes_first_phase Fluxes_second_phase],2)
for i in 1:length(a)
	if abs(a[i]) > 0.1
		a[i] = round(a[i],1)
	end
end

b = round([Fluxes_with_control Fluxes_without_control],2)
for i in 1:length(b)
	if abs(b[i]) > 0.1
		b[i] = round(b[i],1)
	end
end






