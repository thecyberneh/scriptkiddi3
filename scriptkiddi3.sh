#!/bin/bash

dblue="\e[0;94m"
dred="\033[1;31m"
lblue="\e[96m"
lred="\033[31m"
lyellow="\e[93m"
yellow="\e[33m"
reset="\e[0m"




#--------------------------Functions------------------------------#
#-----------------------------------------------------------------#


#forBanner
banner () {
    printf ""$lblue"
███████╗ ██████╗██████╗ ██╗██████╗ ████████╗██╗  ██╗██╗██████╗ ██████╗ ██╗██████╗ 
██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝██║ ██╔╝██║██╔══██╗██╔══██╗██║╚════██╗
███████╗██║     ██████╔╝██║██████╔╝   ██║   █████╔╝ ██║██║  ██║██║  ██║██║ █████╔╝
╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   ██╔═██╗ ██║██║  ██║██║  ██║██║ ╚═══██╗
███████║╚██████╗██║  ██║██║██║        ██║   ██║  ██╗██║██████╔╝██████╔╝██║██████╔╝
╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   ╚═╝  ╚═╝╚═╝╚═════╝ ╚═════╝ ╚═╝╚═════╝ 
                                                                                    

                            V0.1.2 (beta)
                            Coded By Neh Patel with Love <3 ❤
    "$reset""


    printf ""$lred"
Twitter :-   https://twitter.com/thecyberneh
Instagram :- https://www.instagram.com/thecyberneh/
Linkedin :-  https://linkedin.com/in/thecyberneh
"$reset""
echo -e "\n"
}



#-----------------------------------------------------------------#


#for_print_INFO
fun_info () {
    echo -e "[${dblue}INFO${reset}] "
}


#-----------------------------------------------------------------#


#for_print_INIT
fun_init () {
    echo -e "[${dblue}INIT${reset}] "
}


#-----------------------------------------------------------------#


#for_print_INPUT
fun_input () {
    echo -e "[${dblue}INPUT${reset}]"
}


#-----------------------------------------------------------------#


#for_print_IMP
fun_imp () {
    echo -e "[${dred}IMP${reset}]  "
}


#-----------------------------------------------------------------#


#for_print_ERR
fun_err () {
    echo -e "[${dred}ERR${reset}]  "
}


#-----------------------------------------------------------------#


#for_create_directory
fun_dir () {
    mkdir ${DOMAIN}
    cd ${DOMAIN}
    sleep .5
    echo -e "$(fun_info) Saving all output files in directory: ${DOMAIN}"
    sleep .5
    echo -e "\n"
}


#-----------------------------------------------------------------#


#print_flags
fun_flags () {
    sleep .5
    echo -e "$(fun_info) Target Domain:- $DOMAIN"
    echo -e "\n"
    sleep .5
    echo -e "$(fun_info) Config File:- $CONFIG"
    echo -e "\n"
    sleep .5
    echo -e "$(fun_info) Mode:- $MODE"
    echo -e "\n"
}


#-----------------------------------------------------------------#


