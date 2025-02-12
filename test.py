# This script demonstrates a simple loop, printing numbers from 0 to 99, followed by some text output and a BASE_DIR calculation.

import os

for i in range(100):
    print(i)

print('Hello world')
print('Md Sydul AMin')

BASE_DIR = os.path.dirname(
    os.path.abspath(__file__)
)
