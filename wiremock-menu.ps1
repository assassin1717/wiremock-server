do {
    Clear-Host
    Write-Host "===== WireMock Docker Menu =====" -ForegroundColor Cyan
    Write-Host "1. Start from Dockerfile (build + run custom image)"
    Write-Host "2. Stop container (from Dockerfile run)"
    Write-Host "3. Start from docker-compose"
    Write-Host "4. Stop docker-compose container"
    Write-Host "5. Exit"
    Write-Host "==================================="
    $choice = Read-Host "Escolhe uma opção (1-5)"

    switch ($choice) {
        "1" {
            Write-Host "`A buildar imagem personalizada com Dockerfile..." -ForegroundColor Yellow
            docker build -t my-wiremock .
            Write-Host "`A iniciar container em background..." -ForegroundColor Green
            docker run -d --name wiremock-standalone -p 8081:8080 my-wiremock
            Pause
        }
        "2" {
            Write-Host "`A parar container 'wiremock-standalone'..." -ForegroundColor Red
            docker stop wiremock-standalone
            Pause
        }
        "3" {
            Write-Host "`A iniciar WireMock com docker-compose..." -ForegroundColor Green
            docker-compose up -d
            Pause
        }
        "4" {
            Write-Host "`A parar container com docker-compose..." -ForegroundColor Red
            docker-compose down
            Pause
        }
        "5" {
            Write-Host "A sair..." -ForegroundColor Magenta
        }
        default {
            Write-Host "Opção inválida, tenta outra vez!" -ForegroundColor Red
            Pause
        }
    }
} while ($choice -ne "5")
