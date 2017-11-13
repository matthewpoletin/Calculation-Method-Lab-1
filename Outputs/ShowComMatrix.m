function ShowComMatrix(PlusItemsCol,iMat,iterCount,iComRow,iComCol)
%Вывод СНН на экран (для наглядности выбора)

%     try
        fprintf('Невыделенный нулевой элемент [%.1d;%.1d] выделен '':\n',iComCol(length(iComCol)),iComRow(length(iComRow)));
        %вывод "+" над столбцами
        fprintf('   ');
        for i = 1:length(PlusItemsCol)
            if PlusItemsCol(i) ~= -1
                fprintf('+');
            else
                fprintf(' ');
            end
            fprintf('   ');
        end 
        fprintf('\n');
        % Вывод матрицы с обозначением невыделенного элемента
        for i = 1:length(PlusItemsCol)
            fprintf('   ');
            for j = 1:length(PlusItemsCol)
                bRed = false;
                for c = 1:length(iComCol)
                    if iComCol(c) == j && iComRow(c) == i
                        bRed = true;
                    end    
                end
                if bRed
                    cprintf('*red','%.1d   ',iMat(i,j));
                elseif PlusItemsCol(j) == i
                    cprintf('*blue','%.1d   ',iMat(i,j));
                else
                    fprintf('%.1d   ',iMat(i,j));
                end
            end
            fprintf('\n');
        end
            fprintf('Строку %.1d пометим "+", уберем выделение со столбца, в котором находится 0 co *%.1d:\n',iComRow(length(iComRow))); 
%     catch
%        fprintf('Ошибка при простроении СНН\n');
%     end
end
