#!/bin/bash
# Small script that tests:
# 1. scping a binary onto a node
# 2. running that binary
# 3. returning the binary's stdout back to the local machine

IDENTITY_FILE="$1"
SSH_USER="$2"
SERVER="$3"

echo "Compiling the binary"
GOOS=linux GOARCH=amd64 go build -o bin/test-bin main/main.go

echo "scping the binary to the server"
scp -i "$IDENTITY_FILE" bin/test-bin "$SSH_USER@$SERVER":~

echo "executing remote binary with ssh"
ssh -i "$IDENTITY_FILE" "$SSH_USER@$SERVER" "~/test-bin"
