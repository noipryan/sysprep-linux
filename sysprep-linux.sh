#!/bin/bash

FILE=/etc/systemd/system/reset_ssh_host_keys.service

# Check to see if systemd file exists and if not create it
if [ ! -f "$FILE" ]; then
  sudo tee "$FILE" <<EOF
[Unit]
Description=Regenerate SSH host keys
Before=ssh.service
ConditionFileIsExecutable=/usr/bin/ssh-keygen
 
[Service]
Type=oneshot
ExecStartPre=-/bin/dd if=/dev/hwrng of=/dev/urandom count=1 bs=4096
ExecStartPre=-/bin/sh -c "/bin/rm -f -v /etc/ssh/ssh_host_*_key*"
ExecStart=/usr/bin/ssh-keygen -A -v
ExecStartPost=/bin/systemctl disable reset_ssh_host_keys
 
[Install]
WantedBy=multi-user.target
EOF
fi

sudo chown root:root "$FILE"

sudo chmod +x "$FILE"

sudo systemctl daemon-reload

sudo systemctl enable reset_ssh_host_keys.service

# Reset machine ID
sudo truncate -s 0 /etc/machine-id 