#for_help
fun_help () {
  banner
  echo -e "${lyellow}[ABOUT]${reset}"
  echo -e "   Streamline your recon and vulnerability detection process with SCRIPTKIDDI3,"
  echo -e "   A recon and initial vulnerability detection tool built using shell script and open source tools."
  echo -e "\n"
  echo -e "${lyellow}[Usage:]${reset}"
  echo -e "   scriptkiddi3 [MODE] [FLAGS]"
  echo -e "   scriptkiddi3 -m EXP -d target.com -c /path/to/config.yaml"
  echo -e "\n"

  echo -e "${lyellow}[MODES:]${reset}"
  echo -e "${yellow}    ['-m'/'--mode']${reset}"
  echo -e "         Available Options for MODE: "
  echo -e "         SUB | sub | SUBDOMAIN | subdomain           Run scriptkiddi3 in SUBDOMAIN ENUMERATION mode"
  echo -e "         URL | url                                   Run scriptkiddi3 in URL ENUMERATION mode"
  echo -e "         EXP | exp | EXPLOIT | exploit               Run scriptkiddi3 in Full Exploitation mode"
  echo -e "\n"
  echo -e "         Feature of EXPLOIT mode :                    subdomain enumaration, URL Enumeration,"
  echo -e "                                                     Vulnerability Detection with Nuclei,"
  echo -e "                                                     and Scan for SUBDOMAINE TAKEOVER"
  echo -e ""


  echo -e "${lyellow}[FLAGS:]${reset}"
  echo -e "${yellow}    [TARGET:]${reset}   -d, --domain    target domain to scan"
  #echo -e "       -d, --domain       target domain to scan"
  echo -e "\n"
  echo -e "${yellow}    [CONFIG:]${reset}   -c, --config    path of your configuration file for subfinder"
  #echo -e "       -c, --config    path of your configuration file for subfinder"
  echo -e "\n"
  echo -e "${yellow}    [HELP:]${reset}     -h, --help      to get help menu"
  #echo -e "       -h, --help    to get help menu" 
  echo -e "\n"
  echo -e "${yellow}    [UPDATE:]${reset}   -u, --update    to update tool"
  echo -e "\n"
  echo -e "${lyellow}[Examples:]${reset}"
  echo -e "     Run scriptkiddi3 in full Exploitation mode"
  echo -e "${lyellow}         scriptkiddi3 -m EXP -d target.com${reset}"

  echo -e "\n"
  echo -e "     Use your own CONFIG file for subfinder"
  echo -e "${lyellow}         scriptkiddi3 -m EXP -d target.com -c /path/to/config.yaml${reset}"
  echo -e "\n"

  echo -e "     Run scriptkiddi3 in SUBDOMAIN ENUMERATION mode"
  echo -e "${lyellow}         scriptkiddi3 -m SUB -d target.com${reset}"
  echo -e "\n"

  echo -e "     Run scriptkiddi3 in URL ENUMERATION mode"
  echo -e "${lyellow}         scriptkiddi3 -m URL -d target.com${reset}"
  echo -e "\n"
}


#-----------------------------------------------------------------#


#forRunSubzy
run_subzy () {
    echo -e "\n"
    read -t 5 -p "$(fun_input) Want to scan for Subdomain takeover ? " SUBZY
    echo -e "\n"
    if [ "$SUBZY" = 'y' ] || [ "$SUBZY" = 'Y' ]
    then
        sleep .5
        echo -e "$(fun_info) Checking for Subdomain Takeover "
        subzy run --targets allSubdomains.txt | tee subDomain_takeover_Results.txt
        echo -e "\n"
    fi
}


#-----------------------------------------------------------------#


#for_run_Subfinder
fun_subFinderEnum () {
    if [ "$CONFIG" = '' ]
    then
        echo -e "$(fun_init) Initializing SUBDOMAIN ENUMERATION from subfinder... "
        echo -e "\n"
        echo -e "$(fun_info) We are not using API Keys "
        echo -e "\n"
        echo -e "\n"        
        subfinder -silent -d $DOMAIN -o subfinderWAPIResults.txt
        echo -e "\n"
        echo -e "\n"
        echo -e "$(fun_info) It will take some time depens on your target size "
        echo -e "\n"
        echo -e "\n"
        echo -e "$(fun_info) Subfider Enumeration Completed, Results saves in file: ${lyellow}subfinderWAPIResults.txt${reset}"
        touch subfinderNoAPIResults.txt
        echo -e "File touch done"
    else
        echo -e "$(fun_init) Initializing SUBDOMAIN ENUMERATION from subfinder... "
        echo -e "\n"
        echo -e "$(fun_info) We are using API Keys "
        echo -e "\n"
        echo -e "\n"        
        subfinder -d $DOMAIN -pc $CONFIG -o subfinderNoAPIResults.txt
        echo -e "\n"
        echo -e "\n"
        echo -e "$(fun_info) Subfider Enumeration Completed, Results saves in file: ${lyellow}subfinderNoAPIResults.txt${reset}"
        touch subfinderWAPIResults.txt
    fi
    echo -e "\n"
    echo -e "$(fun_info) Removing Duplicates"
    echo -e "\n"
    sort subfinderWAPIResults.txt subfinderNoAPIResults.txt | uniq | tee subfinerMainResults.txt

}




