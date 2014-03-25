metadata    :name         => "r10k",
            :description  => "Used to call liase with r10k to deploy puppet and hiera data to puppet clusters",
            :author       => "Jonathan Shanks <jon.shanks@gmail.com>",
            :license      => "Jon Shanks",
            :version      => "1.0.0",
            :url          => "",
            :timeout      => 30

requires    :mcollective  => "2.4.1"

action "deploy", :description => "Use r10k to pull down puppet and hiera data" do
  input :user,
        :prompt       => "user",
        :description  => "User to use for sudo to initiate r10k",
        :type         => :string,
        :validation   => '^.+$',
        :optional     => true,
        :maxlength    => 30,

  input :env,
        :prompt       => "env",
        :description  => "Environment <branch name> to pull down from git",
        :type         => :string,
        :validation   => '^.+$',
        :optional     => true,
        :maxlength    => 40,

  input :config
        :prompt       => "config",
        :description  => "A specific r10k configuration file to use",
        :type         => :string,
        :validation   => '^.+$',
        :optional     => true,
        :maxlength    => 30,

  input :puppet_file
        :prompt       => "puppet_file",
        :description  => "Whether to read the puppetfile and pull down puppet modules",
        :type         => :bool,
        :validation   => '^.+$',
        :optional     => true,

end
