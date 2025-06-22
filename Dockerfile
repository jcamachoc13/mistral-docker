FROM python:3.10-slim

# Instalar dependencias básicas
RUN apt-get update && apt-get install -y git build-essential cmake

# Clonar llama.cpp (soporte para modelos como Mistral)
RUN git clone https://github.com/ggerganov/llama.cpp.git /app/llama
WORKDIR /app/llama
RUN make

# Copiar modelos (o montarlos desde fuera)
COPY ./modelos /app/modelos

# Comando de prueba al iniciar el contenedor
CMD ["./main", "-m", "/app/modelos/mistral-7b-instruct-v0.1.Q4_K_S.gguf", "-p", "Hola, ¿cómo estás?"]
