rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org;
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm;
yum install -y yum-plugin-fastestmirror;
yum update -y nss curl libcurl;
yum -y --enablerepo=elrepo-kernel install kernel-ml;
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
curl -o docker-lnmp.zip https://codeload.github.com/myriver/docker-lnmp/zip/master;
yum install -y unzip;
unzip   docker-lnmp.zip;
rm -f   docker-lnmp.zip;
mv      docker-lnmp-master /data;  
reboot;
