From mcr.microsoft.com/dotnet/sdk:8.0 As Sdk
WorkDir /DemoApp


Copy . ./
Run dotnet restore
Run dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:7.0
WorkDir /DemoApp
Copy --from=sdk /DemoApp/Output
Run ["dotnet","DemoApp.dll"]  