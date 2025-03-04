FROM python:3.10-alpine
WORKDIR /app

# Install required build dependencies -- need this since alpine is a lightweight image and requires additional dependencies for scikitlearn
RUN apk add --no-cache gcc g++ musl-dev python3-dev libffi-dev make

COPY requirements.txt /app/
RUN pip install --upgrade pip  # Ensure pip is up to date
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

CMD ["python", "app.py"]
