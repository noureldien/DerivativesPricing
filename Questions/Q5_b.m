%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 5-b: plotting results we got from Q5_a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% error = priceLattice(1,:) - pBlack;
% figure(1);clf;
% semilogx(deltaValues, error, '.--', 'Color', 'k', 'LineWidth', 1);
% hold on;
% semilogx(deltaValues, error,  'o', 'MarkerFaceColor','b', 'Color', 'k', 'MarkerSize', 10);
% grid on;
% box on;
% title('Difference in Option Pricing', 'FontSize', 18);
% xlabel('Time Increment', 'FontSize', 18);
% ylabel('Pricing Difference', 'FontSize', 18);
% set(gca, 'XDir', 'reverse');
% %plotLegend = legend(plots, legendDates, 'Location', 'se');
% %set(plotLegend, 'FontSize', 16);

figure(2);clf;
hold on;
grid on;
box on;
boxplot([abs(errorBlack); abs(errorLattice); abs(errorBlack);]');
title('Measuring Performance', 'FontSize', 18);
xlabel('Black-Scholes  Binomial Lattice  Monte-Carlo   ', 'FontSize', 14);
ylabel('Absolute Error', 'FontSize', 18);
set(gca, 'XDir', 'reverse');
%plotLegend = legend(plots, legendDates, 'Location', 'se');
%set(plotLegend, 'FontSize', 16);











