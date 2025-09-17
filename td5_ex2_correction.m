% TD n�5 Matlab : Lecture Sauvegarde et Analyse de donn�es
% Exercice 2: Analyse de donn�es
clear; close all; clc;
%
% Compatible avec des versions r�centes de Matlab
icompat=1;
%
%
% Question 1) Lire les donn�es
%
fdata=importdata('mesures_h_plaque_plane_v_8.5.txt'); % fichier ASCII avec commentaires
sdT1=fdata.data(:,4); puissance1=fdata.data(:,5);
fdata2=load('mesures_h_plaque_plane_v_8.5'); % fichier ASCII sans commentaires
sdT2=fdata2(:,4); puissance2=fdata2(:,5);
[num0,headertext0] = xlsread('mesures_h_plaque plane.xlsx','v=8.5 m.s-1'); % fichier Excel
sdT3=num0(:,4);
puissance3=num0(:,5);

if icompat==1
    filer0 = readtable('mesures_h_plaque plane.xlsx','Sheet','v=8.5 m.s-1'); % fichier Excel 
    sdT4=filer0.sdT;
    puissance4=filer0.p;   
end

plot(sdT1,puissance1,'+b')
hold on
plot(sdT2,puissance2,'or')
plot(sdT3,puissance3,'*g')
if icompat==1
    plot(sdT4,puissance4,'dk')
end
hold off
xlabel('Surface*\Delta T en m^2.K');
ylabel('Puissance en W');

if icompat==1
    legend('importdata','load','xlsread','readtable','Location','Best')
else
    legend('importdata','load','xlsread','Location','Best')
end
% Question 2) Lire et analyser les donn�es
figure
filename_excel='mesures_h_plaque plane.xlsx';
v=[8.5,1.5,2.7,0.9,6.1];
colorT=hsv(size(v,2)); % g�n�re des couleurs al�atoires
for i=1:length(v)
    sheet{i}=sprintf('v=%2.1f m.s-1',v(i));
    display(sheet{i});
    [num{i},headertext{i}] = xlsread(filename_excel,sheet{i});
    SdT{i}=num{i}(:,4);
    p{i}=num{i}(:,5);
    %
    hold on
    plot(SdT{i},p{i},'color',colorT(i,:),'LineStyle','none', ...
        'Marker','d','MarkerSize',10)
    % R�gression lin�aire a*x+b
    pol1{i}=polyfit(SdT{i},p{i},1);
    coeff(i)=pol1{i}(1); % stocker le coeff a 
    ypol1{i}= polyval(pol1{i},SdT{i});     
end

for i=1:length(v)
    plot(SdT{i},ypol1{i},'color',colorT(i,:),'LineStyle','-','LineWidth',1.5)
    legend_i{i}=sprintf('v=%2.1f m.s^{-1}',v(i));
end
hold off
xlabel('Surface*\Delta T en m^2.K');
ylabel('Puissance en W');
legend(legend_i,'Location','Best')
grid on
% Sauvegarde de la figure
set(gcf,'PaperPositionMode','auto')
print(gcf,'-djpeg','figure2_td5_exo2_2')

% Question 3) Fit des courbes
figure
subplot(2,1,1)
plot(v,coeff,'+b','MarkerSize',10)
hold on

% fit : Fit avec poyfit pour log(a*x^b)=log(a)+b*log(x)
pol_log=polyfit(log(v),log(coeff),1);
times = linspace(min(v),max(v),50); 
a=exp(pol_log(2)); b=pol_log(1);
plot(times,a*times.^b,'r:','LineWidth',2);
display(' ')
display(sprintf('Avec Polyfit en log-log: %4.2f v^{%4.2f}',a,b));

hold off
xlabel('Vitesse en m.s^{-1}');
ylabel('Coefficient h W.m^2.K^{-1}');
leg_reg=sprintf('%4.2f v^{%4.2f}',a,b);
legend('Exp.',leg_reg,'Location','Best');
axis([0 9 0 200])



if icompat==1
    % OU fit : Fit avec a*x^b
    algebr_fit=fit(v',coeff','a*x^(b)','StartPoint',[0,1])
    times = linspace(min(v),max(v),50);
    display(' ')
    display(sprintf('Avec Fit               : %4.2f v^{%4.2f}',algebr_fit.a,algebr_fit.b));
    % OU lsqcurvefit: Fit avec a*x^b
    fun = @(x,vel)x(1)*v.^x(2); % d�finir fonction
    x0 = [100,1];
    [algebr_fit2,resnorm,residual]=lsqcurvefit(fun,x0,v,coeff);
    display(sprintf('Avec lsqcurvefit: %4.2f v^{%4.2f}',algebr_fit2(1),algebr_fit2(2)));
    display(' ');
end


subplot(2,1,2)
loglog(v,coeff,'+b','MarkerSize',10)
hold on
plot(times,a*times.^b,'r:','LineWidth',2);
hold off
xlabel('Vitesse en m.s^{-1}');
ylabel('Coefficient h W.m^2.K^{-1}');
legend('Exp.',leg_reg,'Location','South');
axis([0.8 10 10 1000])

% Sauvegarde de la figure
set(gcf,'PaperPositionMode','auto')
print(gcf,'-djpeg','figure2_td5_exo2_3')

% Question 4) Sauvegarde des donn�es
save('td5_exo2.mat')
% V�rification des donn�es sauvegard�es
clear
load('td5_exo2.mat')


% Sauvegarde dans un fichier ASCII sans commentaires
datas=[v',coeff'];
save('data_save_td5_exo2_bis','datas','-ASCII')

% Sauvegarde dans un fichier ASCII avec commentaires
%
% r�arranger vecteurs avec vitesse croissante monotone
[vel,ivel]=sort(v); coeff2=coeff(ivel);
%
filename='data_save_td5_exo2.dat';
text='Vitesse (m.s^{-1}), \t Coefficient h (W.m^2.K^{-1}) \n';
fid = fopen(filename, 'w');
fprintf(fid, text);
for i=1:length(v)
    fprintf(fid,'%e \t  \t %e \n',vel(i),coeff2(i));
end
fclose(fid);
