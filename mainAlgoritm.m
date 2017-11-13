function algorithm(InputMat,bTaskMax,bDebugMode)
% Основная программа
% InputMat - исходная матрица
% bDeb - True/False. Выводить/не выводить решение
% iMat - Матрица = входной. Для выполнения преобразований
% iMatSize - размерность матрицы

    global bDeb;
%     try
        iMatSize = size(InputMat,2);
        %Вывод исходной матрицы
        fprintf('Исходная матрица:\n');
        disp(InputMat);
        
        iMat = InputMat;
        if (bTaskMax)
            Max = GetMax(iMatSize, iMat);
            iMat = MaxOptTask(iMat, iMatSize,Max);  
        end
        bDeb = bDebugMode;
        %Преварительый этап алгоритма
        iMat = PrepStage(iMatSize,iMat);
        %Основной этап алгоритма
        iMat = GeneralStage(iMatSize,iMat,InputMat);
%     catch
%         throw('Ошибка в основной подпрогамме\n');
%     end
end
