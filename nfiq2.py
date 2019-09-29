#!/usr/bin/python3
#
import ctypes
import sys,os
from PIL import Image
from io import BytesIO

# todo:
#   get md5sum of input and memoized score 
#   flask REST API
#   flask file upload

lib = ctypes.CDLL('/usr/local/lib/libnfiq2.so')

def nfiq2(img_buf : bytes) -> int:
    return lib.nfiq2score(img_buf,len(img_buf))

if __name__ == '__main__':
    if len(sys.argv) == 1:
        sys.exit(1)    
    try:
        inputf = sys.argv[1]
        img = Image.open(inputf).convert('L')

        temp = BytesIO()
        img.save(temp,'bmp',dpi=(500,500))
        score = nfiq2(temp.getvalue())
        print("score = ",score)
    except IOError as x:
        print("IOError\n")
