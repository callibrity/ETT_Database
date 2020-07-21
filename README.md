# ETT_Database
DbUp database migration

##Using a docker container as the postgres db:
https://hub.docker.com/_/postgres/

In terminal, run: 
```
docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres
```

Clone this repo, in terminal navigate to the project root directory and run:
```
dotnet restore
```
```
dotnet run
```

In your database management tool of choice, you should now be able to connect to the information found in this repo's Program.cs
```
"Host=localhost;User Id=postgres;Password=mysecretpassword;Database=test_database;Port=5432"
```

To use this DB in the API, in the API appsettings.json, alter the connection string to match the info found in this repo's Program.cs
```
{
  "Connection": "Host=localhost;Username=postgres;Password=mysecretpassword;Database=test_database"
}
```


1. Spin up local db - Container or localhost Postgres

2. Clone Database repo

3. Alter connection string in Program.cs to point to local DB

4. Run console program

5. Will execute all scripts in the Scripts/ folder

6. Alter connection string in ETT_Backend appsettings.json to local db
