FROM fedora:44

# Install Node.js, npm, build tools (for native module compilation), and utilities
RUN dnf update -y && \
    dnf install -y \
        nodejs \
        npm \
        python3 \
        make \
        gcc \
        gcc-c++ \
        git \
        curl \
        ca-certificates && \
    dnf clean all

# Install n8n globally
RUN npm install -g n8n

# Set directory for n8n workflow and execution data
WORKDIR /data

# Set n8n user data folder environment variable
ENV N8N_USER_FOLDER=/data

ENV N8N_INSTANCE_AI_MODEL_URL=https://olla.ergoshear.dev/olla/openai/v1 \
    N8N_INSTANCE_AI_MODEL_API_KEY=olla \
    N8N_INSTANCE_AI_MODEL=llama3 \
    N8N_INSTANCE_AI_THINKING_ENABLED=false

# Expose default n8n port
EXPOSE 5678

# Start the n8n service
CMD ["n8n", "start"]
