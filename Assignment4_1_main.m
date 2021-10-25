% Title: Reproducibility Challenge - Assignment 4.1 - Introduction to
% Research Skills
% Content: Reading in Sales data from a fictional supermarket in Lausanne
% as well as weather data from Lausanne and plotting figures to viualize 
% the data and visually see potential correlation.
% The sales data have been artificially generated for the sake of this
% assignment, since real data has not been found.
% The weather data is taken from www.historique-meteo.net
% Author: Melina Gaedecke
% EPFL
% Created: 25.10.2021
% Last update: 25.10.2021

clear
close all
clc

%% Importing Data and assigning variables
% Importing the Excel sheets containing weather and sales information
weather_conditions = readtable('Weather Conditions March April 2021.xlsx');
sales_data = readtable('Sales March April 2021.xlsx');

% Creating vectors containing the information required for the plots
date = weather_conditions.Date;                                    % Vector containing the dates

temperature = weather_conditions.Temperature;                      % Vector containing data of temperature
rain = weather_conditions.Rain;                                    % Vector containing data of raindays

sales_carrots = sales_data.SalesCarrots;                           % Vector containing the sales data of carrots
sales_icecream = sales_data.SalesIcecream;                         % Vector containing the sales data of Icecream
sales_coffee = sales_data.SalesCoffeeToGo;                         % Vector containing the sales data of Coffee to go

%% Plots for data visualization
% Plot Temperature
figure
plot(date,temperature)                                              % Plot data of temperature
title('Temperature in Lausanne March and April 2021')               % set title of figure
xlabel('Date')                                                      % Set label of x-axis
ylabel('Temperature °C')                                            % Set label of y-axis

% Plot Rain
figure
bar(date,rain)                                                      % Plot data as bars
title('Raindays in Lausanne March and April 2021')                  % set title of figure
xlabel('Date')                                                      % Set label of x-axis
ylabel('Rain - yes or no')                                          % Set label of y-axis

% Plot sales
figure
hold on
plot(date,sales_carrots, 'DisplayName', 'Sales of Carrots')         % Plot sales data of carrots
plot(date,sales_icecream, 'DisplayName', 'Sales of Icecream')       % Plot sales data of Icecream
plot(date,sales_coffee, 'DisplayName', 'Sales of Coffee to go')     % Plot sales data of Coffee to go
title('Sales in Lausanne March and April 2021')                     % set title of figure
xlabel('Date')                                                      % Set label of x-axis
ylabel('Sales')                                                     % Set label of y-axis
legend

%% Plots for detection of correlation
% Plotting Sales for Ice Cream, Temperature and Rain in the same plot
figure
hold on
yyaxis left                                                         % Plot data that will be linked to the left y-axis
plot(date,sales_icecream, 'DisplayName', 'Sales of Icecream')       % Plot sales data of Icecream
ylabel('Icecream Sales')                                            % Set label of left y-axis
yyaxis right                                                        % Plot data that will be linked to the right y-axis
plot(date,temperature, 'DisplayName', 'Temperature')                % Plot data of temperature
bar(date,rain, 'DisplayName', 'Rain')                               % Plot data as bars
title('Icecream Sales, Temperature and Rain in Lausanne March and April 2021') % set title of figure
xlabel('Date')                                                      % Set label of x-axis
ylabel('Temperature and Rain')                                      % Set label of right y-axis
legend

% Plotting Sales for Coffee to go, Temperature and Rain in the same plot
figure
hold on
yyaxis left                                                         % Plot data that will be linked to the left y-axis
plot(date,sales_coffee, 'DisplayName', 'Sales of Coffee to go')     % Plot sales data of Coffee to go
ylabel('Coffee to go Sales')                                        % Set label of left y-axis
yyaxis right                                                        % Plot data that will be linked to the right y-axis
plot(date,temperature, 'DisplayName', 'Temperature')                % Plot data of temperature
bar(date,rain, 'DisplayName', 'Rain')                               % Plot data as bars
title('Coffee to go Sales, Temperature and Rain in Lausanne March and April 2021') % set title of figure
xlabel('Date')                                                      % Set label of x-axis
ylabel('Temperature and Rain')                                      % Set label of right y-axis
legend