% Методы вычислений
% Лабораторная работа 1
% Группа ИУ7-13М
% Полётин М.А.
% Вариант 9

% Подготовка к работе
echo off;
clc;
clear classes;

% Ввод исходных данных
InputMatrix = [ 1   1   1   1   1 ;
                1   8   3   7   6 ;
                1   4   5   7   2 ;
                1   5   3   2   9 ;
                1   7   2   3   8
              ];
% InputMatrix = [ 4   7   1   5   5 ;
%                 6   8   3   7   6 ;
%                 6   4   5   7   7 ;
%                 4   2   3   4   9 ;
%                 8   1   8   3   8
%               ];
% Вариант задачи с максимизацией
bTaskMax = false;
% Включение режима отладки
bDebugMode = true;
% Выполнение алгоритма
algorithm(InputMatrix, bTaskMax, bDebugMode);
