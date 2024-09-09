#!/bin/bash

# Log each login attempt with time and username
echo 'echo "$(whoami) logged in at $(date)" >> /var/log/login.log' | sudo tee -a /etc/profile

# Backup important documents and compress them
sudo bash -c 'cat << EOF > /usr/local/bin/docbackup.sh
#!/bin/bash
zip -r /home/olav/Documents/backup.zip /home/olav/Documents/Regnskap/
scp /home/olav/Documents/backup.zip user@192.168.1.10:/path/to/backup/
rm /home/olav/Documents/backup.zip
EOF'

# Make the backup script executable
sudo chmod +x /usr/local/bin/docbackup.sh
