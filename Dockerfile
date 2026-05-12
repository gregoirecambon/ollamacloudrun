FROM ollama/ollama:latest

ENV OLLAMA_HOST=0.0.0.0:8080
ENV HOME=/root
ENV OLLAMA_MODELS=/models
ENV OLLAMA_DEBUG=false
ENV OLLAMA_KEEP_ALIVE=-1
ENV OLLAMA_NUM_PARALLEL=1

RUN apt-get update && \
    apt-get install -y netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

RUN ollama serve & \
    sleep 10 && \
    ollama pull gemma4:e4b

EXPOSE 8080

ENTRYPOINT ["ollama", "serve"]