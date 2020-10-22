# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt

width = 8;
depth = 256;

x = np.linspace(0, 2*np.pi, num=256)
y = np.sin(x)
y =(np.power(2,7)*(y+1))
y = np.uint8(y)

content = ""
content_list = []
for item in enumerate(y):
    content_list.append(str(item[0]))
    content_list.append(str(":"))
    content_list.append(str(item[1]))
    content_list.append(str(";\n    "))
content = "".join(content_list)    

with open("rom_sin.mif", mode="w+") as f:
    # content = f.read()
    # pos = content.find("CONTENT BEGIN")
    f.write("""
WIDTH={width};
DEPTH={depth};

ADDRESS_RADIX=UNS;
DATA_RADIX=UNS;

CONTENT BEGIN
    {content}
END;""".format(width=width, depth=depth, content=content))


    
    
            
            