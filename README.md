# ETT_Database
DbUp database migration

## Technologies needed
- [.Net core](https://dotnet.microsoft.com/download/dotnet-core/3.1)
- [Docker Desktop](https://www.docker.com/get-started)

## To use with the current Docker Compose setup
With the ETT-Backend docker image running, simply run with `dotnet run` to populate/update the local db.

## To create your own local db
https://hub.docker.com/_/postgres/

1. In terminal, run the following command. You can also create your own name and password if you wish. 
```
docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres
```  
2. Clone this repo, in terminal navigate to the project root directory and run:
```
dotnet run
```
3. In your database management tool of choice, you should now be able to connect to the information found in this repo's Program.cs
```
"Host=localhost;User Id=postgres;Password=mysecretpassword;Database=test_database;Port=5432"
```
4. To use this DB in the API, in the API appsettings.json, alter the connection string to match the info found in this repo's Program.cs
```
{
  "Connection": "Host=localhost;Username=postgres;Password=mysecretpassword;Database=test_database"
}
```

## Add yourself to the database for local development

1. In Script0003_Employees add a row with your name, role, office, email, skills, interests, bio, photo, and callibrity_email

2. In Script0004_Ett_Employee add a row with your first name, last name, employee_number, and employee_email. The employee_email needs to match up with the callibrity_email you added to the employees table

3. In Script0005_Ett_Employee_Metrics add a row with an employee number that matches with the employee_number from the previous step, and nominal values for the rest of the value columns

4. Point connection string in Program.cs to your local db and run the project

--------------------

If you need to add yourself to the production database, you need to add these insert statements into new scripts so that they will run, since DbUp will not run the same scripts against the database more than once

## Refresh DB

If you want to clear out the db to be able to run the DbUp script from scratch, connect to the db and run the following SQL commands:
```
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;
COMMENT ON SCHEMA public IS 'standard public schema';
```