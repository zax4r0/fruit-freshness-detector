#!/bin/bash

# Function to activate the virtual environment
activate_venv() {
  if [[ "$OSTYPE" == "linux-gnu"* || "$OSTYPE" == "darwin"* ]]; then
    # Linux or macOS
    source .venv/bin/activate
  elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    # Windows
    source .venv/Scripts/activate
  else
    echo "Unsupported OS: $OSTYPE"
    exit 1
  fi
}

# Activate the virtual environment
echo "Activating virtual environment..."
activate_venv

# Run the web app
echo "Starting web app..."
python web/app.py &

# Give the web app some time to start
sleep 5

# Open the default web browser to the URL
echo "Opening browser at http://127.0.0.1:5000/"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  xdg-open http://127.0.0.1:5000/
elif [[ "$OSTYPE" == "darwin"* ]]; then
  open http://127.0.0.1:5000/
elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
  start http://127.0.0.1:5000/
else
  echo "Please open your browser and go to http://127.0.0.1:5000/"
fi

# Wait for the web app process to end
wait

# Deactivate the virtual environment
deactivate
