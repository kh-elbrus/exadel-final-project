FROM python:3.8.1-slim-buster

RUN useradd wagtail

EXPOSE 8000

ENV PYTHONUNBUFFERED=1 \
    PORT=8000

RUN apt-get update --yes --quiet && apt-get install --yes --quiet --no-install-recommends \
    build-essential \
    libpq-dev \
    libmariadbclient-dev \
    libjpeg62-turbo-dev \
    zlib1g-dev \
    libwebp-dev \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /

RUN pip install --upgrade pip

RUN pip install -r ./requirements.txt

WORKDIR /app

RUN chown wagtail:wagtail /app

COPY --chown=wagtail:wagtail . .

RUN mkdir -p /vol/web/media

RUN mkdir -p /vol/web/static

RUN chown -R wagtail:wagtail /vol/

RUN chmod -R 755 /vol/web

USER wagtail

CMD ["bash", "startup.sh"]