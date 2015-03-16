%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 2-b: plotting results we got from Q2_a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;

%% plot the estimated option prices
% actualPrices = prices(nTrain+1: nTrain+nTest,:);
% timeValues = dates(nTrain+1: nTrain+nTest);
% figure(2);clf;
% hold on;
% grid on;
% box on;
% axis tight;
% for i=1:m/2
% for i=1+(m/2):m
%     plot(timeValues, estmPrices(:,i), 'b');
%     plot(timeValues, actualPrices(:,i), 'r');
% end
% title('Black-Scholes estmations for Option Prices', 'FontSize', 18);
% xlabel('Date (day/month)', 'FontSize', 18);
% ylabel('Option Price', 'FontSize', 18);
% plot_legend = legend ('Estimated', 'Actual');
% set(plot_legend, 'FontSize', 14);
% datetick('x','dd/mm','keeplimits');

%% plot the error between actual and estimated price
% colorMaps = lines(10);
% actualPrices = prices(nTrain+1: nTrain+nTest,:);
% timeValues = dates(nTrain+1: nTrain+nTest);
% errors = actualPrices - estmPrices;
% figure(1);clf;
% subplot(1, 2, 1);
% hold on;
% grid on;
% box on;
% axis tight;
% for i=1:m/2
%     plot(timeValues, errors(:,i), 'Color', colorMaps(i,:));
% end
% title('Pricing Errors (Call)', 'FontSize', 16);
% xlabel('Date (day/month)', 'FontSize', 16);
% ylabel('Option Price', 'FontSize', 16);
% datetick('x','dd/mm','keeplimits');
% subplot(1, 2, 2);hold on;
% grid on;
% box on;
% axis tight;
% for i=1+(m/2):m
%     plot(timeValues, errors(:,i), 'Color', colorMaps(i-(m/2),:));
% end
% title('Pricing Errors (Put)', 'FontSize', 16);
% xlabel('Date (day/month)', 'FontSize', 16);
% ylabel('Option Price', 'FontSize', 16);
% datetick('x','dd/mm','keeplimits');
% figure(2);clf;
% subplot(1, 2, 1);
% hold on;
% grid on;
% box on;
% axis tight;
% boxplot(errors(:,1:m/2));
% title('Pricing Errors (Call)', 'FontSize', 16);
% xlabel('Option', 'FontSize', 16);
% ylabel('Error', 'FontSize', 16);
% subplot(1, 2, 2);hold on;
% grid on;
% box on;
% axis tight;
% boxplot(errors(:,1+(m/2):m));
% title('Pricing Errors (Put)', 'FontSize', 16);
% xlabel('Option', 'FontSize', 16);
% ylabel('Error', 'FontSize', 16);

%% plot model parameters
% colorMap = lines(5);
% actualPrices = prices(nTrain+1: nTrain+nTest,:);
% timeValues = dates(nTrain+1: nTrain+nTest);
% figure(1);clf;
% subplot(4,1,1);
% hold on;
% grid on;
% box on;
% axis tight;
% plot(timeValues, sigmaValues, 'Color', colorMap(1,:), 'LineWidth', 0.5);
% title('Sigma: volatility', 'FontSize', 14);
% ylabel('Value', 'FontSize', 14);
% datetick('x','dd/mm','keeplimits');
% subplot(4,1,2);
% hold on;
% grid on;
% box on;
% axis tight;
% plot(timeValues, vegaValues, 'Color', colorMap(2,:), 'LineWidth', 0.5);
% title('Vega: sensitivity to underlying price volatility', 'FontSize', 14);
% ylabel('Value', 'FontSize', 14);
% datetick('x','dd/mm','keeplimits');
% subplot(4,1,3);
% hold on;
% grid on;
% box on;
% axis tight;
% plot(timeValues, deltaValues, 'Color', colorMap(4,:), 'LineWidth', 0.5);
% title('Delta: sensitivity to underlying price change', 'FontSize', 14);
% ylabel('Value', 'FontSize', 14);
% datetick('x','dd/mm','keeplimits');
% subplot(4,1,4);
% hold on;
% grid on;
% box on;
% axis tight;
% plot(timeValues, gammaValues, 'Color', colorMap(5,:), 'LineWidth', 0.5);
% title('Gamma: sensitivity to underlying delta change', 'FontSize', 14);
% xlabel('Date (day/month)', 'FontSize', 14);
% ylabel('Value', 'FontSize', 14);
% datetick('x','dd/mm','keeplimits');











