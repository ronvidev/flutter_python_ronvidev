from flask import Flask, request, send_file

from process_image import process_image

app = Flask(__name__)

@app.route('/api', methods=['POST'])
def main():
    data = request.get_json()
    text = data.get('text')
    
    process_image(text, 'image.jpg', 'image_text.jpg')
    
    return send_file('image_text.jpg', mimetype='image/jpg')

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000, debug=True)