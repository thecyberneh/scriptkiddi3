<h1 align="center">
  <br>
  <a href="https://twitter.com/thecyberneh"><img src="images/scriptkiddi3Nobg.png" alt="SCRIPTKIDDI3"></a>
</h1>
<h4 align="center">Streamline your recon and vulnerability detection process with SCRIPTKIDDI3,
A recon and initial vulnerability detection tool built using shell script and open source tools.</h4>


<p align="center">
<a><img title="Made in INDIA" src="https://img.shields.io/badge/MADE%20IN-INDIA-SCRIPT?colorA=%23ff8100&colorB=%23017e40&colorC=%23ff0000&style=for-the-badge"></a>
</p>
<p align="center">
<a href="https://github.com/thecyberneh/scriptkiddi3/releases"><img src="https://img.shields.io/github/downloads/thecyberneh/scriptkiddi3/total?color=green">
<a href="https://github.com/thecyberneh/scriptkiddi3/releases/"><img src="https://img.shields.io/github/v/release/thecyberneh/scriptkiddi3?include_prereleases">
<img scr="https://img.shields.io/github/stars/thecyberneh/scriptkiddi3?style=social">
<br>
<a href="https://twitter.com/thecyberneh"><img src="https://img.shields.io/twitter/follow/thecyberneh?style=social"></a>

<p align="center">
  <a href="#how-it-works-">How it works</a> •
  <a href="#install-scriptkiddi3">Installation</a> •
  <a href="#usage">Usage</a> •
  <a href="#modes">MODES</a> •
  <a href="#for-developers">For Developers</a> •
  <a href="#credits">Credits</a> 
</p>

---
</p>

 
Introducing SCRIPTKIDDI3, a powerful recon and initial vulnerability detection tool for Bug Bounty Hunters. Built using a variety of open-source tools and a shell script, SCRIPTKIDDI3 allows you to quickly and efficiently run a scan on the target domain and identify potential vulnerabilities.

SCRIPTKIDDI3 begins by performing recon on the target system, collecting information such as subdomains, and running services with nuclei. It then uses this information to scan for known vulnerabilities and potential attack vectors, alerting you to any high-risk issues that may need to be addressed.

In addition, SCRIPTKIDDI3 also includes features for identifying misconfigurations and insecure default settings with nuclei templates, helping you ensure that your systems are properly configured and secure.

SCRIPTKIDDI3 is an essential tool for conducting thorough and effective recon and vulnerability assessments.
Let's Find Bugs with SCRIPTKIDDI3

[Thanks ChatGPT for the Description]
  

  
## How it Works ?
This tool mainly performs 3 tasks
1. Effective Subdomain Enumeration from Various Tools
2. Get URLs with open HTTP and HTTPS service.
3. Run a Nuclei and other scans on previous output
So basically, this is an autmation script for your initial recon in bugbounty
  
## Install SCRIPTKIDDI3
   SCRIPTKIDDI3 requires different tools to run successfully. Run the following command to install the latest version with all requirments-

 ```sh
git clone https://github.com/thecyberneh/scriptkiddi3.git
cd scriptkiddi3
bash installer.sh
```
## IMPORTANT NOTES | Webhook configurations
- Scriptkiddi3 is using webhooks to send notifications to your Discord/MSTeam/Telegram and other services, so make sure to configure the web hooks by addind URL of your webhook in 
  `/$HOME/.config/notify/provider-config.yaml`
