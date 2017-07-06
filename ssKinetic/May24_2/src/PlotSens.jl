using PyPlot
using PyCall

@pyimport matplotlib.patches as patches

number_of_cols = 10
number_of_rows = 20

# what are my colors?
color_2 = (1/255)*[255,238,225] # light red
color_1 = (1/255)*[255,99,71] # red

#color_2 = (1/255)*[235,248,255] # light blue
#color_1 = (1/255)*[0,200,255] # blue

# load data array -
#raw_data_array = readdlm("Sens/Prod")
raw_data_array = readdlm("Sens/State")
diagonal_array = diagm(diag(raw_data_array))
raw_data_array = raw_data_array - diagonal_array;

# decompose -
(D,V) = eig(raw_data_array)

# what are the big eigenvalues?
idx_eigenvalues = sortperm(abs(D),rev=true)
#D_percentage = convert(Array{Int64,1},round(abs(D)/sum(abs(D))*100))
D_percentage = convert(Array{Float64,1},round(abs(D)/sum(abs(D))*100000)/1000)
top_percentage = D_percentage[idx_eigenvalues[1:number_of_cols]]

# grab the top eigenvectors -
top_eigenvectors = abs(V[:,idx_eigenvalues[1:number_of_cols]])

# sort by the biggest -
weighted_by_eigenvalues = zeros(size(V,1),1)
for i in 1:length(weighted_by_eigenvalues)
  weighted_by_eigenvalues[i] = sum(abs(V[i,:]).*abs(D)')
end
idx_eigenvectors = sortperm(vec(weighted_by_eigenvalues),rev=true)
#idx_eigenvectors = sortperm(top_eigenvectors[:,1],rev=true)
top_idx = idx_eigenvectors[1:number_of_rows]
rxns = ["R_glk_atp";"R_pgi";"R_pgi_R";"R_pfk";"R_fdp";"R_fbaA";"R_fbaA_R";"R_tpiA";"R_tpiA_R";"R_gapA";"R_gapA_R";"R_pgk";"R_pgk_R";"R_gpm";"R_gpm_R";"R_eno";"R_eno_R";"R_pyk";"R_pck";"R_ppc";"R_pdh";"R_pps";"R_zwf";"R_zwf_R";"R_pgl";"R_gnd";"R_rpe";"R_rpe_R";"R_rpi";"R_rpi_R";"R_talAB";"R_talAB_R";"R_tkt1";"R_tkt1_R";"R_tkt2";"R_tkt2_R";"R_edd";"R_eda";"R_gltA";"R_acn";"R_acn_R";"R_icd";"R_icd_R";"R_sucAB";"R_sucCD";"R_sdh";"R_frd";"R_fum";"R_fum_R";"R_mdh";"R_mdh_R";"R_cyd";"R_cyo";"R_app";"R_atp";"R_nuo";"R_pnt1";"R_pnt2";"R_ndh1";"R_ndh2";"R_ppa";"R_aceA";"R_aceB";"R_maeA";"R_maeB";"R_pta";"R_pta_R";"R_ackA";"R_ackA_R";"R_acs";"R_adhE";"R_adhE_R";"R_ldh";"R_ldh_R";"R_pflAB";"R_alaAC";"R_alaAC_R";"R_arg";"R_aspC";"R_asnB";"R_asnA";"R_cysEMK";"R_gltBD";"R_gdhA";"R_gdhA_R";"R_glnA";"R_glyA";"R_his";"R_ile";"R_leu";"R_lys";"R_met";"R_phe";"R_pro";"R_serABC";"R_thr";"R_trp";"R_tyr";"R_val";"R_arg_deg";"R_asp_deg";"R_asn_deg";"R_gly_deg";"R_mglx_deg";"R_ser_deg";"R_pro_deg";"R_thr_deg1";"R_thr_deg2";"R_thr_deg3";"R_trp_deg";"R_cys_deg";"R_lys_deg";"R_gln_deg";"R_glu_deg";"R_gaba_deg1";"R_gaba_deg2";"R_chor";"R_fol_e";"R_fol_1";"R_fol_2a";"R_fol_2b";"R_fol_3";"R_fol_4";"R_gly_fol";"R_gly_fol_R";"R_mthfd";"R_mthfd_R";"R_mthfc";"R_mthfc_R";"R_mthfr2a";"R_mthfr2b";"R_prpp_syn";"R_or_syn_1";"R_or_syn_2";"R_omp_syn";"R_ump_syn";"R_ctp_1";"R_ctp_2";"R_A_syn_1";"R_A_syn_2";"R_A_syn_3";"R_A_syn_4";"R_A_syn_5";"R_A_syn_6";"R_A_syn_7";"R_A_syn_8";"R_A_syn_9";"R_A_syn_10";"R_A_syn_12";"R_xmp_syn";"R_gmp_syn";"R_atp_amp";"R_utp_ump";"R_ctp_cmp";"R_gtp_gmp";"R_atp_adp";"R_utp_adp";"R_ctp_adp";"R_gtp_adp";"R_udp_utp";"R_cdp_ctp";"R_gdp_gtp";"R_atp_ump";"R_atp_cmp";"R_atp_gmp";"R_adk_atp";"Import_o2";"Import_co2";"Import_pi";"Import_nh4";"Import_so4";"Import_h2o";"Export_o2";"Export_co2";"Export_pi";"Export_nh4";"Export_so4";"Export_h2o";"Proton_gradient";"transcriptional_initiation_CAT";"transcription_CAT";"mRNA_degradation_CAT";"translation_initiation_CAT";"translation_CAT";"tRNA_charging_M_ala_L_c_CAT";"tRNA_charging_M_arg_L_c_CAT";"tRNA_charging_M_asn_L_c_CAT";"tRNA_charging_M_asp_L_c_CAT";"tRNA_charging_M_cys_L_c_CAT";"tRNA_charging_M_glu_L_c_CAT";"tRNA_charging_M_gln_L_c_CAT";"tRNA_charging_M_gly_L_c_CAT";"tRNA_charging_M_his_L_c_CAT";"tRNA_charging_M_ile_L_c_CAT";"tRNA_charging_M_leu_L_c_CAT";"tRNA_charging_M_lys_L_c_CAT";"tRNA_charging_M_met_L_c_CAT";"tRNA_charging_M_phe_L_c_CAT";"tRNA_charging_M_pro_L_c_CAT";"tRNA_charging_M_ser_L_c_CAT";"tRNA_charging_M_thr_L_c_CAT";"tRNA_charging_M_trp_L_c_CAT";"tRNA_charging_M_tyr_L_c_CAT";"tRNA_charging_M_val_L_c_CAT"]
top_rxns = rxns[top_idx][end:-1:1]
data_slice = top_eigenvectors[top_idx,:]

# add an extra col for colorbar -
colorbar_col = vec(transpose(linspace(0,1,number_of_rows)))

# main drawing loop -
for col_index = 1:number_of_cols

  Z = data_slice[:,col_index]

  # scale Z -
  Z = abs(Z)
  min_value = minimum(Z)
  max_value = maximum(Z)

  if (min_value == max_value)
    data_scaled = 0.0
  else
    data_scaled = (Z-min_value)./(max_value - min_value)
  end



  # how many patches per col?
  number_of_patches = length(data_scaled)
  epsilon = 0.2;
  ax = gca()
  for row_index = 1:number_of_patches

    origin_point = [(col_index - 1)+(col_index - 1)*epsilon + 1,(row_index - 1)+(row_index - 1)*epsilon+1];

    # compute color -


    # what color?
    fraction = (data_scaled[row_index]^2)/(0.15+data_scaled[row_index]^2)
    color_value = fraction*color_1+(1-fraction)*color_2


    # draw the square -
    ax[:add_patch](

               patches.Rectangle(origin_point,   # (x,y)
                   1.0,          # width
                   1.0,          # height
                   facecolor=color_value,
                   edgecolor="grey",
                   linewidth=0.5,
               )
           )


  end
end

# add the colorbar -
for col_index = 1:1

  Z = colorbar_col

  # scale Z -
  Z = abs(Z)
  min_value = minimum(Z)
  max_value = maximum(Z)
  data_scaled = (Z-min_value)./(max_value - min_value)

  # how many patches per col?
  number_of_patches = length(data_scaled)
  epsilon = 0.2;
  ax = gca()
  for row_index = 1:number_of_patches

    origin_point = [(col_index - 1)+(col_index - 1)*epsilon+round(1.30*number_of_cols)+1,(row_index - 1)+(row_index - 1)*epsilon+1];

    # what color?
    fraction = (data_scaled[row_index]^2)/(0.15+data_scaled[row_index]^2)
    color_value = fraction*color_1+(1-fraction)*color_2


    # draw the square -
    ax[:add_patch](

               patches.Rectangle(origin_point,   # (x,y)
                   1.0,          # width
                   1.0,          # height
                   facecolor=color_value,
                   edgecolor="grey",
                   linewidth=0.5,
               )
           )


  end
end

axis("square")
axis("off")
savefig("Norm-System-Raw.pdf")
