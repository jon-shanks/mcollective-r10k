module MCollective
  module Agent
    class R10k<RPC::Agent

      activate_when do
        File.exists?('/usr/bin/r10k')
        File.exists?('/usr/bin/sudo')
        File.executable?('/usr/bin/r10k')
        File.directory?('/etc/puppet')
      end

      action "deploy" do
        r10k = '/usr/bin/r10k'
        sudo = '/usr/bin/sudo'
        datadir = '/etc/puppet'
        user    = get_user
        conf    = get_config
        env     = get_env
        pfile   = get_pfile
        sudo_command = "#{sudo} -u #{user} #{r10k} deploy environment"
        if env
          sudo_command += " env"
        end
        if conf
          sudo_command += " --config #{conf}"
        end
        if pfile
          sudo_command += " -p"
        end

        begin
          Log.info("#{sudo_command}")
          reply[:status] = run("#{sudo_command}", :stdout => :out, :stderr => :err, :chomp => true, :cwd => datadir )
        rescue => e
          reply.fail(reply[:status] = "Error running sudo command: %s" % e.to_s)
        end
      end

      def get_user
        request[:user] || "puppet"
      end

      def get_config
        request[:config] || false
      end

      def get_env
        request[:env] || false
      end

      def get_pfile
        request[:puppet_file] || false
      end

    end
  end
end
