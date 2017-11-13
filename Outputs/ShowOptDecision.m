function ShowOptDecision(iMat, Sum, iNull)
% Вывод оптимального решения

%     cprintf('*blue', 'Оптимальное решение:\n');
    fprintf('Оптимальное решение:\n');
    disp(iMat);
    fprintf('Значание целевой функции:');
    for j = 1:length(iNull)
        fprintf(' %.1d', iMat(iNull(j),j));
        if j ~= length(iNull)
             fprintf(' +');
        end
    end
    fprintf(' = %.1d\n', Sum);
end
