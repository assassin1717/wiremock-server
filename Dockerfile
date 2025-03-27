FROM wiremock/wiremock:latest

# Copia os teus mocks e ficheiros para dentro da imagem
COPY mappings /home/wiremock/mappings
COPY __files /home/wiremock/__files
