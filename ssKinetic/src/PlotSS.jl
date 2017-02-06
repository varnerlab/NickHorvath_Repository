figure("TXTL",figsize=(23,16))

subplot(3,3,1)
plot(Tsim,X[:,54],"blue")
axis([0,3,0,10])
plt[:xticks](0:1:3)
plt[:yticks](0:2:10)
ylabel("GENE_CAT (mM)")
xlabel("Time (h)")

subplot(3,3,2)
plot(Tsim,X[:,55],"blue")
axis([0,3,0,10])
plt[:xticks](0:1:3)
plt[:yticks](0:2:10)
ylabel("RNAP (mM)")
xlabel("Time (h)")

subplot(3,3,3)
plot(Tsim,X[:,56],"blue")
axis([0,3,0,6])
plt[:xticks](0:1:3)
plt[:yticks](0:2:6)
ylabel("OPEN_GENE_CAT (mM)")
xlabel("Time (h)")

subplot(3,3,4)
plot(Tsim,X[:,57],"blue")
axis([0,3,0,0.01])
plt[:xticks](0:1:3)
plt[:yticks](0:0.002:0.01)
ylabel("mRNA_CAT (mM)")
xlabel("Time (h)")

subplot(3,3,5)
plot(Tsim,X[:,58],"blue")
axis([0,3,0,12])
plt[:xticks](0:1:3)
plt[:yticks](0:2:12)
ylabel("Ribosome (mM)")
xlabel("Time (h)")

subplot(3,3,6)
plot(Tsim,X[:,59],"blue")
axis([0,3,0,0.01])
plt[:xticks](0:1:3)
plt[:yticks](0:0.002:0.01)
ylabel("Ribosome_START_CAT (mM)")
xlabel("Time (h)")

subplot(3,3,7)
plot(Tsim,X[:,81],"blue")
axis([0,3,0,10])
plt[:xticks](0:1:3)
plt[:yticks](0:2:10)
ylabel("tRNA (mM)")
xlabel("Time (h)")

subplot(3,3,8)
plot(Tsim,X[:,60]+X[:,61]+X[:,62]+X[:,63]+X[:,64]+X[:,65]+X[:,66]+X[:,67]+X[:,68]+X[:,69]+X[:,70]+X[:,71]+X[:,72]+X[:,73]+X[:,74]+X[:,75]+X[:,76]+X[:,77]+X[:,78]+X[:,79],"blue")
axis([0,3,0,10])
plt[:xticks](0:1:3)
plt[:yticks](0:2:10)
ylabel("AA_tRNA (mM)")
xlabel("Time (h)")      

subplot(3,3,9)
plot(Tsim,X[:,80],"blue")
#axis([0,3,0,1e-12])
plt[:xticks](0:1:3)
#plt[:yticks](0:2e-13:1e-12)
ylabel("PROTEIN_CAT (mM)")
xlabel("Time (h)")

tight_layout()
