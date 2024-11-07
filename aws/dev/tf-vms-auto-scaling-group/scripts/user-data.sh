#!/bin/bash

cat > index.html <<EOF
<h1>Hello Auto Scaling Group of EC2 VMs!</h1>
<p>Ubuntu 22.04!</p>
<p>Running on Host: $(hostname -f)</p>
<p>Date: $(date)</p>
EOF

nohup busybox httpd -f -p ${server_port} &