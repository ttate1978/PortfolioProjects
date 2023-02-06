
Exploring COVID Dateset


select * from covid_deaths;

Select * from covid_vaccinations;

-- Data points/Fields to use for portfolio project

Select location,date, total_cases, new_cases, total_deaths, population from covid_deaths order by 1,2; 

-- A look at Total Cases vs Total Deaths
-- Query structured to show the likelihood of death from after being infected with COVID by Country

Select location,date, total_cases, total_deaths,(total_deaths/total_cases)*100 as DeathPercentage  from covid_deaths order by 1,2;

-- A look at total cases vs Population
-- A look at the percentage of a population infected with COVID

Select location,date,population, total_cases, (total_cases/population)*100 as PercentPopulationInfected from covid_deaths where location= 'United States' order by 1,2;

Select location,date,population, total_cases from covid_deaths where location= 'United States' order by 1,2;

-- A look at countries with the highest infection rates compared to their populations
-- There may be an alternative way to structure a query to see the same result, however, this is what I could do to date

Select location,population, max(total_cases) as HighestInfectionCount,max((total_cases/population))*100 as PercentPopulationInfected from covid_deaths group by Location,population order by PercentPopulationInfected desc;

Select location, date,total_cases, population from covid_deaths where location = 'United States' order by 2 desc;

Select location, date, (total_cases), population, (total_cases/population)*100 as PercentagePopulationInfected from covid_deaths;

-- A look at countries with highest death count per population
-- A look at locations and a count of deaths of COVID patients (TT)
-- A look at deaths by Continent

Select location, max(total_deaths) as TotalDeathCount from covid_deaths group by location order by TotalDeathCount desc;

select location, sum(total_deaths) from covid_deaths where location = 'United States' group by location;

select continent, sum(total_deaths) from covid_deaths where continent is not null group by continent;

select location, sum(total_deaths) from covid_deaths where continent is null group by location;

-- A look at Continents with the highest Death Counts per population 

select continent, sum(total_deaths),(total_deaths/total_cases)*100 as DeathPercentage from covid_deaths where continent is not null group by continent, DeathPercentage; 

select continent,population, sum(total_deaths),(total_deaths/total_cases)*100 as DeathPercentage from covid_deaths where continent is not null group by continent, DeathPercentage, population;

select continent,total_cases, sum(total_deaths) as DeathCount,(total_deaths/total_cases)*100 as DeathPercentage from covid_deaths where continent is not null group by continent,total_cases, DeathPercentage; 


-- Global Numbers

select date,continent, sum(new_cases) as AllCases,total_deaths as DeathCount from covid_deaths where continent is not null group by total_deaths,continent, date;

-- A look at Worldwide COVID Vaccinations
-- & a combination of two tables

select* from covid_vaccinations;

select * from covid_deaths as CD join covid_vaccinations as CV on CD.location=CV.location and CD.date=CV.date;

select CD.continent, CD.location,CD.date,CD.population,CV.new_vaccinations from covid_deaths as CD join covid_vaccinations as CV on CD.location=CV.location and CD.date=CV.date where CD.continent is not null order by 1,2,3;