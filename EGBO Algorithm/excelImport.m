folder = 'C:\Users\Orka\Downloads\Documents\Thesis\OPT ALGO\egbo algo\EGBO\neuralpaper';
if ~exist(folder, 'dir')
    mkdir(folder);
end

baseFileName = 'egboNN.xlsx';
fullFileName = fullfile(folder, baseFileName);
xlswrite(fullFileName ,vec1,'RUN');
xlswrite(fullFileName ,vec2,'Kp1');
xlswrite(fullFileName ,vec3,'Ki1');
xlswrite(fullFileName ,vec4,'Kd1');
xlswrite(fullFileName ,vec5,'Kp2');
xlswrite(fullFileName ,vec6,'Ki2');
xlswrite(fullFileName ,vec7,'Kd2');
xlswrite(fullFileName ,vec8,'ITAE');
xlswrite(fullFileName ,vec9,'ExeTime');
xlswrite(fullFileName ,vec10,'W1');
xlswrite(fullFileName ,vec11,'W2');