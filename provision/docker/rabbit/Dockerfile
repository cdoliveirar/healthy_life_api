FROM rabbitmq:3.6.0-management

LABEL NAME rabbitmq
LABEL VERSION 3.6.0

# Add script to create default users / vhosts
ADD init.sh /init.sh

# Set correct executable permissions
RUN chmod +x /init.sh

# Define default command
CMD ["/init.sh"]
