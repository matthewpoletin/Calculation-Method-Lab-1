function [iMat,OptSumm] = OptDecision(iPlusNull, InputMat)
% Построение оптимального решения

%      try
%         global InputMat;
        iMat = zeros(5,5);
        %Построение матрицы, места с выделенным нулем заполняем значением
        %исходной матрицы остальные устанавливаем в 0;
        %OptSumm - значение целевой функции
        OptSumm = 0;
        for i = 1:5
            for j = 1:5
                if iPlusNull(j) == i
                    iMat(i,j) = InputMat(i,j);
                else
                    iMat(i,j) = 0;
                end
                OptSumm = OptSumm + iMat(i,j);
            end
        end
%      catch
%          throw('Ошибка при построении оптимального решения\n');
%      end
end