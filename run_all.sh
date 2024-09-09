#!/bin/bash

# Set executable permissions for all scripts
chmod +x dependencies.sh
chmod +x user_setup.sh
chmod +x maintenance.sh
chmod +x folder_setup.sh
chmod +x logging_and_backup.sh

# Run all setup and configuration scripts
./dependencies.sh
./user_setup.sh
./maintenance.sh
./folder_setup.sh
./logging_and_backup.sh

echo "All setup completed!"
