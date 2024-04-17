#!bin/bash

read -p 'Enter your project name: ' project_name
read -p 'Enter your project environment: ' project_environment
read -p 'Enter your project url: ' project_url

dir=zs_${project_name}_${project_environment}
[ -d $dir ] | rm -r $dir
mkdir $dir
echo 'Working folder in: ' ${dir}

echo "Start ZAP api passive scan..."

docker run -v $(pwd):/zap/wrk/:rw -t softwaresecurityproject/zap-stable zap-baseline.py -t $project_url -z options.prop -g $dir/$dir-api-passive-scan.conf -r $dir/$dir-api-passive-scan-report.html

echo "Start ZAP api active scan..."

docker run -v $(pwd):/zap/wrk/:rw -t softwaresecurityproject/zap-stable zap-api-scan.py -t openapi.json -z options.prop -g $dir/$dir-api-active-scan.conf -r $dir/$dir-api-active-scan-report.html