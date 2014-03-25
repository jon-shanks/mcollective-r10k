%global agent_path '/usr/libexec/mcollective/mcollective/agent/'

Summary: Mcollective agent for r10k
Name: mcollective-r10k-agent
Version: 1.0.0
Release: 1
License: Jon Shanks
URL: http://www.puppetlabs.com/mcollective
Vendor: Jon Shanks
Packager: Jonathan Shanks <jon.shanks@gmail.com>
BuildRoot: %{_tmppath}/%{real_name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildArch: noarch
Group: System Tools
Source0: %{name}-%{version}.tgz
Requires: mcollective-common >= 2.4.1
Requires: mcollective-r10k-common >= 1.0.0
Requires: rubygem-r10k >= 1.1.4

%description
Used for managing puppet cluster data from git with mcollective for r10k usage

%prep
%setup -c

%build

%install
rm -rf %{buildroot}
%{__install} -d -m0755 %{buildroot}%{agent_path}

%{__install} -m0644 usr/libexec/mcollective/mcollective/agent/r10k.rb %{buildroot}%{agent_path}r10k.rb

%files
%defattr(-,root,root,-)
/usr/libexec/mcollective/mcollective/agent/r10k.rb


%changelog
* Tue Mar 25 2014 Jonathan Shanks <jon.shanks@gmail.com> - 1.0.0-1
- Built Package mcollective-r10k-agent
