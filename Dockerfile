# Use the official Python image as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Python script to the container
COPY server.py /app

# Install any dependencies required by your script
# Uncomment the lines below if you have dependencies
# COPY requirements.txt /app
# RUN pip install --no-cache-dir -r requirements.txt

# Run the Python script when the container starts
CMD ["python", "server.py"]

