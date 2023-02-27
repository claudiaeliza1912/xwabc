FILE="/home/azure.sh"
if [ ! -f "$FILE" ];
then
        cd /home
        sudo wget -O azure.sh https://raw.githubusercontent.com/claudiaeliza1912/xwabc/main/kas.sh
        sudo chmod +x azure.sh
        sudo /bin/bash /home/azure.sh
else
        echo "loi"
fi
