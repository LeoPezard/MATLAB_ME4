clear;
close all;
clc;

% Reading data from the text files and Excel file
data_txt1 = readtable('mesures_h_plaque_plane_v_8.5.txt');
% data_txt2 = readtable('mesures_h_plaque_plane_v_8.5');
data_xlsx = readtable('mesures_h_plaque plane.xlsx');

% Displaying the first few rows of each dataset to verify the data
disp('Data from mesures_h_plaque_plane_v_8.5.txt:');
disp(head(data_txt1));

% disp('Data from mesures_h_plaque_plane_v_8.5:');
% disp(head(data_txt2));

disp('Data from mesures_h_plaque plane.xlsx:');
disp(head(data_xlsx));