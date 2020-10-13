# Example myWebApp
## This is a Dockerized .NET Core 3.1 application of an example Covid-19 registration form. Used for educational purposes only!
- if you check the Dockerfile you see that it uses the image mcr.microsoft.com/dotnet/core/sdk:3.1 as building environment. You can use the dotnet CLI to create applications. See: https://dotnet.microsoft.com/learn/dotnet/hello-world-tutorial/install
- The example webapplication was made as follows:
  - dotnet new webApp -o myWebApp --no-https
  - cd myWebApp
  - dotnet watch build
  - dotnet run
- After that I created a Dockerfile inside the myWebApp folder. See example: https://docs.docker.com/engine/examples/dotnetcore/
  - Be sure all folder and .dll references to the folder named by your application (in my case 'myWebApp') !!
  - It uses a command to output the buildfiles to a folder using:
  - dotnet publish -c Release -o out
- I used an example Covid-19 registration form as an example to make it look better. Original source: https://111.nhs.uk/.
- I changed the pages:
  - ./Pages/index.cshtml
  - ./Pages/Shared/_Layout.cshtml
- And added some resources:
  - ./wwwroot/index_files/


# How to run

## Download source and unzip
git clone https://github.com/looking4ward/nhs-cac-docker-dotnetwebapp.git

## Enter folder
cd nhs-cac-docker-dotnetwebapp/

## Build docker image
docker build -t aspnetapp:latest .
- Build from current directory (.) and name it aspnetapp:latest

## Run container
docker run -d -p 5000:80 --name myWebApp aspnetapp:latest
- Expose to http port to external port (default: 5000). Assign myWebApp as name. Use -d for detach mode (e.g background, instead of interactive mode -i)

## Test it in browser
http://localhost:5000


## Extra: inspect container
docker inspect myWebApp

## Extra: run commands
docker exec myWebApp tail ../etc/os-release
- For example: tail [file]) in container
