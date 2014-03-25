mcollective-r10k
================

mcollective code for r10k and spec files for building RPM's

Usage
=====

Run the create_sources.sh to create the necessary tarballs
Place them within the rpmbuild/SOURCES on the machine
Place the SPECS within rpmbuild/SPECS on the machine

Run rpmbuild -ba rpmbuild/SPECS/mcollective-r10k*.spec to build the RPM's
