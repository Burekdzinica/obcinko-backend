# Use an official Debian-based Alpine image with Python
FROM python:3.13-alpine

# Set the working directory in the container
WORKDIR /app

# Install dependencies for Flask and Waitress
RUN apk update && apk add --no-cache gcc libffi-dev musl-dev

# Install Flask and Waitress via pip
RUN pip install --no-cache-dir flask waitress flask-cors

# Copy your application files into the container
COPY ./api.py /app
COPY ./solutions.json /app

# Expose the necessary port
EXPOSE 5001

# Set the environment variable to ensure Python outputs logs
# ENV PYTHONUNBUFFERED=1

# Command to run the application using waitress
CMD ["waitress-serve", "--host", "0.0.0.0", "--port", "5001", "api:app"]
