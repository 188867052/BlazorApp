FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
MAINTAINER cheng 542153354@qq.com

ENV "ASPNETCORE_ENVIRONMENT"="Development"
WORKDIR /app
EXPOSE 80
COPY ./bin/Debug/netcoreapp3.1/publish /app
ENTRYPOINT ["dotnet", "AntDesign.Docs.Server.dll"]
