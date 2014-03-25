module MCollective
  module Agent
    # A basic agent for puppet to pull down the git repository from gerrit
    # it will expect the git command but is very basic can be expanded on
    # at a later date to be more cohesive with git as oppose inline with just
    # the functionality that we want for the puppet modules
    class Git<RPC::Agent

      activate_when do
        File.exists?('/usr/bin/r10k')
        File.executable?('/usr/bin/r10k')
        File.directory?('/etc/puppet/environments')
      end

      action "deploy" do
        r10k = '/usr/bin/r10k'
        if File.exists?(r10k) and File.executable?(r10k)
        end
      end

      def get_user
        request[:user] || "puppet"
      end

      def get_config
        request[:config] || '/etc/r10k.yaml'
      end

      def get_env
        request[:env] || false
      end

      def get_pfile
        request[:puppet_file] || false
      end

      def deploy
        user    = get_user
        conf    = get_config
        env     = get_env
        pfile   = get_pfile
        datadir = '/etc/puppet'
        sudo_command = "sudo -u #{user} #{r10k} deploy environment"
        if env
          sudo_command += " env"
        end
        if conf
          sudo_command += " -c #{conf}"
        end
        if pfile
          sudo_command += " -p"
        end

        reply[:status] = run("sudo #{sudo_command}", :stdout => :out, :stderr => :err, :chomp => true, :cwd => datadir )
        reply[:out]
        reply[:err]
      end

    end
  end
end
