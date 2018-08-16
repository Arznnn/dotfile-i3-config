#!/usr/bin/python

import glob, re, os, sys, zipfile

for pattern in sys.argv[1:]:
    for filepath in glob.glob(pattern):
        dirname, basename = os.path.split(filepath)
        root, ext = os.path.splitext(basename)
        newname = '%s-clean%s' % (root, ext)
        outpath = os.path.join(dirname, newname)
        zin = zipfile.ZipFile (filepath, 'r')
        zout = zipfile.ZipFile (outpath, 'w')
        for item in zin.infolist():
            if item.filename == 'mimetype':
                zout.writestr(item, zin.read(item.filename))
        for item in zin.infolist():
            if item.filename == 'meta.xml':
                data = zin.read(item.filename)
                # Find the document creation timestamp.
                timestamp = re.search(r'<meta:creation-date>([^<]+)</meta:creation-date>', data).group(1)
        for item in zin.infolist():
            if item.filename == 'content.xml':
                data = zin.read(item.filename)
                # Replace all occurrences of date in <dc:date>
                data = re.sub('<dc:date>[^<]+</dc:date>', '<dc:date>%s</dc:date>' % timestamp, data)
                zout.writestr(item, data)
            elif item.filename != 'mimetype':
                zout.writestr(item, zin.read(item.filename))
        zout.close()
        zin.close()
