# Use official n8n Debian image
FROM n8nio/n8n:latest-debian

# Run as root (required for Render)
USER root

# Fix Debian repositories and install Tesseract OCR
RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y tesseract-ocr tesseract-ocr-eng && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# IMPORTANT: Do NOT switch to node user on Render
# n8n will run as root

