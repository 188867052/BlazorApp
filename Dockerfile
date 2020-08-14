### PREPARE
FROM mcr.microsoft.com/dotnet/core/sdk:3.1.201 AS build
WORKDIR /src

# Copy csproj and sln and restore as distinct layers
COPY BlazorApp/*.csproj BlazorApp/
COPY BlazorApp.sln .
RUN dotnet restore

### BUILD
COPY . .
RUN dotnet build "BlazorApp.sln" -c Release -o /app

### PUBLISH
FROM build as publish
COPY . .
RUN dotnet publish "BlazorApp.sln" -c Release -o /app

### RUNTIME IMAGE
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS final
WORKDIR /app
COPY --from=publish /app .
EXPOSE 80
ENTRYPOINT ["dotnet", "BlazorApp.dll"]