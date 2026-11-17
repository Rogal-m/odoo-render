FROM python:3.12-slim-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    git build-essential pkg-config libpq-dev libxml2-dev libxslt1-dev \
    libldap2-dev libsasl2-dev libjpeg-dev zlib1g-dev libfreetype6-dev \
    libcairo2-dev libffi-dev libssl-dev fonts-dejavu-core \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 --branch 20.0 https://github.com/odoo/odoo.git /opt/odoo
RUN git clone --depth 1 https://github.com/Rogal-m/custom_addons.git /mnt/custom_addons

WORKDIR /opt/odoo
RUN pip install --no-cache-dir -r requirements.txt

COPY entrypoint.sh /entrypoint.sh
RUN sed -i 's/\r$//' /entrypoint.sh && chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]