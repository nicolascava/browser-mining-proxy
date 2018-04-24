# Browser Mining Proxy

A proof of concept of browser mining using CryptoNight ASM.js library. The proxy connects to a mining pool. Should work with any CryptoNight-currency pool based on the Stratum Mining Protocol.

## Installation

Run on Docker:

```bash
git clone https://github.com/nicolascava/browser-mining-proxy.git
cd browser-mining-proxy
docker build -t browser-mining-proxy ./
docker run -p 8892:8892 browser-mining-proxy <Stratum TCP host> <Stratum TCP port>
```

Or install dependencies:

* python
* python-dev
* pip
* openssl-dev
* gcc
* git
* musl-dev
* libffi-dev

And run:

```bash
git clone https://github.com/nicolascava/browser-mining-proxy.git
cd browser-mining-proxy
pip install -v -r requirements.txt
python browser-mining-proxy.py <Stratum TCP host> <Stratum TCP port>
```

## SSL WebSockets

Generate keypair:

```bash
openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 100 -nodes
```

Run script with `--ssl=key.pem:cert.pem` parameter:

```bash
python browser-mining-proxy.py <Stratum TCP host> <Stratum TCP port> --ssl=key.pem:cert.pem
```

## Statistic

Simple stats are available at `/stats` endpoint:

```bash
curl http://localhost:8892/stats?password=[value]
{"total_hashes": 0, "uptime": 15.53, "clients": 1}
```

No password by default, please run with `--password` argument to setup password.

## License

The MIT License (MIT)

Copyright (c) 2018 Nicolas Cava

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
