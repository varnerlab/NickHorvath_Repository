function ATP_coefficients()

Coefficients = Dict()

# Amino acids
Coefficients["glu"] = 15.5
Coefficients["gln"] = 16.5
Coefficients["ala"] = 9.5
Coefficients["asp"] = 10.5
Coefficients["asn"] = 12.5
Coefficients["arg"] = 25.5
Coefficients["ser"] = 9
Coefficients["cys"] = 10
Coefficients["gly"] = 9
Coefficients["his"] = 21.5
Coefficients["thr"] = 15.5
Coefficients["ile"] = 26.5
Coefficients["leu"] = 24
Coefficients["lys"] = 25
Coefficients["met"] = 17.5
Coefficients["phe"] = 38
Coefficients["pro"] = 19.5
Coefficients["trp"] = 48
Coefficients["tyr"] = 36.5
Coefficients["val"] = 19

# Glycolysis
Coefficients["glc"] = 21
Coefficients["g6p"] = 22
Coefficients["f6p"] = 22
Coefficients["fdp"] = 23
Coefficients["dhap"] = 11.5
Coefficients["g3p"] = 11.5
Coefficients["13dpg"] = 10
Coefficients["3pg"] = 9
Coefficients["2pg"] = 9
Coefficients["pep"] = 9
Coefficients["pyr"] = 8
Coefficients["accoa"] = 6.5

# TCA cycle
Coefficients["oaa"] = 9
Coefficients["cit"] = 15.5
Coefficients["icit"] = 15.5
Coefficients["akg"] = 14
Coefficients["succoa"] = 12.5
Coefficients["succ"] = 11.5
Coefficients["fum"] = 10.5
Coefficients["mal"] = 10.5
Coefficients["glx"] = 4

# Entner-Doudoroff pathway
Coefficients["6pgl"] = 20.5
Coefficients["6pgc"] = 20.5
Coefficients["2ddg6p"] = 20.5

# Pentose phosphate pathway
Coefficients["ru5p"] = 19
Coefficients["xu5p"] = 19
Coefficients["r5p"] = 19
Coefficients["s7p"] = 26.5
Coefficients["e4p"] = 16

# Other
Coefficients["actp"] = 6.5
Coefficients["ac"] = 5.5
Coefficients["etoh"] = 9.5
Coefficients["lac"] = 9.5
Coefficients["formate"] = 1.5
Coefficients["mql8"] = 1.5
Coefficients["chor"] = 36.5

# Transcription, translation
Coefficients["mRNA"] = 2*(176+144+151+189)
Coefficients["CAT"] = 2*219+438

return Coefficients
end
