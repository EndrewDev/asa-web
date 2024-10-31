# Usa a imagem Python 3.12 slim como base
FROM python:3.12-slim

# Metadados sobre o autor da imagem
LABEL maintainer="endrew.developer@gmail.com"

# Instala pacotes adicionais necessários
RUN apt-get update && apt-get install -y \
    curl \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho
WORKDIR /app

# Copia o arquivo requirements.txt para o diretório de trabalho
COPY requirements.txt .

# Cria e ativa o ambiente virtual, atualiza o pip e instala dependências
RUN python3 -m venv venv \
    && . venv/bin/activate \
    && pip install --upgrade pip \
    && pip install -r requirements.txt

# Copia todos os arquivos do projeto para o container
COPY . .

# Expõe a porta 8080 (se seu app realmente usa essa porta)
EXPOSE 8080

# Define o comando para rodar o app
CMD ["/app/venv/bin/python", "app.py"]
