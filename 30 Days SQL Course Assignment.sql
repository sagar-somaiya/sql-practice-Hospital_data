CREATE TABLE Hospital_Data (
    "Hospital Name" VARCHAR(100),
    "Location" VARCHAR(100),
    "Department" VARCHAR(100),
    "Doctors Count" INTEGER,
    "Patients Count" INTEGER,
    "Admission Date" DATE,
    "Discharge Date" DATE,
    "Medical Expenses" NUMERIC(10,2)
);

SELECT * FROM Hospital_Data


/* 1) Total Number of Patients
	Write an SQL query to find the total number of patients across all hospitals.*/


SELECT SUM("Patients Count") AS Total_No_of_Patients
FROM Hospital_Data;

/* 2) Average Number of Doctors per Hospital
	Retrieve the average count of doctors available in each hospital.*/


SELECT AVG("Doctors Count") AS avg_Doctors_Per_Hospital
FROM Hospital_Data;


/* 3) Top 3 Departments with the Highest Number of Patients
	Find the top 3 hospital departments that have the highest number of patients.*/


SELECT "Department",SUM("Patients Count") AS total_patients
FROM Hospital_data
GROUP BY "Department"
LIMIT 3;


/* 4) Hospital with the Maximum Medical Expenses
	Identify the hospital that recorded the highest medical expenses.*/


SELECT "Hospital Name",MAX("Medical Expenses") AS max_medical_expenses
FROM Hospital_Data
GROUP BY "Hospital Name";


/* 5) Daily Average Medical Expenses 
	Calculate the average medical expenses per day for each hospital.*/ 


SELECT "Hospital Name",
AVG("Medical Expenses" / EXTRACT(DAY FROM "Discharge Date") - EXTRACT(DAY FROM
"Admission Date") + 1) AS daily_avg_medical_expenses
FROM Hospital_Data
GROUP BY "Hospital Name";


/* 6) Longest Hospital Stay
	Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.*/


SELECT "Hospital Name",
MAX("Discharge Date"-"Admission Date") AS longest_stay
FROM Hospital_Data
gROUP BY "Hospital Name";



/* 7)Total Patients Treated Per City
	Count the total number of patients treated in each city.*/


SELECT "Location",
SUM("Patients Count") AS total_patients
FROM Hospital_Data
GROUP BY "Location";


/* 8) Average Length of Stay Per Department
	Calculate the average number of days patients spend in each department*/


SELECT "Department",
AVG("Discharge Date"-"Admission Date") AS avg_length_of_stay
FROM Hospital_Data
GROUP BY "Department";


/* 9) Identify the Department with the Lowest Number of Patients
	Find the department with the least number of patients.*/


SELECT "Department",
MIN("Patients Count") AS min_patients
FROM Hospital_Data
GROUP BY "Department";


/* 10) Monthly Medical Expenses Report
	Group the data by month and calculate the total medical expenses for each month.*/


SELECT EXTRACT(MONTH FROM "Admission Date") AS months,
SUM("Medical Expenses") AS total_medical_expenses
FROM Hospital_data
GROUP BY months
ORDER BY months;