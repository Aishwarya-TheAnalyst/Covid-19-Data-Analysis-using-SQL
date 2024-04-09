/*
------------------------------------Covid 19 - Data Exploration-----------------------------------------

Date Range : 3rd January, 2020 to 9th May, 2023
*/

#Checking for duplicate values 
SELECT date, continent, location, COUNT(*) as Checking_Dup
FROM coviddeaths
GROUP BY date, continent, location
HAVING Checking_Dup > 1;

SELECT date, continent, location, COUNT(*) as Checking_Dup
FROM covidvaccinations
GROUP BY date, continent, location
HAVING Checking_Dup > 1;

#Total Deaths
SELECT max(total_deaths) AS total_deaths
FROM coviddeaths;

#Total Cases
SELECT max(total_cases) AS total_cases
FROM coviddeaths;

#Total number of rows:
select count(*) from coviddeaths;
select count(*) from covidvaccinations;

#Datewise likelihood of mortality due to covid - Totalcases vs totaldeath in india
select date,total_cases,total_deaths from coviddeaths where location like '%india%';

#Total deaths % out of entire population in Idia
 select location,max(total_deaths)/ avg(population)*100 as Death_Percentage from coviddeaths where location like '%india%';
 

#1. What is the cumulative number of deaths for each location or Country?
select location, max(total_deaths) as TotalDeathCount from coviddeaths
where continent != ''
Group by location
Order by TotalDeathCount desc;

#2. What is the total number of deaths for each continent?
select continent, max(total_deaths) as TotalDeathCount from coviddeaths
where continent!=''
Group by continent
Order by TotalDeathCount desc;

#3. What it is the total count of COVID-19 cases within a specific continent
select location, max(total_cases) as HighestInfectionCount from coviddeaths where continent='' group by location order by HighestInfectionCount desc;

#4. What is the distribution of COVID-19 cases across different regions or countries? Which regions have been most affected by the pandemic?
SELECT location, max(total_cases) AS total_cases
FROM coviddeaths
where continent != ''
GROUP BY location
ORDER BY total_cases DESC;

#5.  Which is the country with the highest infection rate in comparison to population
select location, max(total_deaths)/avg(population)*100 as Death_percentage from coviddeaths group by location order by Death_percentage desc;
 
#6. How many total cases, deaths, and recoveries have been recorded in the dataset, and what are the corresponding death and recovery rates?
Select SUM(new_cases) as TotalCases,
SUM(new_deaths) as TotalDeaths,
SUM(new_cases)/SUM(new_deaths)*100 as DeathPercentage,
SUM(new_cases) - SUM(new_deaths) as TotalRecovered,
COUNT(Distinct location) as TotalLocations
from coviddeaths
where continent!='';

#7. Which countries have administered at least one dose of COVID-19 vaccination, and what is the count of vaccinated individuals in each country?
SELECT location, SUM(people_vaccinated) AS vaccinated_with_at_least_one_dose
FROM covidvaccinations
WHERE continent != ''
GROUP BY location;


#8. What are the top 5 countries most affected by the COVID-19 pandemic, considering their geographical locations?
Select  Location, Population, max(total_cases) as HighestInfectionCount, max((total_cases/population))*100 as PercentPopulationInfected
from coviddeaths
group by Location, Population
Order by  PercentPopulationInfected desc
LIMIT 5;

#9. what is the total number of vaccinations administered in each of country?

SELECT location, SUM(total_vaccinations) AS full_vaccinations
FROM covidvaccinations
WHERE people_fully_vaccinated > 0
GROUP BY location;

#10. which Countries have Highest Hospitalized Patients?
SELECT location, SUM(hosp_patients) AS total_hosp_patients
FROM coviddeaths
GROUP BY location
ORDER BY total_hosp_patients DESC
LIMIT 10;
