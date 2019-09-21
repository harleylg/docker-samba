#!/bin/sh

echo "$(env | grep -E '^USER_\d+=')" | while IFS= read -r I_USER ; do
    USER_ID=$(echo "$I_USER" | awk -F= '{print $1}' | sed 's/USER_//g')
    USER_NAME=$(echo "$I_USER" | awk -F= '{print $2}' | awk -F: '{print $1}')
    USER_PASSWORD=$(echo "$I_USER" | awk -F= '{print $2}' | awk -F: '{print $2}')

    adduser -H -D -s /bin/false -u $USER_ID "$USER_NAME"
    chpasswd << EOF
"$USER_NAME:$USER_PASSWORD"
EOF

    smbpasswd -a -s "$USER_NAME" << EOF
"$USER_PASSWORD"
"$USER_PASSWORD"
EOF

    unset $(echo "USER_"${USER_ID})

done