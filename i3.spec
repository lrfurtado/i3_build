Name:       i3
Version:    1
Release:    1
Summary:    i3wm window manager
License:    YOLO

%description
this a package for the i3wm window manager

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

