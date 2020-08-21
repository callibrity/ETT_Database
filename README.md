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
