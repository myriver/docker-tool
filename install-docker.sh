rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org;
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm;
yum install -y yum-plugin-fastestmirror;
yum -y --enablerepo=elrepo-kernel install kernel-lt;
grub2-set-default 0;
curl -sSL https://get.daocloud.io/docker | sh;
echo "dockremap:165536:65536" >/etc/subuid;
echo "dockremap:165536:65536" >/etc/subgid;
service docker restart;
echo "{                   
        \"userns-remap\": \"default\",
        \"registry-mirrors\":[\"http://1ceae9d7.m.daocloud.io\"]
      }"  >/etc/docker/daemon.json;

curl -L https://get.daocloud.io/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose;
chmod +x /usr/local/bin/docker-compose;
curl -o webserver-dir-structure.zip https://codeload.github.com/myriver/webserver-dir-structure/zip/master;
yum install -y unzip;
unzip   webserver-dir-structure.zip;
rm -f   webserver-dir-structure.zip;
mv      webserver-dir-structure-master /data;  
reboot;