#-----------------------------------------------------------------#


#for_run_findomain
fun_findomainEnum () {
    echo -e "\n"
    echo -e "$(fun_init) Initializing SUBDOMAIN ENUMERATION from findomain... "
    echo -e "\n"
    echo -e "\n"
    findomain --target $DOMAIN --output
    echo -e "\n"
    echo -e "\n"
    echo -e "$(fun_info) Findomain Enumeration Completed, Results saves in file: ${lyellow}${DOMAIN}.txt${reset}"
}


#-----------------------------------------------------------------#


#for_ownedBy
ownedby () {
    echo -e "\n"
    read -t 5 -p "$(fun_input) Want to scan on other Domain/Assets owned by company ? " OWNEDBY
    echo -e "\n"
    if [ "$OWNEDBY" = 'y' ] || [ "$OWNEDBY" = 'Y' ]
    then
        sleep .5
        echo -e "\n"
        echo -e "$(fun_init) Initializing SUBDOMAIN ENUMERATION from Amass intel... "
        echo -e "\n"
        echo -e "\n"
        amass intel -whois -d $DOMAIN -o amassIntelResults.txt
        echo -e "\n"
        echo -e "\n"
        echo -e "$(fun_info) Amass [Mode:Intel] Enumeration Completed, Results saves in file: ${lyellow}amassIntelResults.txt${reset}"        
    else
        touch amassIntelResults.txt
    fi
}


#-----------------------------------------------------------------#


#for_run_amassEnum
fun_amassEnum () {
        echo -e "\n"
        echo -e "$(fun_init) Initializing SUBDOMAIN ENUMERATION from Amass enum... "
        echo -e "\n"
        echo -e "\n"
        amass enum -passive -norecursive -noalts -d $DOMAIN | tee amassEnumResults.txt
        echo -e "\n"
        echo -e "\n"
        echo -e "$(fun_info) Amass [Mode:Enum] Enumeration Completed, Results saves in file: ${lyellow}amassEnumResults.txt${reset}"

        ownedby
        sort amassEnumResults.txt amassIntelResults.txt | uniq | tee amassMainResults.txt

}


#-----------------------------------------------------------------#


#for_run_ffufbrute
fun_ffufBruteEnum () {
    echo -e "\n"
    read -t 5 -p "$(fun_input) Want to get subdomain with bruteforce ? " FFUFBF
    echo -e "\n"
    if [ "$FFUFBF" = 'y' ] || [ "$FFUFBF" = 'Y' ]
    then    
        echo -e "\n"
        echo -e "$(fun_init) Initializing SUBDOMAIN ENUMERATION from FFUF Bruteforce... "
        echo -e "\n"
        echo -e "\n"
        ffuf -u https://FUZZ.${DOMAIN}/ -w /usr/share/wordlists/subdomains.txt -v | grep '| URL |' | grep -Po '.*?//\K.*?(?=/)' | tee ffufBruteSubdResults.txt
        echo -e "\n"
        echo -e "\n"
        echo -e "$(fun_info) FFUF Bruteforce Completed, Results saves in file: ${lyellow}ffufBruteSubdResults.txt${reset}"
    else
        touch ffufBruteSubdResults.txt
    fi
}


#-----------------------------------------------------------------#


#from_crtsh
fun_crtshEnum () {
    echo -e "\n"
    echo -e "$(fun_init) Initializing SUBDOMAIN ENUMERATION from crt.sh ... "
    echo -e "\n"
    echo -e "\n"
    curl -s "https://crt.sh?q=${DOMAIN}&output=json" | jq ".[].common_name,.[].name_value"| cut -d'"' -f2 | sed 's/\\n/\n/g' | sed 's/\*.//g'| sed -r 's/([A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4})//g' | sort | uniq | tee crtshResults.txt
    echo -e "\n"
    echo -e "\n"
    echo -e "$(fun_info) CRT SH Bruteforce Completed, Results saves in file: ${lyellow}crtshResults.txt${reset}"    
}

#-----------------------------------------------------------------#


