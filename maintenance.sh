#!/bin/bash

# Set up automatic updates (runs every Monday at 2 AM)
echo "0 2 * * 1 root apt update && apt upgrade -y" | sudo tee -a /etc/crontab

# Create password reminder script to run every 3 months
sudo bash -c 'cat << EOF > /etc/cron.d/password_reminder
0 9 1 */3 * root /usr/local/bin/password_check.sh
EOF'

# Script to check if password has been changed and remind Olav
sudo bash -c 'cat << EOF > /usr/local/bin/password_check.sh
#!/bin/bash

last_changed=\$(chage -l olav | grep "Last password change" | cut -d: -f2)
days_since_change=\$(( ( \$(date +%s) - \$(date -d "\$last_changed" +%s) ) / 86400 ))

if [ "\$days_since_change" -ge 45 ]; then
    echo "Reminder: Change your password" | mail -s "Password Change Reminder" olav@example.com
fi
if [ "\$days_since_change" -ge 90 ]; then
    echo "Warning: Olav has not changed password in 6 months" | mail -s "Password Warning" it@example.com
fi
EOF'

# Make password check script executable
sudo chmod +x /usr/local/bin/password_check.sh


sudo chmod +x /etc/rc.local
