# coding:utf-8

from flask import Flask
from flask import request
import tempfile

import ctypes
import sys,os
from PIL import Image
from io import BytesIO

def nfiq2(img_buf : bytes) -> int:
    return lib.nfiq2score(img_buf,len(img_buf))

lib = ctypes.CDLL('/usr/local/lib/libnfiq2.so')
tempfile.tempdir = '/tmp'
app = Flask(__name__)

@app.route('/upload', methods=['PUT'])
def upload():
    png_data = BytesIO(request.data)
    img = Image.open(png_data).convert('L')
    temp = BytesIO()
    img.save(temp,'bmp',dpi=(500,500))
    score = nfiq2(temp.getvalue())
    print(score)
    response = {
        'score':score
    }
    return response

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=8000)
    
# exmaple cmd: curl -s -X PUT 192.168.0.101:8000/upload --upload-file image.png
