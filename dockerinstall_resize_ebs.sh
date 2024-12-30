df -hT
lsblk
sudo growpart /dev/nvme0n1 4
sudo lvextend -l +50%FREE /dev/RootVG/rootVol
sudo lvextend -l +50%FREE /dev/RootVG/varVol
sudo xfs_growfs /
sudo xfs_growfs /var

echo "resize EBS success"

sudo yum install -y yum-utils
sudo yum config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin -y docker-compose-plugin -y
sudo systemctl start docker
sudo usermod -aG docker ec2-user
sudo docker ps

echo "docker install success"