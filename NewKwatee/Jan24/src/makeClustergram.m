function makeClustergram()
    close all;
	gendata = readtable('dataForClustergram2xpeturbIC100PercentDilutionNoPCSetSeedFixed.txt', 'Delimiter',',','ReadVariableNames',false);
    %names = table2array(readtable('paramNames.txt', 'ReadVariableNames',false));
    names = table2array(readtable('peturbedICNames.txt', 'ReadVariableNames',false));
    %disp(names);
    numericgendata = table2array(gendata);
    transformeddata = abs(log10(numericgendata)); %log transform the data so we can see differences
    transformeddata(transformeddata < -3) =0; %set small numbers equal to zero
    transformeddata(isinf(transformeddata))=0;%make inf 0 (they're log of 0, should be 0)
    transformeddata= min(transformeddata+3, abs(transformeddata)); %transform
    %cgobj = clustergram(numericgendata, 'RowLabels', names, 'ColumnLabels', names, ...
    %    'ColorMap', gray, 'Cluster', 'column', 'DisplayRange', 100, 'Linkage', 'average');
    newgreymap = (transpose([0.2:.02:1.0; 0.2:.02:1.0; 0.2:.02:1.0]));
    cgobj = clustergram(transformeddata, 'RowLabels', names, 'ColumnLabels', names, ...
       'ColorMap',newgreymap, 'Cluster', 'column', 'DisplayRange', 10, 'Linkage', 'average'...
       ,'Symmetric', false);
    set(cgobj, 'DisplayRatio', .3);
   % set(cgobj,'Linkage','complete','Dendrogram',3) %color linkages
    %add the color bar
    cbButton = findall(gcf,'tag','Annotation.InsertColorbar');
    ccb = get(cbButton,'ClickedCallback');
    set(cbButton,'State','on');
    %ccb{1}(cbButton,{},ccb{2});
    %plotcg = plot(cgobj);
    %set(gcf,'PaperUnits','inches','PaperPosition',[0 0 800 800])
    %print('5xClustergram', '-dpdf','-r100') 

end
