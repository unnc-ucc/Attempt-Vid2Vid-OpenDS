#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jul  5 10:13:00 2019

@author: weikaikong
"""

import cv2

vc = cv2.VideoCapture("/Users/weikaikong/Desktop/simulator.mp4")
c=1

if vc.isOpened():
    rval,frame = vc.read()
else:
    rval = False
    
timeF = 15

while rval:
    rval,frame = vc.read()
    if(c % timeF == 0):
        cv2.imwrite("/Users/weikaikong/mypython/test/"+str(c)+'.jpg',frame)
    c = c+1
    cv2.waitKey(1)
vc.release()