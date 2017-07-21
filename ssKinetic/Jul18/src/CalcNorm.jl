function CalcNorm(X)
data_species = [100;98;106;107;108;115;116;117;109;110;111;
112;113;114;104;103;102;118;105;119;120;121;122;123;124;125;
126;137;127;128;129;130;131;132;133;134;135]

X_orig = readdlm("X_orig")
X_diff = X[:,data_species]-X_orig[:,data_species]
#X_diff ./= sum(X_diff,1)
X_diff[:,2] .*= 500

return norm(X_diff)
end
