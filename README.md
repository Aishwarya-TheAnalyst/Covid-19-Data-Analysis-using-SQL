# Covid-19-Data-Exploration-using-SQL


The global impact of the COVID-19 pandemic has been profound, resulting in significant loss of life and widespread disruption. The selection of this dataset was motivated by the desire to meticulously examine and analyze the data, particularly focusing on countries with the highest mortality rates among infected individuals. Additionally, the objective is to ascertain the percentage of population affected by the virus and the corresponding vaccination coverage aimed at combatting its spread. This formal approach aims to glean valuable insights into the pandemic's effects and the effectiveness of mitigation efforts on a global scale.

<img  align="right" src="https://d.newsweek.com/en/full/2312119/covid-evolution.png?w=1600&h=900&q=88&f=f5fb873dbdfd386fd9a26c6e23a73efd"  width=400 align="Center">

### Dataset
The source for the data is: https://ourworldindata.org/covid-deaths

The dataset includes data on number of new cases,daily number of vaccinations, deaths across different regions etc.

### Technologies used ⚙️
 <p> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/mysql/mysql-original-wordmark.svg" alt="mysql" width="65" height="65"/> </p>   

## Data Exploration 

After performing exploratory data analysis, I formulated and addressed specific questions through thorough examination of the dataset.


##### 1. What is the cumulative number of deaths for each location or Country?

select location, max(total_deaths) as TotalDeathCount from coviddeaths
where continent != ''
Group by location
Order by TotalDeathCount desc;

<img src="https://github.com/Aishwarya-TheAnalyst/Covid-19-Data-Exploration-using-SQL/blob/main/Images/Total%20deaths%20by%20country.JPG">

##### 2. What is the total number of deaths for each continent?
select continent, max(total_deaths) as TotalDeathCount from coviddeaths
where continent!=''
Group by continent
Order by TotalDeathCount desc;

<img src="https://github.com/Aishwarya-TheAnalyst/Covid-19-Data-Exploration-using-SQL/blob/main/Images/Total%20Deaths%20by%20Continent.JPG">


##### 3. What it is the total count of COVID-19 cases for continents

select location, max(total_cases) as HighestInfectionCount from coviddeaths where continent='' group by continent,location order by HighestInfectionCount desc;

<img src="https://github.com/Aishwarya-TheAnalyst/Covid-19-Data-Exploration-using-SQL/blob/main/Images/Covid%20cases%20by%20continent.JPG">

##### 4. What is the distribution of COVID-19 cases across different regions or countries? Which regions have been most affected by the pandemic?
SELECT location, max(total_cases) AS total_cases
FROM coviddeaths
where continent != ''
GROUP BY location
ORDER BY total_cases DESC;

<img src="https://github.com/Aishwarya-TheAnalyst/Covid-19-Data-Exploration-using-SQL/blob/main/Images/Covid%20cases%20by%20location.JPG">

##### 5.  Which is the country with the highest infection rate in comparison to population

select location, max(total_deaths)/avg(population)*100 as Death_percentage from coviddeaths group by location order by Death_percentage desc;

<img src="https://github.com/Aishwarya-TheAnalyst/Covid-19-Data-Exploration-using-SQL/blob/main/Images/Highest%20Infection%20Rate%20by%20Countries.JPG">

##### 6. How many total cases, deaths, and recoveries have been recorded in the dataset, and what are the corresponding death and recovery rates?

Select SUM(new_cases) as TotalCases,
SUM(new_deaths) as TotalDeaths,
SUM(new_cases)/SUM(new_deaths)*100 as DeathPercentage,
SUM(new_cases) - SUM(new_deaths) as TotalRecovered,
COUNT(Distinct location) as TotalLocations
from coviddeaths
where continent!='';

<img src="https://github.com/Aishwarya-TheAnalyst/Covid-19-Data-Exploration-using-SQL/blob/main/Images/Death%20and%20Recovery%20Rate.JPG">

##### 7. Which countries have administered at least one dose of COVID-19 vaccination, and what is the count of vaccinated individuals in each country?

SELECT location, SUM(people_vaccinated) AS vaccinated_with_at_least_one_dose
FROM covidvaccinations
WHERE continent != ''
GROUP BY location;

<img src="https://github.com/Aishwarya-TheAnalyst/Covid-19-Data-Exploration-using-SQL/blob/main/Images/At%20least%20one%20dose.JPG">

##### 8. What are the top 5 countries most affected by the COVID-19 pandemic, considering their geographical locations?

Select  Location, Population, max(total_cases) as HighestInfectionCount, max((total_cases/population))*100 as PercentPopulationInfected
from coviddeaths
group by Location, Population
Order by  PercentPopulationInfected desc
LIMIT 5;

<img src="https://github.com/Aishwarya-TheAnalyst/Covid-19-Data-Exploration-using-SQL/blob/main/Images/Top%205%20Countries%20affected%20by%20Covid%2019.JPG">

##### 9. what is the total number of vaccinations administered in each of country?

SELECT location, SUM(total_vaccinations) AS full_vaccinations
FROM covidvaccinations
WHERE people_fully_vaccinated > 0
GROUP BY location;

<img src="https://github.com/Aishwarya-TheAnalyst/Covid-19-Data-Exploration-using-SQL/blob/main/Images/Full%20Vaccinations%20in%20each%20country.JPG">

##### 10. which Countries have Highest Hospitalized Patients?

SELECT location, SUM(hosp_patients) AS total_hosp_patients
FROM coviddeaths
GROUP BY location
ORDER BY total_hosp_patients DESC
LIMIT 10;

<img src="https://github.com/Aishwarya-TheAnalyst/Covid-19-Data-Exploration-using-SQL/blob/main/Images/Highest%20Hospitalized%20Patients.JPG">


   
