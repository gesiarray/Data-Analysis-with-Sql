select *
from SqlProjects..coviddeath
order by 3, 4

--select *
--from SqlProjects..covidvaccination
--order by 3, 4

--Selecting data to be used

select location, date, total_cases, new_cases,total_deaths,population
from SqlProjects..coviddeath
order by 1, 2

-- what is the percentage of deaths from the total number of infected
select location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as deathpercent
from SqlProjects..coviddeath
where location like '%nigeria%'
order by 1, 2

--percentage of the population with covid
select location, date, total_cases,population, (total_cases/population)*100 as covidcasepercentage
from SqlProjects..coviddeath
--where location like '%nigeria%'
--order by 1, 2

--countries with highest infection rate compared to population
select location, population, max(total_cases) as max_totalcases, max((total_cases/population))*100 as highestinfectedcountry
from SqlProjects..coviddeath
group by location, population
order by highestinfectedcountry desc


-- Showing countries with the highest death rate per population
select location,population,max(cast(total_deaths as int)) as max_totaldeaths, max((total_deaths/population))*100 as deaths_per_population
from SqlProjects..coviddeath
group by location, population
order by deaths_per_population desc

-- showing continents with highest death count
select continent, max(cast(total_deaths as int)) as max_deaths 
from SqlProjects..coviddeath
where continent is not null
group by continent
order by 2


--showing global numbers for new cases, new deaths and death rate
select date, sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as deathpercentage
from SqlProjects..coviddeath
where continent is not null
group by date
order by 1, 2

-- selecting world covid death rate
select sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as deathpercentage
from SqlProjects..coviddeath
where continent is not null





