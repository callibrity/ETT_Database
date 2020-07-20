using System;
using System.Linq;
using System.Reflection;
using DbUp;

namespace Database
{
    class Program
    {
        static int Main(string[] args)
        {
            var connectionString =
                args.FirstOrDefault()
                ?? "Host=localhost;User Id=postgres;Password=mysecretpassword;Database=test_database;Port=5432";
            EnsureDatabase.For.PostgresqlDatabase(connectionString); // Creates database if it does not exist

            // Execute all the scripts listed as Embedded resources in the .csproj folder
            // var upgrader = DeployChanges.To
            //     .PostgresqlDatabase(connectionString)
            //     .WithScriptsEmbeddedInAssembly(Assembly.GetExecutingAssembly())
            //     .LogToConsole()
            //     .Build();

            // Execute the scripts that have not been run yet in the Scripts folder
            var upgrader = DeployChanges.To
                .PostgresqlDatabase(connectionString)
                .WithScriptsFromFileSystem("./Scripts")
                .LogToConsole()
                .Build();
            var result = upgrader.PerformUpgrade();
            if (!result.Successful)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine(result.Error);
                Console.ResetColor();
                return -1;
            }
            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine(value: "Success!");
            Console.ResetColor();
            return 0;
        }
    }
}
