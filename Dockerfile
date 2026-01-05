# Usa a imagem oficial do n8n como base
FROM n8nio/n8n:1.121.2

# Troca para usuário root para poder instalar pacotes
USER root

# Instala Python, PIP e dependências de sistema necessárias
# O python-pptx precisa do lxml e Pillow, que podem exigir dependências de compilação
RUN apk add --no-cache python3 py3-pip build-base python3-dev libxml2-dev libxslt-dev jpeg-dev zlib-dev

# Cria um ambiente virtual (opcional mas recomendado, ou instala direto no sistema)
# Aqui instalaremos direto no sistema para simplificar a chamada no n8n
RUN pip3 install --upgrade pip --break-system-packages
RUN pip3 install python-pptx python-docx pandas openpyxl --break-system-packages

# Volta para o usuário padrão do n8n (segurança)
USER node
