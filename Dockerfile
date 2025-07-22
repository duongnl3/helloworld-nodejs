# Use Windows base image
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Install Node.js
RUN powershell -Command "Invoke-WebRequest -Uri https://nodejs.org/dist/v18.17.1/node-v18.17.1-x64.msi -OutFile nodejs.msi; Start-Process msiexec.exe -ArgumentList '/qn /i nodejs.msi' -Wait; Remove-Item -Force nodejs.msi"

WORKDIR /app

COPY package.json .
COPY server.js .

RUN npm install

EXPOSE 49151

CMD ["node", "server.js"]
