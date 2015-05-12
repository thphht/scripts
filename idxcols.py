#!/usr/bin/env python2.6
#
# compare idx file field sizes with reference file
#
# Usage: idxcols.py <label reference> <index file>
#

import sys
import fileinput
import csv
#from termcolor import colored

def edrindex(colnum):
    """find column number in EDRINDEX.TAB file, return byte length"""
    lblindex = sys.argv[1]
    f = open(lblindex, 'r')
    line = f.readline()

    column_number = -99
    colbytes = -99
    start_byte = -99
    edrcols = [] 

    for line in f: 
        field = line.split('=')
        # skip over blank lines or lines with only one field
        if len(field) > 1: 
            if field[0].strip() == 'COLUMN_NUMBER':
                column_number = int(field[1].strip())
            if field[0].strip() == 'BYTES': 
                colbytes = int(field[1].strip())
            if field[0].strip() == 'START_BYTE':
                start_byte = int(field[1].strip())
        if column_number > colnum:
            break
    f.close()
    return colbytes 


def mmmidxcol(colnum):
    """check length of field in .idx file given column_number""" 
    idxrecord = []
    idxfile = sys.argv[2]
    idxread = csv.reader(open(idxfile, 'r'), delimiter=',', quotechar='"')
    for record in idxread:
        fieldlen = len(record[colnum])
        fieldname = record[colnum]
        idxrecord = [fieldlen,fieldname]
    return idxrecord 

#
# main()
#

errcount = 0

for i in range(1,80):
    idxrecord = mmmidxcol(i-1)
    idxbytes = idxrecord[0] 
    idxname = idxrecord[1] 
    if edrindex(i) != idxbytes: 
        errcount += 1
	print "incorrect byte count in field: ", i,
	print "actual: ", idxbytes, "expected:", edrindex(i)

if errcount == 0:
    print "file:", sys.argv[2], " PASS"
else:
    print "file:", sys.argv[2], "FAIL"
