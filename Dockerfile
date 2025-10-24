# Use Ubuntu as the base image
FROM ubuntu:latest

# Maintainer information (optional)
LABEL maintainer="solis@example.com"

# Update packages and install Apache (web server) and MariaDB (database)
RUN apt update && apt install -y apache2 mariadb-server

# Set ServerName directive globally to remove the Apache warning
RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf && a2enconf fqdn

# Expose ports:
# 80 for web (HTTP)
# 3306 for database (MariaDB)
EXPOSE 80 3306

# Start both services when the container runs and keep the container alive
CMD service apache2 start && service mariadb start && tail -f /dev/null
