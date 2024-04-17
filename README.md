# Pull docker image

docker pull softwaresecurityproject/zap-stable

# Passive scan:

docker run -t softwaresecurityproject/zap-stable zap-baseline.py -t https://api_endpoint

docker run -v .:/zap/wrk/:rw -t softwaresecurityproject/zap-stable zap-baseline.py -t https://api.staging.sumaiina.jp/api-json -r api-passive-scan-report.html

-z options.prop
-g api-passive-scan.conf
-c api-passive-scan.conf

docker run -v .:/zap/wrk/:rw -t softwaresecurityproject/zap-stable zap-baseline.py -t https://api.staging.sumaiina.jp/api-json -r api-passive-scan-report.html

# Active scan:

docker run -t owasp/zap2docker-weekly zap-api-scan.py -t <path_to_the_api_specs_file> -f <api_specs_format_type>

docker run -v .:/zap/wrk/:rw -t softwaresecurityproject/zap-stable zap-api-scan.py -t https://api.staging.sumaiina.jp/api-json -r api-active-scan-report.html

## docker run -v .:/zap/wrk/:rw -t softwaresecurityproject/zap-stable zap-api-scan.py -t openapi.json -f openapi -r api-active-scan-report.html

---

# Steps to scan secured APIs

## Passive

```bash
docker run -v $(pwd):/zap/wrk/:rw -t softwaresecurityproject/zap-stable zap-baseline.py -t https://stdj6oec90.execute-api.us-east-2.amazonaws.com/alpha/test -z options.prop -r api-passive-scan-report.html
```

## Active

```bash
docker run -v $(pwd):/zap/wrk/:rw -t owasp/zap2docker-weekly zap-api-scan.py -t openapi.json -f openapi -z "-config /zap/wrk/options.prop" -r report_html
```

---

# How to whitelist the applied config rules?

## 1. Generate a config file.

```bash
docker run -v $(pwd):/zap/wrk/:rw -t softwaresecurityproject/zap-stable zap-baseline.py -t https://s4qr6oec41.execute-api.us-east-2.amazonaws.com/alpha/test -z options.prop -g api-passive-scan.conf -r api-passive-scan-report.html
```

## 2. Update the rule type from WARN -> INFO or preferred type as per our requirement.

## 3. Execute the scan with the updated configuration.

```bash
docker run -v $(pwd):/zap/wrk/:rw -t softwaresecurityproject/zap-stable zap-baseline.py -t https://s4qr6oec41.execute-api.us-east-2.amazonaws.com/alpha/test -z options.prop -c api-passive-scan.conf -r api-passive-scan-report.html
```

---

docker run -v $(pwd):/zap/wrk/:rw -t softwaresecurityproject/zap-stable zap-baseline.py -t https://s4qr6oec41.execute-api.us-east-2.amazonaws.com/alpha/test -z options.prop -g api-passive-scan.conf -r api-passive-scan-report.htmlclear

docker run -v $(pwd):/zap/wrk/:rw -t softwaresecurityproject/zap-stable zap-api-scan.py -t openapi.json -f openapi -z options.prop -g api-active-scan.conf -r api-active-scan-report.html
