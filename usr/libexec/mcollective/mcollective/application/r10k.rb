class MCollective::Application::R10k<MCollective::Application
  description "r10k Puppet Cluster Manager, used for managing puppet and hiera code deployment"
 
  usage "mco r10k deploy [-u <USER>] [-e <ENV>] [-c <CONFIG>] [-p]"

  option  :user, 
          :description    => "User to pull down the repository as",
          :arguments      => ["--user USER", "-u USER"],
          :required       => false,
          :type           => :string

  option  :env,
          :description    => "environment to deploy i.e. branch name",
          :arguments      => ["--env env_name", "-e env_name"],
          :required       => false,
          :type           => :string

  option  :puppet_file,
          :description    => "pull down modules from the puppetfile",
          :arguments      => ["-p", "--puppet_file"],
          :required       => false,
          :type           => :bool

  option  :config,
          :description    => "pass in the configuration file to use",
          :arguments      => ["-c", "--config"],
          :required       => false,
          :type           => :string

  def post_option_parser(configuration)
    configuration[:command] = ARGV.shift if ARGV.size > 0
  end

  def validate_configuration(configuration)
    configuration[:command] = "deploy" unless configuration.include?(:command)
  end

  def main
    r10k = rpcclient("r10k")
    opts = {}

    [:user, :env, :puppet_file, :config].each do |c|
      if configuration.has_key?(c)
        opts[c] = configuration[c]
      end
    end

    case configuration[:command]
    when "deploy"
      printrpc r10k.send(configuration[:command], opts)
    else
      puts "Valid commands are 'deploy'"
    end

    printrpcstats

    halt r10k.stats
  end
end
