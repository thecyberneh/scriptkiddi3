#!/bin/bash
apt-get install shc
apt-get install jq
apt-get install unzip
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/OWASP/Amass/v3/...@master
go install github.com/ffuf/ffuf@latest
go install -v github.com/LukaSikic/subzy@latest
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
wget https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip
unzip findomain-linux.zip  
mv findomain $HOME/go/bin
chmod 777 $HOME/go/bin/findomain
go install github.com/tomnomnom/httprobe@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

shc -f scriptkiddi3.sh   
mv scriptkiddi3.sh scriptkiddi3
cp scriptkiddi3 $HOME/go/bin
chmod 777 $HOME/go/bin/scriptkiddi3
rm -rf scriptkiddi3.sh   

wget https://wordlists-cdn.assetnote.io/data/automated/httparchive_subdomains_2020_11_18.txt -O  subdomains.txt
mv subdomains.txt /usr/share/wordlists/
chmod 777 /usr/share/wordlists/subdomains.txt

cd /$HOME/.config/
mkdir notify
wget "https://raw.githubusercontent.com/projectdiscovery/notify/main/cmd/integration-test/test-config.yaml" 
mv test-config.yaml provider-config.yaml
mv provider-config.yaml /$HOME/.config/notify/


echo -e "DO NOT FORGET TO ADD YOUR OWN WEBHOOK URL IN $HOME/.config/notify/provider-config.yaml"
