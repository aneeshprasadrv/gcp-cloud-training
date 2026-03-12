FROM ubuntu:latest

WORKDIR /app

RUN apt-get update && apt-get install -y python3-full python3-pip python3-venv

# Install the application dependencies
COPY requirements.txt /app
COPY . /app/
#RUN pip install --no-cache-dir -r requirements.txt

SHELL ["/bin/bash", "-c"]

#open virtual env
RUN python3 -m venv venv1 && \
source venv1/bin/activate && \

/app/venv1/bin/pip install -r requirements.txt

# Set PATH to use virtualenv's python/pip
ENV PATH="/app/venv1/bin:$PATH"

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