#for_gather_all_Subdomain
fun_getAllSubd () {
    fun_subFinderEnum
    fun_findomainEnum
    fun_amassEnum
    fun_ffufBruteEnum
    fun_crtshEnum
    echo -e "\n"
    echo -e "$(fun_info) Removing Duplicates"
    echo -e "\n"
    sort subfinerMainResults.txt ${DOMAIN}.txt amassMainResults.txt ffufBruteSubdResults.txt crtshResults.txt | uniq | tee allSubdomains.txt
}


#-----------------------------------------------------------------#


#DomainToUrl
fun_getUrl () {
    echo -e "\n"
    echo -e "$(fun_init) Getting URLs from httprobe... "
    echo -e "\n"
    echo -e "\n"
    cat allSubdomains.txt | httprobe | tee httprobeResults.txt
    echo -e "\n"
    echo -e "\n"
    echo -e "$(fun_init) Getting URLs from httpx... "
    echo -e "\n"
    echo -e "\n"
    echo -e "$(fun_info) It will take some time depens on your target size "
    echo -e "\n"
    echo -e "\n"
    cat allSubdomains.txt | httpx -silent | tee httpxResults.txt
    echo -e "\n"
    sort httprobeResults.txt httpxResults.txt | uniq | tee allUrls.txt
    echo -e "\n"
    echo -e "\n"
    echo -e "$(fun_info) URL Enumeration, Results saves in file: ${lyellow}allUrls.txt${reset}"

}


#-----------------------------------------------------------------#


#run_nuclei
fun_runNuclei () {
    echo -e "\n"
    echo -e "$(fun_init) Running Vulnerability detection "
    echo -e "\n"
    echo -e "\n"
    nuclei -silent -l allUrls.txt -t $HOME/nuclei-templates/ -o nucleiResults.txt
} 


#-----------------------------------------------------------------#


#for_update
fun_update () {
    git clone https://github.com/thecyberneh/scriptkiddi3.git
    cd thecyberneh
    bash installer.sh
}

#-----------------------------------------------------------------#
#-----------------------------------------------------------------#

while true; do
    case "$1" in
        '-d'|'--domain')
            if [ "$2" = '' ]
            then 
                 echo -e "$(fun_err) Value of '-d'\'--domain' must not be blank"
                 exit
            fi

            DOMAIN=$2
            shift 2
            continue
            ;;
        '-m'|'--mode')
                       
            if [ "$2" = '' ]
            then 
                 echo -e "$(fun_err) Value of '-m'\'--mode' must not be blank"
                 echo -e "$(fun_info) Prining Help Menu"

                 exit
            fi

            MODE=$2 
            shift 2
            continue
            ;;
        '-c'|'--config')

            if [ "$2" = '' ]
            then 
                 echo -e "$(fun_err) Value of '-c'/'--config' must not be blank"
                 echo -e "$(fun_info) Remove '-c'/'--config' flag if you want to run with default config"
                 echo -e "$(fun_info) Prining Help Menu"
                 exit
            fi

            CONFIG=$2
            shift 2
            continue
            ;;

        '-h'| '--help')
            fun_help
            exit 1
            ;; 

        '-u'|'--update')
            banner
            fun_update
            exit 1
            ;;

        '')
            break
            ;;

        *)
            echo "Unknown argument: $1"
            exit 1
            ;;


    esac
done


#-----------------------------------------------------------------#


if [ "$MODE" = 'sub' ] || [ "$MODE" = 'SUB' ] || [ "$MODE" = 'subdomain' ]  || [ "$MODE" = 'SUBDOMAIN' ]
then
    banner
    fun_flags
    fun_dir
    fun_getAllSubd

elif [ "$MODE" = 'url' ] || [ "$MODE" = 'URL' ]
then
    banner
    fun_flags
    fun_dir
    fun_getAllSubd
    fun_getUrl

elif [ "$MODE" = 'exploit' ] || [ "$MODE" = 'EXPLOIT' ] || [ "$MODE" = 'EXP' ] || [ "$MODE" = 'exp' ]
then
    banner
    fun_flags
    fun_dir
    fun_getAllSubd
    fun_getUrl
    fun_runNuclei
    run_subzy

else
    echo -e "$(fun_err) Unable to understand ${lyellow}MODE${reset}, Running help Menu"
    fun_help
fi
