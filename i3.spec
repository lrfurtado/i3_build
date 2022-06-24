%define build_timestamp %(date +"%Y%m%d%H%M")
%define build_git_describe %(cat /rpmbuild/version)

Name:       i3
Version:    %{build_timestamp}
Release:    1
Summary:    i3wm window manager
License:    YOLO
Group:      Applications/luciano

%description
this a package for the i3wm window manager

was built from this commit: %{build_git_describe}

%prep
# we have no source, so nothing here

%build
cp /src/i3/build/i3 .

%install
mkdir -p %{buildroot}/usr/bin/
install -m 755 i3 %{buildroot}/usr/bin/i3

%files
/usr/bin/i3

%changelog
# let's skip this for now

