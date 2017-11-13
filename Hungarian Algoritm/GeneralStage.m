function [iMat] = GeneralStage(iMatSize,iMat,InputMat)
% Основной этап. На вход подается порядок матрицы и сама матрица
% PlusItemsCol - массив, соответствующий выделенным столбца. Если элемент =
% -1, то столбец не выделен, иначе хранит строку выделенного 0*;
% iPlusNull - размер СНН;
% arrComRow - массив выделенных строк. 0 - строка не выделена,1 - выделена;
% iComRow - стэк с i индексом 0';
% iComCol - стэк с j индексом 0';
% iterCount - счетчик итераций;
% bHasUnmarkedNull - True:среди невыделенных есть 0/False:нет;
% bHasMarkedNullInRow - True:в выделенной строке есть 0*/False:нет;

%     try
        global bDeb;
%         global InputMat;
        if bDeb
            fprintf('Основной этап:\n');
        end
        % Построение первоночальной СНН
        [PlusItemsCol,iPlusNull] = GetNullIndex(iMatSize,iMat);
        iterCount = 1;
        op = iPlusNull;
        fprintf('\nНомер итерации: %.1d\n',iterCount);
        iterCount = iterCount + 1;
        if bDeb
            FirstShowCINMatrix(iPlusNull,PlusItemsCol,iMat);
        end
        % в iComRow,iComCol - стэк для индексов элементов со штрихом
        iComRow = [];
        iComCol = [];
        arrComRow = zeros(1,iMatSize); 
        % выполняем цикл, пока количество выделенных нулей не станет равным
        % размерности матрицы
        % Размер СНН равен размерности матрицы?
        while iPlusNull < iMatSize
            % Среди невыделенных элементов есть 0?
            [bHasUnmarkedNull, iComRow, iComCol] = CheckUnmarkedNull(PlusItemsCol,iMat,arrComRow,iComRow,iComCol);
            % Да, среди невыделенных элементов есть 0
            if bHasUnmarkedNull
                if bDeb
                    ShowComMatrix(PlusItemsCol, iMat, iterCount, iComRow, iComCol);
                end
                % В одной строке с 0' есть 0*?
                [bHasMarkedNullInRow] = FindMarkedNullInRow(PlusItemsCol,iComRow);
                % Да, в строке с 0' есть 0*
                if bHasMarkedNullInRow
                    % Удаление выделения со столбца. Выделение строки              
                    [PlusItemsCol, arrComRow] = ChangeMarks(PlusItemsCol,iComCol,iComRow,arrComRow);
                    if bDeb
                        fprintf('\nВ строке с 0 со '' есть выделенный ноль\n');
                        ShowCINMatrix(PlusItemsCol,arrComRow,iMat,iComRow,iComCol);
                    end
                    
                    % Вывод значений L цепочки
                    for i = 1:length(iComRow)
                        fprintf('(%.1d;%.1d)\n',iComRow(i),iComCol(i));
                    end         
                    
                % Нет, в строке с 0' нет 0*
                else
                    % Снятие выделения со строк, новое выделение столбцов
                    [PlusItemsCol, arrComRow, iComCol, iComRow] = CreateNewCIN(PlusItemsCol,arrComRow,iComCol,iComRow, iMat);
                    if bDeb
                        fprintf('\nВ строке с 0 со '' нет выделенного ноля\n');
                        FirstShowCINMatrix(iPlusNull,PlusItemsCol,iMat);
                    end
                end
            % Нет, среди невыделенных элементов нет 0.
            else 
                iMat = UpgradeMatrix(iMat, PlusItemsCol, arrComRow);
                if bDeb
                    fprintf('\nСреди невыделенных элементов нет нуля. Улучшаем матрицу\n');
                    ShowCINMatrix(PlusItemsCol, arrComRow, iMat, iComRow, iComCol);
                end
            end
            % Подсчет элементов СНН
            if iPlusNull > op
                if bDeb
                    for i = 1:40
                        fprintf('-');
                    end
                    fprintf('\n');
                    fprintf('\nНомер итерации: %.1d\n',iterCount);
                end
                iterCount = iterCount + 1;
                op = iPlusNull;
            end
            % Подсчет элементов СНН
            iPlusNull = 0;
            for i = 1:length(PlusItemsCol)
                if PlusItemsCol(i) ~= -1
                    iPlusNull = iPlusNull + 1;
                end
            end
            iPlusNull = iPlusNull + length(iComCol);
            if bDeb
                fprintf('\nКоличество нулевых элементов: %.1d\n',iPlusNull);
            end
        end
        % Вычисление оптимального решения
        [iMat,OptSumm] = OptDecision(PlusItemsCol, InputMat);
        ShowOptDecision(iMat, OptSumm, PlusItemsCol);
%     catch
%        fprintf('Ошибка в основном этапе алгоритма\n'); 
%     end
end