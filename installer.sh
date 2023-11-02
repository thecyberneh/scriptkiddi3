#!/bin/bash
sudo apt-get install shc
sudo apt-get install jq
sudo apt-get install unzip
sudo apt install cargo 
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/owasp-amass/amass/v4/...@master
go install github.com/ffuf/ffuf/v2@latest
go install -v github.com/LukaSikic/subzy@latest
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
wget https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip
unzip findomain-linux.zip  
mv findomain /$HOME/go/bin
chmod 777 /$HOME/go/bin/findomain
go install github.com/tomnomnom/httprobe@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
wget https://github.com/junnlikestea/vita/releases/download/0.1.16/vita-0.1.16-x86_64-unknown-linux-musl.tar.gz
tar xsvf vita-0.1.16-x86_64-unknown-linux-musl.tar.gz 
cp vita-0.1.16-x86_64-unknown-linux-musl/vita /$HOME/go/bin/
chmod 777 /$HOME/go/bin/vita   

shc -f scriptkiddi3.sh   
mv scriptkiddi3.sh.x scriptkiddi3
cp scriptkiddi3 /$HOME/go/bin
chmod 777 /$HOME/go/bin/scriptkiddi3
rm -rf scriptkiddi3.sh

wget https://wordlists-cdn.assetnote.io/data/automated/httparchive_subdomains_2020_11_18.txt -O  subdomains.txt
sudo mv subdomains.txt /usr/share/wordlists/
sudo chmod 777 /usr/share/wordlists/subdomains.txt
cd /$HOME/.config/
mkdir notify

wget "https://raw.githubusercontent.com/projectdiscovery/notify/main/cmd/integration-test/test-config.yaml" 
mv test-config.yaml provider-config.yaml
mv provider-config.yaml /$HOME/.config/notify/


echo -e "DO NOT FORGET TO ADD YOUR OWN WEBHOOK URL IN $HOME/.config/notify/provider-config.yaml"
