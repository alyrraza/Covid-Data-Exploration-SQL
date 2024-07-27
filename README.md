# **COVID-19 Data Exploration Project**

## **Languages and Tools Used**
*SQL, VSCode, GitHub*

In this project, I have written several SQL queries to explore various aspects of COVID-19 data. Below are the descriptions of each query.

### **Query 1: Initial COVID-19 Cases Data**

**Description:**
This query retrieves the location, date, total cases, new cases, and population from the `covidvacinations` table where the total cases are greater than 50. The results are ordered by location and date.

<img width="532" alt="image" src="https://github.com/user-attachments/assets/2bdd2b90-4206-41d2-875d-e6c797f8fa4f">


### **Query 2: Percentage of Total Cases Over Total Deaths**

**Description:**
This query calculates the percentage of total cases over total deaths for locations containing 'Kingdom' in their name. It retrieves the location, date, total cases, total deaths, and the calculated percentage from the `covidvacinations` table. Results are filtered for total cases greater than 50 and ordered by location and date.

<img width="566" alt="image" src="https://github.com/user-attachments/assets/1d1a93ad-1e4e-439a-b221-bcaecb810c42">


### **Query 3: Total Cases Over Population**

**Description:**
This query calculates the percentage of total cases over the population for locations containing 'Kingdom' in their name. It retrieves the location, total cases, population, and the calculated percentage from the `covidvacinations` table. Results are ordered by the number of total cases in descending order.

<img width="458" alt="image" src="https://github.com/user-attachments/assets/8118713f-2849-4186-b812-d56f6094c013">


### **Query 4: Countries with Highest Infection Rate**

**Description:**
This query identifies the countries with the highest infection rates by retrieving the maximum total cases for each location. It filters out locations with null continents and orders the results by the maximum number of total cases in descending order.

<img width="177" alt="image" src="https://github.com/user-attachments/assets/71e7beeb-f46a-42ea-900f-caafe9773679">


### **Query 5: Highest Infection Rate by Continent**

**Description:**
This query identifies the continents with the highest infection rates by retrieving the maximum total cases for each continent. It filters out null continents and orders the results by the maximum number of total cases in descending order.

<img width="194" alt="image" src="https://github.com/user-attachments/assets/bda93e6e-12d0-4081-9f15-6c9135da9943">


### **Query 6: Null Continent Infection Data**

**Description:**
This query retrieves the maximum total cases for locations with null continents from the `covidvacinations` table. It groups the results by continent and orders them by the maximum number of total cases in descending order.

<img width="179" alt="image" src="https://github.com/user-attachments/assets/bd2c8ff5-307e-43a9-ba41-b42b455f8fc7">


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
   - `population`: The total population of the location.
   - `New Vaccinations`: The number of new vaccinations administered on that date.
   - `Total Vaccinations`: The cumulative total of vaccinations administered up to that date for each location.
  
**Note**:
Due to the large size of the output, it is not feasible to display the entire result set here. Please refer to the raw data or the database for the complete output.

<img width="611" alt="image" src="https://github.com/user-attachments/assets/47bcca52-6498-44cc-b1d9-0c4af2e58ab0">

