FROM ubuntu:18.04
RUN apt-get update -y >/dev/null 2>&1 && apt-get install curl -y >/dev/null 2>&1
CMD curl "https://api.macaddress.io/v1?output=vendor&apiKey=${token}&search=${mac}" 2>/dev/null
