FROM centos:8
WORKDIR /src
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.epel.cloud|g' /etc/yum.repos.d/CentOS-Linux-*
RUN dnf install -y https://pkgs.dyn.su/el8/base/x86_64/raven-release-1.0-3.el8.noarch.rpm
RUN dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN dnf install 'dnf-command(config-manager)' -y
RUN dnf config-manager --set-enabled powertools
RUN dnf install -y git python3 && dnf groupinstall "Development Tools" -y
RUN python3 -mpip install meson
RUN git clone git://code.i3wm.org/i3 i3
RUN dnf install startup-notification-devel xcb-util-devel xcb-util-cursor-devel xcb-util-keysyms-devel xcb-util-wm-devel libxkbcommon-devel libxkbcommon-x11-devel yajl-devel pcre2-devel cairo-devel pango-devel libev-devel ninja-build perl-ExtUtils-MakeMaker xcb-util-xrm-devel -y
WORKDIR /src/i3/build
RUN mkdir -p /rpmbuild/ && git describe > /rpmbuild/version
RUN meson ..
RUN ninja
WORKDIR /rpmbuild
COPY i3.spec /rpmbuild
RUN rpmbuild -bb i3.spec

