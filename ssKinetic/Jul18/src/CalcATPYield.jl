num_flux = convert(Int64,readcsv("flux/num_flux")[1])
freq = 1
flux_array = readcsv("flux/$freq")
for i in 2*freq:freq:num_flux
    flux = readcsv("flux/$i")
    flux_array = [flux_array flux]
end
flux_array = sortrows(flux_array')' # Sort columns of flux_array, if timepoints are out of order
Tsim = vec(flux_array[1,:])
flux_array = flux_array[2:end,:]

atp_production = flux_array[12,:]+flux_array[18,:]+flux_array[45,:]+flux_array[55,:]+flux_array[68,:]+2*flux_array[102,:]+flux_array[109,:]

cumulative_atp_production = [0;cumsum(.5*(Tsim[2:end]-Tsim[1:end-1]).*(atp_production[2:end]+atp_production[1:end-1]))]

find((Tsim.>1.1095)&(Tsim.<1.1105)) # 10644
ATP_first = cumulative_atp_production[10644]
ATP_second = cumulative_atp_production[end]-cumulative_atp_production[10644]

atp_breakdown_array = [["pgk";"pyk";"sucCD";"atp";"ackA";"asn_deg";"thr_deg3"] [flux_array[12,:]';flux_array[18,:]';flux_array[45,:]';flux_array[55,:]';flux_array[68,:]';2*flux_array[102,:]';flux_array[109,:]']]

atp_breakdown = [["pgk";"pyk";"sucCD";"atp";"ackA";"asn_deg";"thr_deg3"] zeros(7,2)]
for i in 1:size(atp_breakdown,1)
	tmp = atp_breakdown_array[i,2:end]
	tmp_cumulative = [0;cumsum(.5*(Tsim[2:end]-Tsim[1:end-1]).*(tmp[2:end]+tmp[1:end-1]))]
	atp_breakdown[i,2] = tmp_cumulative[10644]
	atp_breakdown[i,3] = tmp_cumulative[end]-tmp_cumulative[10644]
end

atp_breakdown = [atp_breakdown;["sum" sum(atp_breakdown[:,2]) sum(atp_breakdown[:,3])]]

atp_breakdown = [atp_breakdown 100*atp_breakdown[:,2]/atp_breakdown[end,2] 100*atp_breakdown[:,3]/atp_breakdown[end,3]]

X = readdlm("Best/X")
CAT = X[:,98]
GLC = X[:,100]
PYR = X[:,102]
LAC = X[:,104]
SUCC = X[:,118]
MAL = X[:,105]
mRNA = X[:,75]

CAT_first = CAT[112]-CAT[1]
mRNA_first = mRNA[112]-mRNA[1]
GLC_first = GLC[112]-GLC[1]

CAT_second = CAT[301]-CAT[112]
mRNA_second = mRNA[301]-mRNA[112]
PYR_second = PYR[301]-PYR[112]
LAC_second = LAC[301]-LAC[112]
SUCC_second = SUCC[301]-SUCC[112]
MAL_second = MAL[301]-MAL[112]

transcription_coeff = 2*(176+144+151+189)
translation_coeff = 2*219+438

ATP_yield_first = ATP_first/-GLC_first # 4.94
ATP_yield_second = ATP_second/-(PYR_second+LAC_second+SUCC_second+MAL_second) # 6.52

efficiency_first = (transcription_coeff*mRNA_first+translation_coeff*CAT_first)/ATP_first # 6.2%
efficiency_second = (transcription_coeff*mRNA_second+translation_coeff*CAT_second)/ATP_second # 4.3%

efficiency = (transcription_coeff*mRNA_first+translation_coeff*CAT_first+transcription_coeff*mRNA_second+translation_coeff*CAT_second)/(ATP_first+ATP_second) # 5.3%








# Mike's:

transcription = 0.00515
translation = 0.0116

qGlc = 33.73
atp_yield = 4

(transcription_coeff*transcription+translation_coeff*translation)/(qGlc*atp_yield)















