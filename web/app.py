import os
from flask import Flask, request, redirect, render_template, send_file
from werkzeug.utils import secure_filename
import tensorflow as tf
from keras._tf_keras.keras.preprocessing.image import load_img, img_to_array
import numpy as np

UPLOAD_FOLDER = 'uploads'
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = os.path.join('web', 'uploads')

LABELS = [
    'freshapples', 'freshbanana', 'freshoranges',
    'rottenapples', 'rottenbanana', 'rottenoranges'
]

# Load the model
model = tf.keras.models.load_model('model/fruit_classifier_model.h5')

# Ensure the upload folder exists
os.makedirs(app.config['UPLOAD_FOLDER'], exist_ok=True)

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        file = request.files.get('file')
        if not file or file.filename == '':
            return redirect(request.url)
        if allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
            file.save(file_path)
            prediction = predict_image(file_path)
            is_fresh = 'fresh' in prediction
            return render_template('result.html', filename=filename, prediction=prediction,  is_fresh=is_fresh)
    return render_template('upload.html')

def predict_image(file_path):
    img = load_img(file_path, target_size=(20, 20))
    img = img_to_array(img) / 255.0
    img = np.expand_dims(img, axis=0)

    result = model.predict(img)
    class_idx = np.argmax(result, axis=1)[0]
    return LABELS[class_idx]

@app.route('/uploads/<filename>')
def uploaded_file(filename):
    file_path = os.path.join(UPLOAD_FOLDER, filename)
    return send_file(file_path, mimetype='image/png')

if __name__ == '__main__':
    app.run(debug=True)
