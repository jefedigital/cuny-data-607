
*** WVS 2016-2020 and COVID-19 infection Aug 6**

 use "C:\Users\Cary\Dropbox\2020 - Social capital and COVID\data\WVS_Cross-National_Wave_7_stata_v1_2.dta" 
 
  gen countrycode= B_COUNTRY
 
 merge m:1 countrycode using "C:\Users\Cary\Dropbox\2020 - Social capital and COVID\data\covid_global_aug6.dta" 
 
 
 
 
***socila capital measures **

**social trust**
recode Q57 (2=0), gen(gtrust)

**country level

by countrycode, sort: egen cgtrust=mean(gtrust)

**political trust
 gen ptrust=4- Q71
 
 by countrycode, sort: egen cptrust=mean(ptrust)

***social activisim**

gen sactivism= 12-(Q213+ Q214 +Q215+ Q216)

by countrycode, sort: egen csactivism=mean(sactivism)

 ***political participation
gen pparticipation= 12-(Q209+ Q210+ Q211+ Q212)

by countrycode, sort: egen cpparticipation=mean(pparticipation)



*** keep only country level variables**


keep v2x_genpp v2x_gencl v2x_gender v2x_corr v2cafexch v2cafres v2peasbgen v2peasjgen v2clgencl v2peasjsoecon v2peapsecon v2pehealth v2peedueq v2pepwrgen v2pepwrses v2mebias v2mecenefi v2mecenefm v2csrlgrep v2clrelig v2clacfree v2clsocgrp v2clacjust v2cltrnslw v2juaccnt v2exthftps v2excrptps v2xeg_eqdr v2x_cspart v2xcl_rol v2xel_frefair v2x_frassoc_thick v2x_freexp_altinf v2x_egaldem v2x_delibdem v2x_partipdem v2x_libdem v2x_polyarchy migrationrate mobphone internetusers schoolgpi femchoutsch choutsch internetusers Refugeesorigin homiciderate lifeexpectHDI humanineqiality incomeindexHDI hdi womenparl dgi gii compulseduc educationHDI meanschooling medageun educationexp healthexp Trade militaryexp easeofbusiness co2percap co2emis renewelectr accesselectr unemploytotal unemploymale unemployfem deathrate laborforce urbanpop popgrowth lifeexpect popWB2019 incrichest10p giniWB GDPpercap2 GDPpercap1 landWB incomeWB regionWB btiregime btigoveperform btigovindex btimarket btiintegration btistability btiruleoflaw btipolpart btistate btidemstatus btistatus btiregion electintegr corrupttransp regtype durable polity Y002 Y001 B_COUNTRY A_WAVE A_STUDY B_COUNTRY_ALPHA C_COW_NUM C_COW_ALPHA A_YEAR cpparticipation pparticipation csactivism sactivism cptrust ptrust cgtrust gtrust coviddeaths covidcases countyname countrycode


**
drop gtrust ptrust sactivism pparticipation Y001 Y002
