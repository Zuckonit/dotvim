if !has("python")
    echo "Error:no python supported!"
    finish
endif

function! Weather()
python << EOF
#-*- coding:utf-8 -*-
import urllib
import vim
import socket
import re

TIMEOUT = 20
socket.setdefaulttimeout(TIMEOUT)

try:
    url  = 'http://feixin.10086.cn/weather'
    data = urllib.urlopen(url).read()
    parse_weather = re.compile(r'<meta name="description" content="(.*?)"')
    #parse_weather = re.compile(r'id="weatherText">(.*?)</textarea>',re.DOTALL)
    weather = parse_weather.findall(data)[0]
    weather = weather.replace('\r\n','\n')
    print weather

    url = "http://api.liqwei.com/weather/"
    data = urllib.urlopen(url).read()
    data = data.split('<br/>')
    for i in range(len(data)):
        print data[i].decode('gbk').encode('utf8')

except Exception as e:
    print e

EOF
endfunction

