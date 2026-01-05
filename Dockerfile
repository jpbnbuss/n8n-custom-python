# Usa a imagem oficial do n8n como base
FROM n8nio/n8n:1.121.2

# Troca para usuário root para poder instalar pacotes
USER root

# 1. Instalação do Python e dependências
RUN apk add --no-cache python3 py3-pip build-base python3-dev libxml2-dev libxslt-dev jpeg-dev zlib-dev
RUN pip3 install --upgrade pip --break-system-packages
RUN pip3 install python-pptx python-docx pandas openpyxl --break-system-packages

# 2. Instalação do officeparser, pdf-parse
RUN npm install -g officeparser pdf-parse

# Volta para o usuário padrão do n8n
USER node
