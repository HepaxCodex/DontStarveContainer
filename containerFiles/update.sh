#!/bin/bash

# Gracefully stop the server
./stopserver.sh

# Run the install script (which also updates)
./install.sh

# Restart the server
./startserver.sh
