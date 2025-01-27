FROM python:3.9
WORKDIR /app

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y ffmpeg

COPY requirements.txt /app
RUN pip install -r requirements.txt

COPY src/ /app

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]

LABEL org.opencontainers.image.source=https://github.com/FilippeMafra/whisper-website
LABEL org.opencontainers.image.description="Whisper website container"
LABEL org.opencontainers.image.licenses=MIT
