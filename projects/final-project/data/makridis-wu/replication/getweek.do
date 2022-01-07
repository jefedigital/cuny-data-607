

gen week=.
replace week=1 if month==3 & day>=1 & day<=7
replace week=2 if month==3 & day>=8 & day<=14
replace week=3 if month==3 & day>=15 & day<=21
replace week=4 if month==3 & day>=22 & day<=28
replace week=5 if month==3 & day>=29 & day<=31
replace week=5 if month==4 & day>=1 & day<=4
replace week=6 if month==4 & day>=5 & day<=11
replace week=7 if month==4 & day>=12 & day<=18
replace week=8 if month==4 & day>=19 & day<=25
replace week=9 if month==4 & day>=26 & day<=30
replace week=9 if month==5 & day>=1 & day<=2
replace week=10 if month==5 & day>=3 & day<=9
replace week=11 if month==5 & day>=10 & day<=16
replace week=12 if month==5 & day>=17 & day<=23
replace week=13 if month==5 & day>=24 & day<=30
replace week=14 if month==5 & day==31
replace week=14 if month==6 & day>=1 & day<=6
replace week=15 if month==6 & day>=7 & day<=13
replace week=16 if month==6 & day>=14 & day<=20
replace week=17 if month==6 & day>=21 & day<=27
replace week=18 if month==6 & day>=28 & day<=30
replace week=18 if month==7 & day>=1 & day<=4
replace week=19 if month==7 & day>=5 & day<=11
replace week=20 if month==7 & day>=12 & day<=18
replace week=21 if month==7 & day>=19 & day<=25
replace week=22 if month==7 & day>=26 & day<=31
replace week=22 if month==8 & day==1
