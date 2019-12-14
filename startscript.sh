#!/bin/bash

cat >/etc/systemd/system/cwmp.service<< EOF
[Unit]
Description=My CWMP

[Service]
WorkingDirectory=/root/node_modules/genieacs/bin
#path to executable. 
#executable is a bash script
ExecStart=/root/node_modules/genieacs/bin/genieacs-cwmp
SuccessExitStatus=143
TimeoutStopSec=10
Restart=always
RestartSec=5
AmbientCapabilities=CAP_SYS_RAWIO
User=root

[Install]
WantedBy=multi-user.target
EOF



cat >/etc/systemd/system/fs.service<< EOF
[Unit]
Description=My CWMP

[Service]
WorkingDirectory=/root/node_modules/genieacs/bin
#path to executable. 
#executable is a bash script
ExecStart=/root/node_modules/genieacs/bin/genieacs-fs
SuccessExitStatus=143
TimeoutStopSec=10
Restart=always
RestartSec=5
AmbientCapabilities=CAP_SYS_RAWIO
User=root

[Install]
WantedBy=multi-user.target
EOF



cat >/etc/systemd/system/nbi.service<< EOF
[Unit]
Description=My CWMP

[Service]
WorkingDirectory=/root/node_modules/genieacs/bin
#path to executable. 
#executable is a bash script
ExecStart=/root/node_modules/genieacs/bin/genieacs-nbi
SuccessExitStatus=143
TimeoutStopSec=10
Restart=always
RestartSec=5
AmbientCapabilities=CAP_SYS_RAWIO
User=root

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable cwmp.service
systemctl enable fs.service
systemctl enable nbi.service
systemctl start cwmp.service
systemctl start fs.service
systemctl start cwmp.service

cd /opt/genieacs-gui
rails s
