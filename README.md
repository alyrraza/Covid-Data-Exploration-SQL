# **COVID-19 Data Exploration Project**

## **Languages and Tools Used**
*SQL, VSCode, GitHub*

In this project, I have written several SQL queries to explore various aspects of COVID-19 data. Below are the descriptions of each query.

### **Query 1: Initial COVID-19 Cases Data**

**Description:**
This query retrieves the location, date, total cases, new cases, and population from the `covidvacinations` table where the total cases are greater than 50. The results are ordered by location and date.

### **Query 2: Percentage of Total Cases Over Total Deaths**

**Description:**
This query calculates the percentage of total cases over total deaths for locations containing 'Kingdom' in their name. It retrieves the location, date, total cases, total deaths, and the calculated percentage from the `covidvacinations` table. Results are filtered for total cases greater than 50 and ordered by location and date.

### **Query 3: Total Cases Over Population**

**Description:**
This query calculates the percentage of total cases over the population for locations containing 'Kingdom' in their name. It retrieves the location, total cases, population, and the calculated percentage from the `covidvacinations` table. Results are ordered by the number of total cases in descending order.

### **Query 4: Countries with Highest Infection Rate**

**Description:**
This query identifies the countries with the highest infection rates by retrieving the maximum total cases for each location. It filters out locations with null continents and orders the results by the maximum number of total cases in descending order.

### **Query 5: Highest Infection Rate by Continent**

**Description:**
This query identifies the continents with the highest infection rates by retrieving the maximum total cases for each continent. It filters out null continents and orders the results by the maximum number of total cases in descending order.

### **Query 6: Null Continent Infection Data**

**Description:**
This query retrieves the maximum total cases for locations with null continents from the `covidvacinations` table. It groups the results by continent and orders them by the maximum number of total cases in descending order.

### **Query 7: Total Population vs. Vaccination**

**Description:**
This query analyzes the relationship between the total population and the number of vaccinations administered across different locations and continents. The goal is to track the cumulative number of vaccinations over time for each location.

1. **Data Source and Tables Involved**:
   - `covidvacinations`: Contains data on COVID-19 cases, deaths, and vaccinations.
   - `covidDeaths`: Contains detailed data on new vaccinations.

2. **Joins and Filters**:
   - The query performs an inner join between the `covidvacinations` and `covidDeaths` tables on matching `location` and `date` columns.
   - It filters out records with null continent values to focus on valid geographical regions.

3. **Calculations**:
   - The cumulative sum of new vaccinations is calculated using the `SUM() OVER` window function, partitioned by location and ordered by date. This provides a running total of vaccinations for each location.

4. **Columns Retrieved**:
   - `continent`: The continent to which the location belongs.
   - `location`: The specific location (country or region).
   - `date`: The date of the recorded data.
   - `population`: The
