# Fruit Freshness Detector

Copied STUFF from https://github.com/ShaileshDhama/Rotten-v-s-Fresh-Fruit-Detection 🤓


This project is a web application that allows users to upload images of fruits and determines whether the fruit is fresh or rotten.

## Project Structure

- `setup_env.sh`: Bash script to set up the virtual environment and install dependencies.
- `run_app.sh`: Bash script to run the web application and open it in the default browser.
- `requirements.txt`: List of required Python packages.
- `app.py`: Flask web application for handling file uploads and displaying results.
- `upload.html`: HTML template for the file upload page.
- `result.html`: HTML template for displaying prediction results.

## Setup

Download the dataset from [here](https://www.mediafire.com/file/e4el970rh330qma/archive.zip/file)

1. Clone the repository:

    ```bash
    git clone https://github.com/zax4r0/fruit-freshness-detector.git
    cd fruit-freshness-detector
    ```

2. Ensure that you have Python 3 installed on your system.

3. Run the setup script to create a virtual environment and install the necessary dependencies:

    ```bash
    chmod +x setup_env.sh
    ./setup_env.sh
    ```

    This script will:
    - Create a virtual environment named `.venv`.
    - Activate the virtual environment.
    - Install the required packages from `requirements.txt`.
    - Install Jupyter if it's not already installed.

## Running the Web Application

1. After setting up the environment, run the web application script:

    ```bash
    chmod +x run_app.sh
    ./run_app.sh
    ```

    This script will:
    - Activate the virtual environment.
    - Start the Flask web application.
    - Open the default web browser to `http://127.0.0.1:5000/`.

2. You can now use the web application to upload images and see the freshness prediction.

## Screenshots

### Upload Page

![image](https://github.com/user-attachments/assets/cb4d4bd9-a0f8-4afc-b7ee-c7f10b059197)

### Result Page

![image](https://github.com/user-attachments/assets/e063b6e7-64fc-47d7-8f91-f6e419c0e90f)

## Contributing

If you would like to contribute to this project, please fork the repository and submit a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
