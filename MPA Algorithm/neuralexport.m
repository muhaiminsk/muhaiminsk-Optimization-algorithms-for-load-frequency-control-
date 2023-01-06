folder = 'C:\Users\Orka\Downloads\Documents\Thesis\OPT ALGO\mpa algo\MPA code';
if ~exist(folder, 'dir')
    mkdir(folder);
end

% baseFileName = 'egboNN.xlsx';
% fullFileName = fullfile(folder, baseFileName);
% xlswrite(fullFileName ,vec1,'RUN');
% xlswrite(fullFileName ,vec2,'Kp1');
% xlswrite(fullFileName ,vec3,'Ki1');
% xlswrite(fullFileName ,vec4,'Kd1');
% xlswrite(fullFileName ,vec5,'Kp2');
% xlswrite(fullFileName ,vec6,'Ki2');
% xlswrite(fullFileName ,vec7,'Kd2');
% xlswrite(fullFileName ,vec8,'ITAE');
% xlswrite(fullFileName ,vec9,'ExeTime');
% xlswrite(fullFileName ,vec10,'W1');
% xlswrite(fullFileName ,vec11,'W2');

% col_header={'RUN','Kp1','Ki1','Kd1','Kp2','Ki2','Kd2','ITAE','ExeTime','w1','w2'};
% xlswrite('mpaNN1.xlsx',col_header,'Sheet1','A1');
xlswrite('mpaNN1.xlsx',[vec1,vec2,vec3,vec4,vec5,vec6,vec7,vec8,vec9,vec10,vec11],'Sheet1','A0002');