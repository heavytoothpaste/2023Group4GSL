%% Retrieves Data
data = load('GSLData.csv');
years = data(:, 1);
temperatures = data(:, 2);
saltair = data(:, 3);
saline = data(:, 4);

%% Plots
figure();
plot(years, temperatures);
hold on;
title('Salt Lake City Temperatures over time')
xlabel('Year');
ylabel('Temperature (°C)');
% Fit a linear trendline to the data
[p, S] = polyfit(years, temperatures, 1);

% Evaluate the trendline at the data points
tvy_trend = polyval(p, years);
plot(years, tvy_trend, '--');

figure();
plot(years, saltair);
hold on;
plot(years, saline);
title('Great Salt Lake Water Levels over time')
xlabel('Year');
ylabel('Water Level (NGVD 1929)');
legend('Saltair', 'Saline')
hold off;

%% Plots Temperature against Water Levels
waterLevels = (saltair+saline)/2;
figure();

plot(temperatures, waterLevels, '.', 'LineStyle', 'none', 'MarkerSize', 10);
xlabel('Temperature (°C)');
title('The effect of temperature on the water levels in the Great Salt Lake');
ylabel('Water Level (NGVD 1929)');
hold on;
% Fit a linear trendline to the data
[m, b] = polyfit(temperatures, waterLevels, 1);

% Evaluate the trendline at the data points
tw_trend = polyval(m, temperatures);
plot(temperatures, tw_trend, '-');

%% Calculates Correlation Coefficient
CCF = corrcoef(temperatures, saltair);
CCS = corrcoef(temperatures, saline);