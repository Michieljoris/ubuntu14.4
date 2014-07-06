# apt-get update
HOME="/home/vagrant"
# git
apt-get  -y install git
cp $HOME/provision/.git-prompt.sh $HOME/ 

# nodejs and npm
apt-get -y install  rlwrap nodejs npm

mkdir $HOME/bin

# serf
cp $HOME/provision/serf $HOME/bin

# docker
apt-get -y install  docker.io
ln -sf /usr/bin/docker.io /usr/local/bin/docker
sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io

#bash
cp $HOME/provision/fasd $HOME/bin/ # works, but prompt is funny, so disabled in .bashrc
cp $HOME/provision/.bashrc $HOME/

