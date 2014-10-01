import pycurl
curl = pycurl.Curl()
s = pycurl.CurlShare()
s.setopt(pycurl.SH_SHARE, pycurl.LOCK_DATA_COOKIE)
s.setopt(pycurl.SH_SHARE, pycurl.LOCK_DATA_DNS)
curl.setopt(pycurl.URL, 'http://curl.haxx.se')
curl.setopt(pycurl.SHARE, s)
curl.perform()
curl.close()
