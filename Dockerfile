# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory
WORKDIR /usr/src/app

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*

# Download and install Ollama
RUN wget https://ollama-download-url/ollama.tar.gz -O /tmp/ollama.tar.gz && \
    tar -xzf /tmp/ollama.tar.gz -C /opt/ && \
    ln -s /opt/ollama/bin/ollama /usr/local/bin/ollama

# Download LLaMA 3 model
RUN wget https://llama3-download-url/llama3.tar.gz -O /tmp/llama3.tar.gz && \
    tar -xzf /tmp/llama3.tar.gz -C /usr/src/app/

# Set environment variables for Ollama and LLaMA
ENV OLLAMA_HOME=/opt/ollama
ENV LLAMA3_MODEL_DIR=/usr/src/app/llama3

# Ensure the script is executable
COPY run_llama3.py /usr/src/app/
RUN chmod +x /usr/src/app/run_llama3.py

# Define the command to run the LLaMA 3 model
CMD ["python", "run_llama3.py"]
