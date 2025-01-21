#!/bin/bash

# Check if PORT is set and not empty
if [ -z "$PORT" ]; then
  echo "Error: PORT environment variable is not set or empty."
  exit 1
fi

# Initialize the command
CMD="taskchampion-sync-server --port $PORT"

# Check if CLIENT_IDS is set and not empty
if [ -n "$CLIENT_IDS" ]; then
  # Split CLIENT_IDS by comma and append --client-id flags
  IFS=',' read -ra IDS <<< "$CLIENT_IDS"
  for ID in "${IDS[@]}"; do
    CMD+=" --allow-client-id $ID"
  done
fi

# Execute the command
echo "Executing: $CMD"
eval "$CMD"
