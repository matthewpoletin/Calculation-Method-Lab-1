function FirstShowCINMatrix(iNullCount,PlusItemsCol,iMat)
%Вывод матрицы с выделенной СНН другим шрифтом 

%     try
        fprintf('СНН:\n');
        for i = 1:length(PlusItemsCol)
            fprintf('   ');
            for j = 1:length(PlusItemsCol)
                bColor = false;
                if PlusItemsCol(j) == i
                    bColor = true;
                end
                if bColor == true
                    cprintf('*blue','%.1d   ',iMat(i,j));
                else
                    fprintf('%.1d   ',iMat(i,j));
                end
            end 
            fprintf('\n');
        end
        fprintf('Количество невыделенных нулевых элементов: %.1d\n',iNullCount);
%     catch
%         fprintf('Ошибка при простроении СНН\n');
%     end
end
