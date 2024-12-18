FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project files
COPY . .

# Collect static files
RUN python manage.py collectstatic --noinput

# Start the Django application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "college_management_system.wsgi:application"]
