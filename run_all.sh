#!/bin/bash

# Set executable permissions for all scripts
chmod +x user_setup.sh
chmod +x dependencies.sh
chmod +x maintenance.sh
chmod +x folder_setup.sh
chmod +x logging_and_backup.sh

# Run all setup and configuration scripts
./user_setup.sh
./dependencies.sh
./maintenance.sh
./folder_setup.sh
./logging_and_backup.sh

echo "All setup completed!"
