#use base image of python 3.13 slim
FROM python:3.13-slim

#set working directory
WORKDIR /saucedemo-robotframework-tests

#install system dependencies for playwright
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    wget \
    unzip \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libxkbcommon0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libasound2 \
    libxshmfence1 \
    libx11-xcb1 \
    libx11-6 \
    libxcb1 \
    libxext6 \
    fonts-liberation \
    && rm -rf /var/lib/apt/lists/*

#install robot framework and necessary libraries
RUN pip install --no-cache-dir \
    robotframework \
    robotframework-browser \
    robotframework-pythonlibcore

#install playwright browsers
RUN playwright install --with-deps chromium

#copy test files to container
COPY . /saucedemo-robotframework-tests

#run robot tests with tags (can be varied as needed)
# Results are saved to /saucedemo-robotframework-tests/results
CMD ["robot", "--outputdir", "results", "--include", "checkoutTests", "."]
