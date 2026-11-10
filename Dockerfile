# 1. Base image
FROM python:3.10-slim

# 2. Environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 3. Working directory
WORKDIR /app

# 4. System dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# 5. Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 6. Source code
COPY . .

# 7. Collect static files
RUN python manage.py collectstatic --noinput

# 8. Expose port
EXPOSE 8000

# 9. Start application
CMD ["gunicorn", "mysite.wsgi:application", "--bind", "0.0.0.0:8000"]