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

# Create a virtual environment
echo "Creating virtual environment..."
python3 -m venv .venv

# Activate the virtual environment
echo "Activating virtual environment..."
activate_venv

# Install the required packages
echo "Installing requirements..."
pip install -r requirements.txt

# Check if Jupyter is installed, if not install it
if ! command -v jupyter &> /dev/null; then
  echo "Jupyter not found, installing Jupyter..."
  pip install jupyter
fi

# Deactivate the virtual environment
deactivate

echo "Setup completed successfully."
