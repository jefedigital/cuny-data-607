
global SocCap C:\Users\chris\Dropbox\1Publication and Research\2020 - Social capital and COVID

set scheme s1color

/*************

- motivating plots
- baseline results
- summary statistics
- heterogeneity by population density/income
- heterogeneity by time

cleaning:
- clean facebook SCI
- clean NYT covid data
- clean social explorer
- clean social capital, religion and chetty data

international covid perceptions: https://covid19-survey.org/


add a plot that shows the treatment effect by month
add in weekly growth in infections
social connectedness index variable


****************/

*------------------------------ motivating plots

*motivating plot of distribution
use "$SocCap\data\covid_jhu.dta",clear
keep if month==7 & day==27
merge 1:1 county month using "$SocCap\data\covid_counties_weekgrowth.dta"
keep if _merge==3
drop _merge
merge m:1 county using "$SocCap\data\acs2014_2018.dta"
keep if _merge==3
drop _merge
replace casespc=cases/totpop
gen lcases=log(cases+1)
gen casespc_per100k=casespc*100000

sum casespc_per100k,d

*Distribution of Infections per Capita
sum casespc,d
local temp1: di %4.3f r(mean)
sum casespc,d
local temp2: di %4.3f r(sd)
twoway (kdensity casespc, lc(dknavy) lpattern(solid) clwidth(thick) ), legend(off) xtitle("Number of Infections per Capita") ytitle("Density") note(Mean (sd) of cases per capita = `temp1' (`temp2'))
graph export "$SocCap\drafts\figs\kdensity_casespc.pdf", as(pdf) replace

*spatial heterogeneity
ren county county2014
gen casesper1000=casespc*1000
maptile casesper1000, geo(county2014) twopt(title("")) legdecimals(2)
graph export "$SocCap\drafts\figs\maptile_casesper1000.pdf", as(pdf) replace

import excel using "$SocCap\data\social_capital_project.xlsx",clear firstrow sheet("county")
ren county county2014
destring county2014,replace
maptile CountyLevelIndex, geo(county2014) twopt(title("")) legdecimals(2)
graph export "$SocCap\drafts\figs\maptile_socialcapital.pdf", as(pdf) replace


*test on the growth rate from may to july 
insheet using "$SocCap\data\covid_counties.txt",clear
gen year=substr(date,1,4)
gen month=substr(date,6,2)
gen day=substr(date,-2,2)
destring year month day,replace
drop county
ren fips county
drop date state
merge m:1 county using "$SocCap\data\acs2014_2018.dta"
keep if _merge==3
drop _merge
gen casespc=cases/totpop
gen deathspc=deaths/totpop
egen tid=group(year month day)
tsset county tid
gen newcasespc=D.casespc
gen newdeathspc=D.deathspc
replace newcasespc=. if newcasespc==-1
replace newdeathspc=. if newdeathspc==-1
collapse (mean) newcasespc newdeathspc,by(county month)
gen group=1 if month==5
replace group=2 if month==7
drop if group==.
tsset county group
gen dlnewcasespc=(newcasespc-L.newcasespc)/L.newcasespc
gen dlnewdeathspc=(newdeathspc-L.newdeathspc)/L.newdeathspc
drop if group==1
replace dlnewcasespc=. if dlnewcasespc==-1
replace dlnewdeathspc=. if dlnewdeathspc==-1

winsor2 dlnewcasespc dlnewdeathspc,cuts(1 99) replace

sum dlnewcasespc dlnewdeathspc,d

twoway (kdensity dlnewcasespc, lc(dknavy) lpattern(solid) clwidth(thick) ), legend(off) xtitle("Number of Infections per Capita") ytitle("Density")

ren county county2014
maptile dlnewcasespc, geo(county2014) twopt(title("Growth in New Infections, May to July")) legdecimals(2)


*------------------------------ summary statistics

use "$SocCap\data\social_capital_project.dta",clear
merge 1:m county using "$SocCap\data\covid_jhu.dta"
keep if _merge==3
drop _merge
keep if month>=3
merge m:1 county using "$SocCap\data\acs2014_2018.dta"
keep if _merge==3
drop _merge
merge m:1 county month using "$SocCap\data\covid_counties_weekgrowth.dta"
keep if _merge==3
drop _merge
replace casespc=cases*100000/totpop

corr CountyLevelIndex casespc cases

global sumstats CountyLevelIndex FamilyUnity CommunityHealth InstitutionalHealth CollectiveEfficacy cases casespc deaths popdens age_under18 age_18_24 age_25_34 age_35_64 age_65pl race* educ_lesshs educ_hs educ_somecoll educ_coll educ_collpl male married poverty_under18 poverty_18_64 poverty_65pl

quietly estpost sum $sumstats if month==4 | month==5,d
est sto grp1
quietly estpost sum $sumstats if month==6 | month==7,d
est sto grp2
 

la var CountyLevelIndex "Social capital (index)"
la var FamilyUnity "Family unity (index)"
la var CommunityHealth "Community health (index)"
la var InstitutionalHealth "Institutional health (index)"
la var CollectiveEfficacy "Collective efficacy (index)"
la var cases "Infections"
la var casespc "Infections per 100,000"
la var deaths "Deaths"
la var popdens "Population Density"
la var age_under18 "Age Under 18, \%"
la var age_18_24 "Age 18-24, \%"
la var age_25_34 "Age 25-34, \%"
la var age_35_64 "Age 35-64, \%"
la var age_65pl "Age 65+, \%"
la var race_white "White, \%"
la var race_black "Black, \%"
la var educ_lesshs "Less than high school, \%"
la var educ_hs "High school, \%"
la var educ_somecoll "Some college, \%"
la var educ_coll "College, \%"
la var educ_collpl "Post-graduate, \%"
la var male "Male, \%"
la var married "Married, \%"
la var poverty_under18 "Poverty rate under 18, \%"
la var poverty_18_64 "Poverty rate 18-64, \%"
la var poverty_65pl "Poverty rate 65+, \%"
local dig2 "2 2 2 2 2 0 0 0 0 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2"
cd "$SocCap\drafts\tabs"
esttab grp1 grp2 using sumstats.tex, cells("mean(fmt(`dig2')) sd(fmt(`dig2' )) min(fmt(`dig2' )) max(fmt(`dig2' ))") mgroups("April to May" "June to July", pattern(1 1) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) label collabels("Mean" "SD" "Min" "Max")  nonum replace fragment 



esttab grp1 using sumstats.tex, cells("mean(fmt(`dig2')) sd(fmt(`dig2' )) min(fmt(`dig2' )) max(fmt(`dig2' ))") label collabels("Mean" "SD" "Min" "Max")  nonum replace fragment 


*------------------------------ baseline results


import excel using "$SocCap\data\social_capital_project.xlsx",clear firstrow sheet("county")
keep CountyLevelIndex FamilyUnity CommunityHealth InstitutionalHealth CollectiveEfficacy county
gen st=substr(county,1,2) if length(county)==5
replace st=substr(county,1,1) if length(county)==4
destring st county,replace
merge 1:m county using "$SocCap\data\covid_jhu.dta"
keep if _merge==3
drop _merge
keep if month>=3
merge m:1 county using "$SocCap\data\acs2014_2018.dta"
keep if _merge==3
drop _merge
merge m:1 month county using "$SocCap\data\covid_counties_weekgrowth.dta"
keep if _merge==3 | _merge==1
drop _merge
merge m:1 county using "$SocCap\data\chetty_socialcapital_county.dta"
keep if _merge==3
drop _merge
merge m:1 county using "$SocCap\data\facebook_JECsocialcapital.dta"
keep if _merge==3
drop _merge
merge m:1 county using "$SocCap\data\recs2010.dta"
keep if _merge==3
drop _merge
merge m:1 county using "$SocCap\data\realgdp_counties.dta"
keep if _merge==3
drop _merge
merge m:1 st using "$SocCap\data\covid_state_testing.dta"
keep if _merge==3
drop _merge
gen lcases=log(cases+1)
gen ldeaths=log(deaths+1)
gen lcasespc=log(casespc+1)
gen lpopdens=log(popdens+1)
gen lrealgdp=log(realgdp)
gen ltotaltestresults=log(totaltestresults)
gen pos_to_neg=positive/negative
egen tid=group(month day)
center CountyLevelIndex FamilyUnity CommunityHealth InstitutionalHealth CollectiveEfficacy socialcapitalindex,prefix(z_) standardize
gen z_CountyLevelIndex_highadherence=CountyLevelIndex*highadherence
gen z_CountyLevelIndex_highevangel=CountyLevelIndex*highevangel

*normalize to age 25-34, and high school graduate
global covidX lpopdens age_under18 age_18_24 age_35_64 age_65pl race* educ_lesshs educ_somecoll educ_coll educ_collpl male married poverty_under18 poverty_18_64 poverty_65pl

*motivating plot
corr lcases CountyLevelIndex
local corrtemp: di %3.2f r(rho)	
binscatter lcases CountyLevelIndex,ytitle("log(Number of Cases)") xtitle("Social Capital") note(Correlation = `corrtemp')
graph export "$SocCap\drafts\figs\binscatter_lcases_socialcap.pdf", as(pdf) replace
graph export "$SocCap\drafts\figs\binscatter_lcases_socialcap.png", as(png) replace

corr lcases CountyLevelIndex if day==27 & month==7 [aw=totpop]
local temp: di %3.2f r(rho)
twoway (lfitci lcases CountyLevelIndex if day==27 & month==7 [aw=totpop]) (scatter lcases CountyLevelIndex if day==27 & month==4 [aw=totpop], mcolor(%30)), ytitle("log(Number of Cases)") xtitle("Social Capital") legend(off) note(Correlation = `temp')
graph export "$SocCap\drafts\figs\scatter_lcases_socialcap.pdf", as(pdf) replace
graph export "$SocCap\drafts\figs\scatter_lcases_socialcap.png", as(png) replace

corr lcases married if day==27 & month==4 [aw=totpop]
local temp: di %3.2f r(rho)
twoway (lfitci lcases married if day==27 & month==4 [aw=totpop]) (scatter lcases married if day==27 & month==4 [aw=totpop], mcolor(%30)), ytitle("log(Number of Cases)") xtitle("Share of Married Households") legend(off) note(Correlation = `temp')
graph export "$SocCap\drafts\figs\scatter_lcases_marriage.pdf", as(pdf) replace
graph export "$SocCap\drafts\figs\scatter_lcases_marriage.png", as(png) replace

*outcome = log cases
reg lcases z_CountyLevelIndex,cluster(county)
estadd local hasX "No",replace
estadd local hasstt "No",replace
estadd local hasIV "No",replace
est sto temp1
reg lcases z_CountyLevelIndex $covidX,cluster(county)
estadd local hasX "Yes",replace
estadd local hasstt "No",replace
estadd local hasIV "No",replace
est sto temp2
reghdfe lcases z_CountyLevelIndex $covidX,a(st#tid) vce(cluster county)
estadd local hasX "Yes",replace
estadd local hasstt "Yes",replace
estadd local hasIV "No",replace
est sto temp3
*outcome = log deaths
reg ldeaths z_CountyLevelIndex,cluster(county)
estadd local hasX "No",replace
estadd local hasstt "No",replace
estadd local hasIV "No",replace
est sto temp4
reg ldeaths z_CountyLevelIndex $covidX,cluster(county)
estadd local hasX "Yes",replace
estadd local hasstt "No",replace
estadd local hasIV "No",replace
est sto temp5
reghdfe ldeaths z_CountyLevelIndex $covidX,a(st#tid) vce(cluster county)
estadd local hasX "Yes",replace
estadd local hasstt "Yes",replace
estadd local hasIV "No",replace
est sto temp6
*outcome = average week to week growth in a month
reg dlcase z_CountyLevelIndex,cluster(county)
estadd local hasX "No",replace
estadd local hasstt "No",replace
estadd local hasIV "No",replace
est sto temp7
reg dlcase z_CountyLevelIndex $covidX,cluster(county)
estadd local hasX "Yes",replace
estadd local hasstt "No",replace
estadd local hasIV "No",replace
est sto temp8

la var z_CountyLevelIndex "Social capital (z-score)"
la var lpopdens "log(Population Density)"
la var age_under18 "Age Under 18, \%"
la var age_18_24 "Age 18-24, \%"
la var age_35_64 "Age 35-64, \%"
la var age_65pl "Age 65+, \%"
la var race_white "White, \%"
la var race_black "Black, \%"
la var educ_lesshs "Less than High School, \%"
la var educ_somecoll "Some College, \%"
la var educ_coll "College, \%"
la var educ_collpl "Post-graduate, \%"
la var male "Male, \%"
la var married "Married, \%"
la var poverty_under18 "Poverty rate under 18, \%"
la var poverty_18_64 "Poverty rate 18-64, \%"
la var poverty_65pl "Poverty rate 65+, \%"
local tokeep "z_CountyLevelIndex lpopdens age_under18 age_18_24 age_35_64 age_65pl race_white race_black educ_lesshs educ_somecoll educ_coll educ_collpl male married poverty_under18 poverty_18_64 poverty_65pl"
cd "$SocCap\drafts\tabs"
esttab temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8 using baseline_cases_SocCap.tex, b(3) replace star(* 0.10 ** 0.05 *** 0.01)  mtitles("(1)" "(2)" "(3)" "(4)" "(5)" "(6)" "(7)" "(8)") nonum  brackets se mgroups("log(Number of Cases)" "log(Number of Deaths)" "Weekly Growth", pattern(1 0 0 1 0 0 1 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) label keep(`tokeep') order(`tokeep') stats(r2 N hasX hasstt, label("R-squared" "Sample Size" "Controls" "State x Day FE") fmt(2 0)) parentheses nolz nogaps fragment nolines prehead("Dep. var. = ") eqlabel(none) 

*robust to controlling for GDP and its growth?
reghdfe lcases z_CountyLevelIndex $covidX,a(st#tid) vce(cluster county)
reghdfe lcases z_CountyLevelIndex dlrealgdp $covidX,a(st#tid) vce(cluster county)

*robust to controlling for testing?
reg lcases z_CountyLevelIndex $covidX,cluster(county)
reg lcases z_CountyLevelIndex $covidX ltotaltestresults pos_to_neg,cluster(county)

*marriage and covid
reg lcases married lpopdens age_under18 age_18_24 age_35_64 age_65pl race* educ_lesshs educ_somecoll educ_coll educ_collpl male poverty_under18 poverty_18_64 poverty_65pl,cluster(county)
reg dlcases married lpopdens age_under18 age_18_24 age_35_64 age_65pl race* educ_lesshs educ_somecoll educ_coll educ_collpl male poverty_under18 poverty_18_64 poverty_65pl,cluster(county)

*what about social networks?
reg lcases z_CountyLevelIndex z_JECsocialSCInorm ,cluster(county)
reg lcases z_CountyLevelIndex z_JECsocialSCInorm $covidX,cluster(county)

*use as an IV
reghdfe lcases z_CountyLevelIndex $covidX,a(tid) vce(cluster county)
reghdfe lcases  $covidX (z_CountyLevelIndex=z_JECsocialSCInorm),a(tid) vce(cluster county) ffirst old
mat fstat=e(first)
estadd scalar fs=fstat[4,1]
reghdfe ldeaths  $covidX (z_CountyLevelIndex=z_JECsocialSCInorm),a(tid) vce(cluster county) ffirst old
reghdfe lcases  $covidX (z_CountyLevelIndex=z_JECsocialSCInorm),a(tid#st) vce(cluster county) ffirst old
mat fstat=e(first)
estadd scalar fs=fstat[4,1]

*robustness with other measures
reg lcases z_CountyLevelIndex,cluster(county)
estadd local hasX "No",replace
estadd local hasst "No",replace
estadd local hast "No",replace
estadd local hasIV "No",replace
est sto temp1
reg lcases z_CountyLevelIndex $covidX,cluster(county)
estadd local hasX "Yes",replace
estadd local hasst "No",replace
estadd local hast "No",replace
estadd local hasIV "No",replace
est sto temp2
reg lcases z_FamilyUnity,cluster(county)
estadd local hasX "No",replace
estadd local hasst "No",replace
estadd local hast "No",replace
estadd local hasIV "No",replace
est sto temp3
reg lcases z_FamilyUnity $covidX,cluster(county)
estadd local hasX "Yes",replace
estadd local hasst "No",replace
estadd local hast "No",replace
estadd local hasIV "No",replace
est sto temp4
reg lcases z_CommunityHealth,cluster(county)
estadd local hasX "No",replace
estadd local hasst "No",replace
estadd local hast "No",replace
estadd local hasIV "No",replace
est sto temp5
reg lcases z_CommunityHealth $covidX,cluster(county)
estadd local hasX "Yes",replace
estadd local hasst "No",replace
estadd local hast "No",replace
estadd local hasIV "No",replace
est sto temp6
reg lcases z_InstitutionalHealth,cluster(county)
estadd local hasX "No",replace
estadd local hasst "No",replace
estadd local hast "No",replace
estadd local hasIV "No",replace
est sto temp7
reg lcases z_InstitutionalHealth $covidX,cluster(county)
estadd local hasX "Yes",replace
estadd local hasst "No",replace
estadd local hast "No",replace
estadd local hasIV "No",replace
est sto temp8
reg lcases z_CollectiveEfficacy,cluster(county)
estadd local hasX "No",replace
estadd local hasst "No",replace
estadd local hast "No",replace
estadd local hasIV "No",replace
est sto temp9
reg lcases z_CollectiveEfficacy $covidX,cluster(county)
estadd local hasX "Yes",replace
estadd local hasst "No",replace
estadd local hast "No",replace
estadd local hasIV "No",replace
est sto temp10
reg lcases z_socialcapitalindex,cluster(county)
estadd local hasX "No",replace
estadd local hasst "No",replace
estadd local hast "No",replace
estadd local hasIV "No",replace
est sto temp11
reg lcases z_socialcapitalindex $covidX,cluster(county)
estadd local hasX "Yes",replace
estadd local hasst "No",replace
estadd local hast "No",replace
estadd local hasIV "No",replace
est sto temp12

la var z_CountyLevelIndex "Social capital"
la var z_FamilyUnity "Family unity"
la var z_CommunityHealth "Community health"
la var z_InstitutionalHealth "Institutional health"
la var z_CollectiveEfficacy "Collective efficacy"
la var z_socialcapitalindex "Chetty et al. (2014) "
local tokeep "z_CountyLevelIndex z_FamilyUnity z_CommunityHealth z_InstitutionalHealth z_CollectiveEfficacy z_socialcapitalindex"
cd "$SocCap\drafts\tabs"
esttab temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8 temp9 temp10 temp11 temp12 using robustmeasure_SocCap.tex, b(3) replace star(* 0.10 ** 0.05 *** 0.01)  mtitles("(1)" "(2)" "(3)" "(4)" "(5)" "(6)" "(7)" "(8)" "(9)" "(10)") nonum  brackets se mgroups("log(Number of Cases)" "Weekly Growth", pattern(1 0 0 0 0 0 0 0 0 0 0 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) label keep(`tokeep') order(`tokeep') stats(r2 N hasX hasst hast, label("R-squared" "Sample Size" "Controls" "State FE" "Day FE") fmt(2 0)) parentheses nolz nogaps fragment nolines prehead("Dep. var. = ") eqlabel(none)    



*heterogeneity with religion share
reg lcases z_CountyLevelIndex highadherence z_CountyLevelIndex_highadherence,cluster(county)
estadd local hasX "No",replace
estadd local hasst "No",replace
estadd local hast "No",replace
estadd local hasIV "No",replace
est sto temp1
reg lcases z_CountyLevelIndex highadherence z_CountyLevelIndex_highadherence $covidX,cluster(county)
estadd local hasX "Yes",replace
estadd local hasst "No",replace
estadd local hast "No",replace
estadd local hasIV "No",replace
est sto temp2







**IV needs some work
ivregress gmm lcases $covidX (z_CountyLevelIndex=sci_CountyLevelIndex),cluster(county)
reghdfe lcases $covidX (z_CountyLevelIndex=sci_CountyLevelIndex),a(st tid) vce(cluster county) old ffirst
estadd local hasX "Yes",replace
estadd local hasst "No",replace
estadd local hast "No",replace
estadd local hasIV "No",replace
est sto temp2


*------------------------------ heterogeneity by population density/income


import excel using "$SocCap\data\social_capital_project.xlsx",clear firstrow sheet("county")
keep CountyLevelIndex FamilyUnity CommunityHealth InstitutionalHealth CollectiveEfficacy county
gen st=substr(county,1,2) if length(county)==5
replace st=substr(county,1,1) if length(county)==4
destring st county,replace
merge 1:m county using "$SocCap\data\covid_jhu.dta"
keep if _merge==3
drop _merge
keep if month>=3
merge m:1 county using "$SocCap\data\acs2014_2018.dta"
keep if _merge==3
drop _merge
merge m:1 county month using "$SocCap\data\covid_counties_weekgrowth.dta"
keep if _merge==3
drop _merge
merge m:1 county using "$SocCap\data\chetty_socialcapital_county.dta"
keep if _merge==3
drop _merge
gen lcases=log(cases+1)
egen tid=group(month day)
center CountyLevelIndex FamilyUnity CommunityHealth InstitutionalHealth CollectiveEfficacy socialcapitalindex,prefix(z_) standardize
drop if hhincome==.
sum hhincome,d
gen highincome=cond(hhincome>`r(p50)',1,0)
sum popdens,d
gen highpopdens=cond(popdens>`r(p50)',1,0)
sum race_black,d
gen highrace_black=cond(race_black>`r(p50)',1,0)
sum married,d
gen highmarried=cond(married>`r(p50)',1,0)
gen highincome_CountyLevelIndex=z_CountyLevelIndex*highincome
gen highpopdens_CountyLevelIndex=z_CountyLevelIndex*highpopdens
gen highrace_black_CountyLevelIndex=z_CountyLevelIndex*highrace_black
gen highmarried_CountyLevelIndex=z_CountyLevelIndex*highmarried
gen lpopdens=log(popdens)

*keep only certain times
*keep if day==27 & month==4

*normalize to age 25-34, and high school graduate
global covidX lpopdens age_under18 age_18_24 age_35_64 age_65pl race* educ_lesshs educ_somecoll educ_coll educ_collpl male married poverty_under18 poverty_18_64 poverty_65pl

reghdfe lcases z_CountyLevelIndex $covidX,a(tid) vce(cluster county)
estadd local hasX "Yes",replace
estadd local hast "Yes",replace
est sto temp1
reghdfe lcases z_CountyLevelIndex highincome highincome_CountyLevelIndex $covidX,a(tid) vce(cluster county)
estadd local hasX "Yes",replace
estadd local hast "Yes",replace
est sto temp2
reghdfe lcases z_CountyLevelIndex highpopdens highpopdens_CountyLevelIndex $covidX,a(tid) vce(cluster county)
estadd local hasX "Yes",replace
estadd local hast "Yes",replace
est sto temp3
reghdfe lcases z_CountyLevelIndex highrace_black highrace_black_CountyLevelIndex $covidX,a(tid) vce(cluster county)
estadd local hasX "Yes",replace
estadd local hast "Yes",replace
est sto temp4
reghdfe dlcases z_CountyLevelIndex $covidX,a(tid) vce(cluster county)
estadd local hasX "Yes",replace
estadd local hast "Yes",replace
est sto temp5
reghdfe dlcases z_CountyLevelIndex highincome highincome_CountyLevelIndex $covidX,a(tid) vce(cluster county)
estadd local hasX "Yes",replace
estadd local hast "Yes",replace
est sto temp6
reghdfe dlcases z_CountyLevelIndex highpopdens highpopdens_CountyLevelIndex $covidX,a(tid) vce(cluster county)
estadd local hasX "Yes",replace
estadd local hast "Yes",replace
est sto temp7
reghdfe dlcases z_CountyLevelIndex highrace_black highrace_black_CountyLevelIndex $covidX,a(tid) vce(cluster county)
estadd local hasX "Yes",replace
estadd local hast "Yes",replace
est sto temp8

la var z_CountyLevelIndex "Social capital"
la var highincome "1[Income > Median]"
la var highincome_CountyLevelIndex "\quad $\times$ Social capital"
la var highpopdens "1[Density > Median]"
la var highpopdens_CountyLevelIndex "\quad $\times$ Social capital"
la var highrace_black "1[Black Share > Median]"
la var highrace_black_CountyLevelIndex "\quad $\times$ Social capital"
local tokeep "z_CountyLevelIndex highincome highincome_CountyLevelIndex highpopdens highpopdens_CountyLevelIndex highrace_black highrace_black_CountyLevelIndex"
cd "$SocCap\drafts\tabs"
esttab temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8 using heterog_socialcap.tex, b(3) replace star(* 0.10 ** 0.05 *** 0.01)  mtitles("(1)" "(2)" "(3)" "(4)" "(5)" "(6)" "(7)" "(8)" "(9)" "(10)") nonum  brackets se mgroups("log(Number of Cases)" "Weekly Growth", pattern(1 0 0 0 1 0 0 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) label keep(`tokeep') order(`tokeep') stats(r2 N hasX hast, label("R-squared" "Sample Size" "Controls" "Day FE") fmt(2 0)) parentheses nolz nogaps fragment nolines prehead("Dep. var. = ") eqlabel(none)    


*------------------------------ heterogeneity by time


import excel using "$SocCap\data\social_capital_project.xlsx",clear firstrow sheet("county")
keep CountyLevelIndex FamilyUnity CommunityHealth InstitutionalHealth CollectiveEfficacy county
gen st=substr(county,1,2) if length(county)==5
replace st=substr(county,1,1) if length(county)==4
destring st county,replace
merge 1:m county using "$SocCap\data\covid_jhu.dta"
keep if _merge==3
drop _merge
keep if month>=3
merge m:1 county using "$SocCap\data\acs2014_2018.dta"
keep if _merge==3
drop _merge
gen lcases=log(cases+1)
egen tid=group(month day)
center CountyLevelIndex FamilyUnity CommunityHealth InstitutionalHealth CollectiveEfficacy,prefix(z_) standardize
gen lpopdens=log(popdens)

*normalize to age 25-34, and high school graduate
global covidX lpopdens age_under18 age_18_24 age_35_64 age_65pl race* educ_lesshs educ_somecoll educ_coll educ_collpl male married poverty_under18 poverty_18_64 poverty_65pl


gen coef=.
gen se=.
quietly sum tid,d
quietly forval t=1/`r(max)'{
	reg lcases z_CountyLevelIndex $covidX if tid==`t',cl(county)
	replace coef=_b[z_CountyLevelIndex] if tid==`t'
	replace se=_se[z_CountyLevelIndex] if tid==`t'
}
collapse (mean) coef se,by(tid day month)
gen ub=coef+1.96*se
gen lb=coef-1.96*se
gen date=mdy(month,day,2020)
format date %td

twoway (bar coef date) (rcap ub lb date), xtitle("") legend(off) ytitle("Elasticity of Infections to Social Capital Index") xlabel(, angle(45) valuelabel) 
graph export "$SocCap\drafts\figs\soccap_elasticity_byday.pdf", as(pdf) replace

*------------------------------------- clean NYT covid data

*obtain the latest version of the NYT data
*https://github.com/nytimes/covid-19-data/blob/master/us-counties.csv

insheet using "$SocCap\data\covid_counties.txt",clear
gen year=substr(date,1,4)
gen month=substr(date,6,2)
gen day=substr(date,-2,2)
destring year month day,replace
drop county
ren fips county
drop date state
collapse (sum) cases deaths,by(year month day)
gen date=mdy(month,day,year)
format date %td



import excel using "$SocCap\data\covid_counties.xlsx",clear firstrow sheet("data")
drop county
gen day=day(date)
gen month=month(date)
ren fips county
drop if county==.
keep county day month cases deaths
save "$SocCap\data\covid_counties.dta",replace
keep if day==27 & month==4 // originally done on 4/17/2020
save "$SocCap\data\covid_counties_latest.dta",replace

use "$SocCap\data\covid_jhu.dta",clear
keep if month>=3
run "$SocCap\analysis\getweek.do"
gen tokeep=0
replace tokeep=1 if month==3 & day==7
replace tokeep=1 if month==3 & day==14
replace tokeep=1 if month==3 & day==21
replace tokeep=1 if month==3 & day==28
replace tokeep=1 if month==4 & day==4
replace tokeep=1 if month==4 & day==11
replace tokeep=1 if month==4 & day==18
replace tokeep=1 if month==4 & day==25
replace tokeep=1 if month==5 & day==2
replace tokeep=1 if month==5 & day==9
replace tokeep=1 if month==5 & day==16
replace tokeep=1 if month==5 & day==23
replace tokeep=1 if month==7 & day==4
replace tokeep=1 if month==7 & day==11
replace tokeep=1 if month==7 & day==18
replace tokeep=1 if month==7 & day==27
keep if tokeep==1
collapse (mean) cases,by(county week month)
tsset county week
gen dlcases=(cases-L.cases)/L.cases
replace dlcases=. if dlcases==0 | dlcases==-1
winsor2 dlcases,trim cuts(1 99) replace
collapse dlcases,by(county month)
save "$SocCap\data\covid_counties_weekgrowth.dta",replace


use "$SocCap\data\covid_counties.dta",clear
keep if month>=3


stset cases
streg, distribution(weibull) time coeflegend


*get the testing data for states: https://covidtracking.com/api
insheet using "$SocCap\data\covid_state_testing.csv",clear
run "$SocCap\analysis\state_fips_cwalk.do"
keep st positive negative grade totaltestresults
drop if st==99
save "$SocCap\data\covid_state_testing.dta",replace


*------------------------------------- clean facebook SCI

insheet using "$SocCap\data\county_county_data.tsv",clear
replace scaled_sci=. if user_county==fr_county
bysort user_county: egen totSCI=sum(scaled_sci)
gen norm_sci=scaled_sci/totSCI
keep user_county fr_county norm_sci scaled_sci
save "$SocCap\data\county_county_data.dta",replace

import excel using "$SocCap\data\social_capital_project.xlsx",clear firstrow sheet("county")
keep CountyLevelIndex FamilyUnity CommunityHealth InstitutionalHealth CollectiveEfficacy county
center CountyLevelIndex,prefix(z_) standardize
destring county,replace
ren county fr_county
merge 1:m fr_county using "$SocCap\data\county_county_data.dta"
keep if _merge==3
drop _merge
gen z_JECsocialSCI=z_CountyLevelIndex*scaled_sci/100
gen z_JECsocialSCInorm=z_CountyLevelIndex*norm_sci
collapse (mean) z_JECsocialSCI (sum) z_JECsocialSCInorm,by(user_county)
ren user_county county
save "$SocCap\data\facebook_JECsocialcapital.dta",replace



*------------------------------------- clean social explorer

*https://www.socialexplorer.com/tables/ACS2018_5yr/R12528551
quietly infile using "$SocCap\data\acs2014_2018dic.dct", using("$SocCap\data\acs2014_2018data.txt") clear
ren FIPS county
destring county,replace
ren A00001_001 totpop
gen popdens=totpop/A00003_001
gen male=A02001_002/A02001_001
gen age_under18=(A01001_002+A01001_003+A01001_004+A01001_005)/A01001_001
gen age_18_24=A01001_006/A01001_001
gen age_25_34=A01001_007/A01001_001
gen age_35_64=(A01001_008+A01001_009+A01001_010)/A01001_001
gen age_65pl=(A01001_011+A01001_012+A01001_013)/A01001_001
gen race_white=A03001_002/A03001_001
gen race_black=A03001_003/A03001_001
gen married=A11001_003/A11001_001
gen divorced=A11001_006/A11001_001
gen educ_lesshs=A12001_002/A12001_001
gen educ_hs=A12001_003/A12001_001
gen educ_somecoll=A12001_004/A12001_001
gen educ_coll=A12001_005/A12001_001
gen educ_collpl=(A12001_006+A12001_007+A12001_008)/A12001_001
gen poverty_under18=A13003A_002/A13003A_001
gen poverty_18_64=A13003B_002/A13003B_001
gen poverty_65pl=A13003C_002/A13003C_001
ren A14006_001 hhincome
ren A14024_001 pcincome
ren A14028_001 gini
keep county totpop popdens male age* race* married divorced educ* poverty* hhincome pcincome gini
save "$SocCap\data\acs2014_2018.dta",replace

*---------------------------------------------------- clean BEA GDP

*used data to columns to get rid of the "" in the county variable
insheet using "$SocCap\data\CAGDP9__ALL_AREAS_2001_2018.csv",clear
drop geoname region tablename linecode unit
keep if indname=="All industry total"
reshape long _,i(county) j(year)
ren _ realgdp
tsset county year
gen dlrealgdp=(realgdp-L.realgdp)/L.realgdp
keep if year==2018
drop year
la var realgdp "Real GDP in 2018, 2012 prices"
save "$SocCap\data\realgdp_counties.dta",replace

*---------------------------------------------------- clean social capital, religion and chetty data

import excel using "$SocCap\data\social_capital_project.xlsx",clear firstrow sheet("county")
keep CountyLevelIndex FamilyUnity CommunityHealth InstitutionalHealth CollectiveEfficacy county
gen st=substr(county,1,2) if length(county)==5
replace st=substr(county,1,1) if length(county)==4
destring st county,replace
save "$SocCap\data\social_capital_project.dta",replace

insheet using "$SocCap\data\chetty_online_table8.csv",clear
keep socialcapitalindex cz czname
quietly sum socialcapitalindex,d
gen socialcapitalhigh=cond(socialcapitalindex>`r(p50)',1,0)
save "$SocCap\data\chetty_online_table8.dta",replace

use "$SocCap\data\dorn_cw_cty_czone.dta",clear
renvars czone cty_fips \ cz county
merge m:1 cz using "$faith\data\chetty_online_table8.dta"
keep if _merge==3
drop _merge
save "$SocCap\data\chetty_socialcapital_county.dta",replace
 

*2010 religion: https://www.socialexplorer.com/tables/RCMS_2010/R12159586
quietly infile using "$SocCap\data\recs2010dic.dct", using("$SocCap\data\recs2010data.txt") clear
ren NV009_001 sh_adherence_all
ren NV010_002 sh_adherence_evangel
gen sh_adherence_protest=NV010_003+NV010_004
ren NV010_005 sh_adherence_catholic
ren NV010_006 sh_adherence_orthodox
ren FIPS county
destring county,replace
keep county sh_*
quietly sum sh_adherence_all,d
gen highadherence=cond(sh_adherence_all>`r(p50)',1,0)
quietly sum sh_adherence_evangel,d
gen highevangel=cond(sh_adherence_evangel>`r(p50)',1,0)
save "$SocCap\data\recs2010.dta",replace




