FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019
# 2022 doesn't work on a win10 host

# this is an old version and does not work, need the latest version for the latest TXControl
#ADD http://download.microsoft.com/download/0/5/6/056dcda9-d667-4e27-8001-8a0c6971d6b1/vcredist_x64.exe vcredist_x64.exe
#RUN Start-Process -filepath C:\vcredist_x64.exe -ArgumentList "/install", "/passive", "/norestart", "'/log a.txt'" -PassThru | wait-process

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
RUN Invoke-WebRequest -Uri "https://aka.ms/vs/17/release/vc_redist.x64.exe" -OutFile vc_redist.x64.exe; \
    Start-Process -FilePath vc_redist.x64.exe -ArgumentList '/passive' -NoNewWindow -Wait; \
    Remove-Item -Force vc_redist.x64.exe

COPY WindowsFonts C:/Windows/Fonts/
# In code, Fonts need to be added in App Startup with Fonts.AddFontResource
# Fonts is a helper class taken from https://www.textcontrol.com/blog/2020/01/27/deploying-tx-text-control-to-azure-app-services/