- The default links will send the notifiction to my (thecyberneh's) discord and MSTeam.
- You can paste the URL of your own webhook in following `provider-config.yaml` file ( Do not forget to save it in location :- `/$HOME/.config/notify/provider-config.yaml`
```yaml
slack:
  - id: "slack"
    slack_channel: "recon"
    slack_username: "test"
    slack_format: "{{data}}"
    slack_webhook_url: "https://hooks.slack.com/services/XXXXXX"

  - id: "vulns"
    slack_channel: "vulns"
    slack_username: "test"
    slack_format: "{{data}}"
    slack_webhook_url: "https://hooks.slack.com/services/XXXXXX"

discord:
  - id: "crawl"
    discord_channel: "crawl"
    discord_username: "test"
    discord_format: "{{data}}"
    discord_webhook_url: "https://discord.com/api/webhooks/XXXXXXXX"

  - id: "subs"
    discord_channel: "subs"
    discord_username: "test"
    discord_format: "{{data}}"
    discord_webhook_url: "https://discord.com/api/webhooks/XXXXXXXX"

telegram:
  - id: "tel"
    telegram_api_key: "XXXXXXXXXXXX"
    telegram_chat_id: "XXXXXXXX"
    telegram_format: "{{data}}"
    telegram_parsemode: "Markdown" # None/Markdown/MarkdownV2/HTML (https://core.telegram.org/bots/api#formatting-options)

pushover:
  - id: "push"
    pushover_user_key: "XXXX"
    pushover_api_token: "YYYY"
    pushover_format: "{{data}}"
    pushover_devices:
      - "iphone"

smtp:
  - id: email
    smtp_server: mail.example.com
    smtp_username: test@example.com
    smtp_password: password
    from_address: from@email.com
    smtp_cc:
      - to@email.com
    smtp_format: "{{data}}"
    subject: "Email subject"
    smtp_html: false
    smtp_disable_starttls: false

googlechat:
  - id: "gc"
    key: "XXXXXXXX"
    token: "XXXXXX"
    space: "XXXXXX"
    google_chat_format: "{{data}}"

teams:
  - id: "recon"
    teams_webhook_url: "https://<domain>.webhook.office.com/webhookb2/xx@xx/IncomingWebhook/xx"
    teams_format: "{{data}}"

custom:
  - id: webhook
    custom_webhook_url: http://host/api/webhook
    custom_method: GET
    custom_format: '{{data}}'
    custom_headers:
      Content-Type: application/json
      X-Api-Key: XXXXX
      
custom:
  - id: webhookJson
    custom_webhook_url: http://host/api/webhook
    custom_method: GET
    custom_format: '{"text":{{dataJsonString}} }'
    custom_headers:
      Content-Type: application/json
      X-Api-Key: XXXXX

custom:
  - id: webhook
    custom_webhook_url: http://host/api/webhook
    custom_method: GET
    custom_sprig: '{"text":"{{ .url }}"}'
    custom_headers:
      Content-Type: application/json
      X-Api-Key: XXXXX
```
  
## Usage 

```sh
scriptkiddi3 -h
```
This will display help for the tool. Here are all the switches it supports.
  
```console
[ABOUT:]
   Streamline your recon and vulnerability detection process with SCRIPTKIDDI3,
   A recon and initial vulnerability detection tool built using shell script and open source tools.


[Usage:]
   scriptkiddi3 [MODE] [FLAGS]
   scriptkiddi3 -m EXP -d target.com -c /path/to/config.yaml


[MODES:]
    ['-m'/'--mode']
         Available Options for MODE: 
         SUB | sub | SUBDOMAIN | subdomain           Run scriptkiddi3 in SUBDOMAIN ENUMERATION mode
         URL | url                                   Run scriptkiddi3 in URL ENUMERATION mode
         EXP | exp | EXPLOIT | exploit               Run scriptkiddi3 in Full Exploitation mode


         Feature of EXPLOI mode :                    subdomain enumaration, URL Enumeration,
                                                     Vulnerability Detection with Nuclei,
                                                     and Scan for SUBDOMAINE TAKEOVER

[FLAGS:]
    [TARGET:]   -d, --domain    target domain to scan

    [CONFIG:]   -c, --config    path of your configuration file for subfinder

    [HELP:]     -h, --help      to get help menu  
      
    [UPDATE:]   -u, --update    to update tool
  
[Examples:]
     Run scriptkiddi3 in full Exploitation mode
         scriptkiddi3 -m EXP -d target.com


     Use your own CONFIG file for subfinder
         scriptkiddi3 -m EXP -d target.com -c /path/to/config.yaml


     Run scriptkiddi3 in SUBDOMAIN ENUMERATION mode
         scriptkiddi3 -m SUB -d target.com


     Run scriptkiddi3 in URL ENUMERATION mode
         scriptkiddi3 -m SUB -d target.com

```

  
## MODES 
### 1. FULL EXPLOITATION MODE <br>
Run SCRIPTKIDDI3 in FULL EXPLOITATION MODE
```sh
  scriptkiddi3 -m EXP -d target.com
```
  
FULL EXPLOITATION MODE contains following functions
- Effective Subdomain Enumeration with different services and open source tools
- Effective URL Enumeration ( HTTP and HTTPs service )
- Run Vulnerability Detection with Nuclei
- Subdomain Takeover Test on previous results
<br>
  
### 2. SUBDOMAIN ENUMERATION MODE <br>
Run scriptkiddi3 in SUBDOMAIN ENUMERATION MODE
```sh
  scriptkiddi3 -m SUB -d target.com
```
SUBDOMAIN ENUMERATION MODE contains following functions
- Effective Subdomain Enumeration with different services and open source tools
- You can use this mode if you only want to get subdomains from this tool
  or we can say Automation of Subdmain Enumeration by different tools
<br>
  
### 3. URL ENUMERATION MODE <br>
Run scriptkiddi3 in URL ENUMERATION MODE
```sh
  scriptkiddi3 -m URL -d target.com
```
URL ENUMERATION MODE contains following functions
  - Same Feature as SUBDOMAIN ENUMERATION MODE but also identifies HTTP or HTTPS service
  
Using your own CONFIG File for subfinder
```sh
  scriptkiddi3 -m EXP -d target.com -c /path/to/config.yaml
```
You can also provie your own CONDIF file with your API Keys for subdomain enumeration with subfinder
  
Updating tool to latest version
You can run following command to update tool
```sh
  scriptkiddi3 -u
```

An Example of config.yaml
```yaml
binaryedge:
  - 0bf8919b-aab9-42e4-9574-d3b639324597
  - ac244e2f-b635-4581-878a-33f4e79a2c13
censys:
  - ac244e2f-b635-4581-878a-33f4e79a2c13:dd510d6e-1b6e-4655-83f6-f347b363def9
certspotter: []
passivetotal:
  - sample-email@user.com:sample_password
securitytrails: []
shodan:
  - AAAAClP1bJJSRMEYJazgwhJKrggRwKA
github:
  - ghp_lkyJGU3jv1xmwk4SDXavrLDJ4dl2pSJMzj4X
  - ghp_gkUuhkIYdQPj13ifH4KA3cXRn8JD2lqir2d4
zoomeye:
  - zoomeye_username:zoomeye_password
```
  
## For Developers
If you have ideas for new functionality or modes that you would like to see in this tool, you can always submit a pull request (PR) to contribute your changes.
  
If you have any other queries, you can always contact me on <a href="https://twitter.com/thecyberneh">Twitter(thecyberneh) </a>
  

## Credits
I would like to express my gratitude to all of the open source projects that have made this tool possible and have made recon tasks easier to accomplish.
