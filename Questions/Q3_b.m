%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 3-b: plotting results we got from Q3_a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;

%% scatter plot historical vs. implied volatility
% colorMap = lines(5);
% colorIdx = [1 2 3 4 5];
% figure(1);clf;
% subplot(1,2,1);
% hold on;
% grid on;
% box on;
% %axis tight;
% %daspect([1,1,1]);
% for i=1:m/2
%     plot(voltValues_(:,i), sigmaValues_(:,i), '.', 'MarkerSize', 20, 'Color', colorMap(colorIdx(i),:));
% end
% title('Historical vs. Implied Volatility', 'FontSize', 14);
% xlabel('Implied Volatility', 'FontSize', 14);
% ylabel('Historical (Realised) Volatility', 'FontSize', 14);
% plotLegend = legend('Call 1', 'Call 2', 'Call 3', 'Call 4', 'Call 5', 'Location', 'nw');
% set(plotLegend, 'FontSize', 10);
% subplot(1,2,2);
% hold on;
% grid on;
% box on;
% %axis tight;
% %daspect([1,1,1]);
% for i=1+(m/2):m
%     plot(voltValues_(:,i), sigmaValues_(:,i), '.', 'MarkerSize', 20, 'Color', colorMap(colorIdx(i-(m/2)),:));
% end
% title('Historical vs. Implied Volatility', 'FontSize', 14);
% xlabel('Implied Volatility', 'FontSize', 14);
% ylabel('Historical (Realised) Volatility', 'FontSize', 14);
% plotLegend = legend('Put 1', 'Put 2', 'Put 3', 'Put 4', 'Put 5', 'Location', 'ne');
% set(plotLegend, 'FontSize', 10);

%% plot historical vs. implied volatility
% colorMap = lines(5);
% colorIdx = [1 2 3 4 5];
% figure(1);clf;
% subplot(1,2,1);
% hold on;
% grid on;
% box on;
% %axis tight;
% %daspect([1,1,1]);
% for i=1:m/2
%     plot(voltValues_(:,i), 'LineWidth', 1, 'Color', 'k');
%     plot(sigmaValues_(:,i), 'LineWidth', 2, 'Color', colorMap(colorIdx(i),:));
% end
% title('Historical vs. Implied Volatility', 'FontSize', 14);
% xlabel('Implied Volatility', 'FontSize', 14);
% ylabel('Historical (Realised) Volatility', 'FontSize', 14);
% plotLegend = legend('Call 1', 'Call 2', 'Call 3', 'Call 4', 'Call 5', 'Location', 'nw');
% set(plotLegend, 'FontSize', 10);
% subplot(1,2,2);
% hold on;
% grid on;
% box on;
% %axis tight;
% %daspect([1,1,1]);
% for i=1+(m/2):m
%     plot(voltValues_(:,i), 'LineWidth', 1, 'Color', 'k');
%     plot(sigmaValues_(:,i), 'LineWidth', 2, 'Color', colorMap(colorIdx(i-(m/2)),:));
% end
% title('Historical vs. Implied Volatility', 'FontSize', 14);
% xlabel('Implied Volatility', 'FontSize', 14);
% ylabel('Historical (Realised) Volatility', 'FontSize', 14);
% plotLegend = legend('Put 1', 'Put 2', 'Put 3', 'Put 4', 'Put 5', 'Location', 'ne');
% set(plotLegend, 'FontSize', 10);

%% volatility smile
% colorMap = lines(30);
% daysIdx = [ 1 5 6 7 8 9 10];
% colorIdx = [1 2 3 4 5 7 8 9 10 11 12 13 14 15 16 17 18];
% legendDates = cell(length(daysIdx),1);
% plots = zeros(length(daysIdx),1);
% for i=1:length(daysIdx)
%     legendDates{i} = datestr(dates_(testIdx(i)),'dd/mmm');
% end
% figure(2); clf;
% subplot(1, 2, 1);
% hold on;
% grid on;
% box on;
% for i=1:length(daysIdx)
%     plot(strikePrices(1:m/2), voltValues_(daysIdx(i),1:m/2), '-', 'Color', colorMap(colorIdx(i),:));
%     plots(i) = plot(strikePrices(1:m/2), voltValues_(daysIdx(i),1:m/2), '.', 'MarkerSize', 30, 'Color', colorMap(colorIdx(i),:));    
% end
% title('Implied Volatility for Call Options', 'FontSize', 14);
% xlabel('Strike/Asset', 'FontSize', 14);
% ylabel('Implied Volatility', 'FontSize', 14);
% plotLegend = legend(plots, legendDates, 'Location', 'se');
% set(plotLegend, 'FontSize', 10);
% subplot(1, 2, 2);
% hold on;
% grid on;
% box on;
% for i=1:length(daysIdx)
%     plot(strikePrices(1+(m/2):m), voltValues(daysIdx(i),1+(m/2):m), '-', 'Color', colorMap(colorIdx(i),:));
%     plots(i) = plot(strikePrices(1+(m/2):m), voltValues(daysIdx(i),1+(m/2):m), '.', 'MarkerSize', 30, 'Color', colorMap(colorIdx(i),:));
% end
% title('Implied Volatility for Put Options', 'FontSize', 14);
% xlabel('Strike/Asset', 'FontSize', 14);
% ylabel('Implied Volatility', 'FontSize', 14);
% plotLegend = legend(plots, legendDates, 'Location', 'se');
% set(plotLegend, 'FontSize', 10);















