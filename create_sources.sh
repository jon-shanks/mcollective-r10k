#!/bin/sh

tar -zcvf mcollective-r10k-agent-1.0.0.tgz usr/libexec/mcollective/mcollective/agent/r10k.rb
tar -zcvf mcollective-r10k-common-1.0.0.tgz usr/libexec/mcollective/mcollective/agent/r10k.dll
tar -zcvf mcollective-r10k-client-1.0.0.tgz usr/libexec/mcollective/mcollective/application/r10k.rb
