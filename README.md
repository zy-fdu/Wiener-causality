# Wiener-causality

Key words: Wiener causality, Gaussian process regression, COVID-19

NOTE

1. Data used in the paper was public available

1.1 The confirmed accumulative cases of COVID-19 epidemic from 34 provinces and regions (excluding the Tibet) throughout the People’s Republic of China were acquired from the Creative Commons Attribution 4.0 International (CC BY 4.0) by the Johns Hopkins University on the behalf of its Center for Systems Science in Engineering at https://github.com/CSSEGISandData/COVID-19 29. Daily totals, from Jan. 22nd, 2020 to Mar. 28th, 2020, were used in our study.

1.2 The confirmed accumulative cases of COVID-19 epidemic from all 50 states and 1 district throughout the USA were acquired from https://www.kaggle.com/sudalairajkumar/covid19-in-usa?select=us_states_covid19_daily.csv. Daily totals, from Mar. 4th, 2020 to May 31st, 2020, were used in our study. The data was obtained from COVID-19 Tracking Project and NY Times.

2.If the data and codes are used in your work, please cite the above reference, namely XXXXX.



SUMMARY （Matlab2019a; PYTHON ver 3.5.6; pyecharts ver 1.8.1: https://github.com/pyecharts/pyecharts)

1. Code for Wiener causality between two series without assessing its statistical significance (WienerCausality.m)

1.1 AR (auto-regression) and JR (joint-regression) model was trained to fit the time series.

1.2 K-L divergence between error distribution derived from two regression model to assess the interdependence between time series


2. Code for Wiener causality between mulitple time series and assessing the significance (Wienermain_batch.m)

2.1 Implementing the WienerCausality.m function to assess the pairwise K-L divergence.

2.2 Using Bootstrap with 100 repetitions to assess the significance of causal relation.


3. Graphical User Interface (GUI) of Wiener causality calculation under MATLAB circumstances (WCbatch.m)

3.1 Enter 'WCbatch' in the Command Window to initialize the GUI.

3.2 Click the button 'Load time series' to load time series matrix (in time * series format).

3.3 Click the button 'Calculate Wiener Causality' to calculate pairwise Wiener causality and assess the significance.

3.4 Click the button 'Statistics' and choose a certain pair to check the detail statistics of the Wiener causality.


4. COVID-19 propagation model given by Wiener causality (click on the each state/province to check the details of the propagation)

4.1 COVID-19 propagation pattern in China before 13th Feb. 2020.(Causality of China Covid-19(Former).html)

4.2 COVID-19 propagation pattern in China after 13th Feb. 2020.(Causality of China Covid-19(Latter).html)

4.3 COVID-19 propagation pattern in the U.S.. (Covid19 of all states in America.html)

