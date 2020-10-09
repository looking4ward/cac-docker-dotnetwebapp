FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
#use this appname on lines 14,15 an 16 too!
WORKDIR /myWebApp 

# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /myWebApp
COPY --from=build-env /myWebApp/out .
ENTRYPOINT ["dotnet", "myWebApp.dll"]