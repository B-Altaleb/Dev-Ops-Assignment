# Use the official Python base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the server file to the container
COPY server.py .

# Set the environment variables for Flask
ENV FLASK_APP=server.py
# ENV FLASK_RUN_HOST=0.0.0.0
ENV PORT=5000

# Expose the port on which the server will listen
EXPOSE 5000

# Start the Flask server
CMD ["flask", "run"]
