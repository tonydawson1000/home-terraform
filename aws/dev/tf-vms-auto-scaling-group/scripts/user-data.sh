#!/bin/bash

cat > index.html <<EOF
<h1>Hello Ubuntu 22.04!</h1>
<p>Running on Host: $(hostname -f)</p>
EOF

nohup busybox httpd -f -p ${server_port} &