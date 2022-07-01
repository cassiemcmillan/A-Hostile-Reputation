# A-Hostile-Reputation

The R script (A Hostile Reputation_Table2.R) includes replication code for the analyses presented in Table 2 of Corradi, McMillan & Dietrich. These analyses were estimated using R version 4.1.2, statnet version 2019.6, and ergm version 4.1.2.

CSV files include various country-level and dyad-level data needed to complete the analyses. Time 1 refers to the period between the fall of the Soviet Union (December 1989) to the eve of September 11, 2001 and Time 2 includes September 11, 2001 to December 2014.

-	cinc_ratio.csv is a 192 × 192 matrix where each (i, j) cell is equal to the log ratio of the CINC scores of country i and country j, with the higher score being divided by the lower.
-	indirect_T1_adversaries.csv is a 192 × 192 matrix where each (i, j) cell is 1 if countries i and k report a Time 1 conflict and countries k and j report a Time 1 alliance, or if countries i and k report a Time 1 alliance and countries k and j report a Time 1 conflict.
-	T1_conflict_count.csv is a 192 × 192 matrix where (i, j) equals the number of conflicts that occurred between country i and country j during Time 1.
-	T1_direct_max_hostility.csv is a 192 × 192 matrix where each (i, j) cell is the maximum hostility level of only those disputes that occurred between county i and country j during Time 1.
-	T2_ally.csv is a 192 × 192 matrix where (i, j) = 1 if an alliance was observed between countries i and j at any point during Time 2.
-	T2_conflict_binary.csv is a 192 × 192 matrix where each (i, j) cell equals 1 if country i and country j experienced at least one conflict in Time 2.
-	indivvarnumeric.csv is an individual-level dataset that includes data on 8 variables for 192 countries: (1) bortotalavg is the average number of bordering countries that neighbor each state, (2) democracy indicates the type of political regime that defines each country, (3) Sub-Region Code provides a numeric value that indicates the sub-region each country is located in, (4) Dev indicates each county’s development level, (5) Avg Population is each country’s average population level in number of people, (6) AVGGDP is each country’s average GDP in USD, (7) T1MaxHost is each state’s highest level of hostility across all conflicts that it participated in during Time 1, and (8) maj_pow is a binary indicator of whether a state is considered to be a major power.

The data analyzed in this project were compiled from the Correlates of War (COW) Project (Palmer et al., 2022), the United Nations Statistics Division, and the Varieties of Democracy (V-Dem) project.

Please cite this work as Corradi, Andrea, Cassie McMillan, and Nick Dietrich. Forthcoming. “A Hostile Reputation: A Social Network Approach to Interstate Hostility.” Social Networks.
