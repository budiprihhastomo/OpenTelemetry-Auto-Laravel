FROM php:8.1-fpm

WORKDIR /app

RUN pecl install opentelemetry \
    && docker-php-ext-enable opentelemetry

COPY . .

ENV OTEL_PHP_AUTOLOAD_ENABLED=true
ENV OTEL_SERVICE_NAME=larvel-auto-instrument
ENV OTEL_TRACES_EXPORTER=console
ENV OTEL_METRICS_EXPORTER=none
ENV OTEL_LOGS_EXPORTER=none

EXPOSE 8000

CMD [ "php", "artisan", "serve", "--host", "0.0.0.0" ]
