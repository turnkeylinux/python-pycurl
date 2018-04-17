#!/bin/sh

cat > $AUTOPKGTEST_TMP/livetest.py <<EOF
from __future__ import print_function

import io
import pycurl

fp = io.BytesIO()

c = pycurl.Curl()
c.setopt(pycurl.URL, 'https://pypi.python.org/daytime')
c.setopt(pycurl.USERAGENT, 'Debian package DEP-8 test')
c.setopt(pycurl.WRITEDATA, fp)
c.perform()
c.close()

print(fp.getvalue().decode('utf-8'), end='')

EOF

for py in `pyversions -i`
do
    $py --version
    $py $AUTOPKGTEST_TMP/livetest.py
done

for py in `py3versions -i`
do
    $py --version
    $py $AUTOPKGTEST_TMP/livetest.py
done
