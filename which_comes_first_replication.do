***
* This .do file replicates the results from 
* "Which Comes First? Unpacking the Relationship Between Peace Agreements and  Peacekeeping Missions" 
* in the Conflict Management and Peace Science


clearset more offversion 7


use "which_comes_first.dta"



*************************************
* Naive Probit Results (Table 2)

probit peace_agreement peacekeeping_mission duration d2 d3  if continued_conflict == 0 & enforcement == 0, cluster(dyadid)

probit peace_agreement peacekeeping_mission l_gdp  lpop  cumulative_deaths deaths rebel_s conflict_num duration d2 d3  if continued_conflict == 0 & enforcement == 0, cluster(dyadid)



*************************************
* Bivariate Probit Results - No Covariates (Table 3)

biprobit (peace_agreement = peacekeeping_mission ) (peacekeeping_mission = square_black   ) if continued_conflict == 0 & enforcement == 0, cluster(dyadid)

*************************************
* Bivariate Probit Results - All Covariates (Table 4)

biprobit (peace_agreement = peacekeeping_mission lpop l_gdp  cumulative_deaths deaths rebel_s conflict_num duration  d2 d3) ///
(peacekeeping_mission = square_black  lpop l_gdp  cumulative_deaths deaths rebel_s conflict_num duration d2 d3 ) if continued_conflict == 0 & enforcement == 0, cluster(dyadid)

* Check the chi-square statistic for the instrument
test square_b










