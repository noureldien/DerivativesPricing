%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 1-a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% use simple equation mentioned in the book and
% in this article: http://www.afr.com/personal_finance/investment_guide/investment_guide_options/
% to draw the graph

clc;

% call and put price
priceC = 45;
priceP = 40;

% intereset rate
r = 6/100;

% call option
assetPrice1 = [45 90];
callProfit  = [0 45];

% put option
assetPrice2 = [0 40 45];
putProfit  = [40 0 0];

% plot graphs
% figure(1);clf;
% hold on;
% grid on;
% box on;
% plot(assetPrice, callProfit, 'r', 'LineWidth', 2);
% xlabel('Price of Underyling Asset', 'FontSize', 18);
% ylabel('Payoff of Call Option', 'FontSize', 18);
% title('Asset Price vs. Profit (Call Option)', 'FontSize', 18);

% % plot graphs
% figure(1);clf;
% hold on;
% grid on;
% box on;
% plot(assetPrice, putProfit, 'b', 'LineWidth', 2);
% xlabel('Price of Underyling Asset', 'FontSize', 18);
% ylabel('Payoff of Put Option', 'FontSize', 18);
% title('Asset Price vs. Profit (Put Option)', 'FontSize', 18);

% plot graphs
figure(1);clf;
hold on;
grid on;
box on;
plot(assetPrice1, callProfit, 'r', 'LineWidth', 4);
plot(assetPrice2, putProfit, 'b', 'LineWidth', 4);
plot(assetPrice1, callProfit, 'k', 'LineWidth', 2);
plot(assetPrice2, putProfit, 'k', 'LineWidth', 2);
xlabel('Price of Underyling Asset', 'FontSize', 18);
ylabel('Payoff of Put+Call Option', 'FontSize', 18);
title('Asset Price vs. Profit (Call+Put)', 'FontSize', 18);
fLegend = legend('Call Profit', 'Put Profit', 'Location', 'nw');
set(fLegend, 'FontSize', 16);













