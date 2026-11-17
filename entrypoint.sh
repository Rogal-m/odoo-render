#!/bin/bash
set -e
exec python /opt/odoo/odoo-bin \
  --addons-path=/opt/odoo/addons,/opt/odoo/odoo/addons,/mnt/custom_addons \
  --db_host="$DB_HOST" --db_port="${DB_PORT:-5432}" \
  --db_user="$DB_USER" --db_password="$DB_PASSWORD" \
  -d "$DB_NAME" --db-filter="^${DB_NAME}$" --no-database-list \
  --http-interface=0.0.0.0 \
  --http-port="${PORT:-8069}" --proxy-mode --workers=0 \
  --without-demo=all ${ODOO_INIT:+-i "$ODOO_INIT"}