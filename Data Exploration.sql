SELECT location, date, total_cases, new_cases, population
from covidvacinations
where total_cases IS NOT NULL and total_cases > 50
order by 1, 2
limit 20



--Percentage of total Cases over total Deaths
SELECT location, date, total_cases, total_deaths, (total_cases/total_deaths)*100 as percentage
from covidvacinations
where total_cases IS NOT NULL and total_cases > 50
and location Like '%Kingdom%'
order by 1, 2
limit 20




--total cases over population
SELECT location, total_cases, population, (total_cases/population)*100 as percentage
from covidvacinations
where total_cases IS NOT NULL 
and location Like '%Kingdom%'
order by 2 desc
limit 20



-- looking at Countries with Highest Infection rate
SELECT location, MAX(total_cases) as MAX_DEATH
from covidvacinations
where total_cases IS NOT NULL 
and continent is not NULL
GROUP BY location
order by MAX_DEATH desc
limit 20




--LOOKING AT CONTINENT
SELECT CONTINENT, MAX(total_cases) as MAX_DEATH
from covidvacinations
where total_cases IS NOT NULL
and continent is not NULL
GROUP BY continent
order by MAX_DEATH desc
limit 20




--NULL CONTINENT
SELECT CONTINENT, MAX(total_cases) as MAX_DEATH
from covidvacinations
where total_cases IS NOT NULL
and continent is  NULL
GROUP BY continent
order by MAX_DEATH desc





--Total population vs Vaccination 
SELECT covidV.continent, covidV.location, covidV.date, covidV.population ,covidD.new_vaccinations,
SUM( covidD.new_vaccinations) OVER (partition by covidV.location
order by covidV.location, covidV.date) as Total_vaccinaton
from covidvacinations covidV
join covidDeaths covidD on 
covidD.location = covidV.location and
covidD.date = covidV.date
where covidV.continent is not NULL
order by 2,3 desc
limit 100

with table1 (Continent, Location, date, population, new_vaccinations, Total_vaccinaton)
as 
(
    SELECT covidV.continent, covidV.location, covidV.date, covidV.population ,covidD.new_vaccinations,
    SUM( covidD.new_vaccinations) OVER (partition by covidV.location
    order by covidV.location, covidV.date) as Total_vaccinaton
    from covidvacinations covidV
    join covidDeaths covidD on 
    covidD.location = covidV.location and
    covidD.date = covidV.date
    where covidV.continent is not NULL and covidD.new_vaccinations is NOT NULL
    order by 2,3 desc
    limit 100
)

SELECT *, (Total_vaccinaton/population)*100 
from table1
