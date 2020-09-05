#!/bin/bash
# Source: https://gist.github.com/Kungergely/b83c1e87cd569500bfc01a0e4849beb4

#SOURCE_RPM="http://download-ib01.fedoraproject.org/pub/fedora/linux/releases/31/Everything/source/tree/Packages/b/bindfs-1.14.1-2.fc31.src.rpm"

SOURCE_RPM=bindfs-1.14.3-2.fc32.src.rpm
SOURCE_RPM="https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Everything/source/tree/Packages/b/$SOURCE_RPM"

#Not working:
#SOURCE_RPM="bindfs-1.14.7-1.fc32.src.rpm"
#SOURCE_RPM_URL="https://download-ib01.fedoraproject.org/pub/fedora/linux/updates/32/Everything/SRPMS/Packages/b/$SOURCE_RPM"

mkdir -p /root/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}

dnf --nogpgcheck install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm wget zip unzip bzip2 gcc gcc-c++ rpm-build make ruby valgrind fuse-devel

wget $SOURCE_RPM_URL -o "/root/rpmbuild/$SOURCE_RPM"

cd /root/rpmbuild/
rpmbuild --rebuild $SOURCE_RPM
