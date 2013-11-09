name             'rails'
maintainer       'Alexander Merkulov'
maintainer_email 'sasha@merqlove.ru'
license          'Apache 2.0'
description      'Installs/Configures rails'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.0.3'

depends "iptables"
depends "nginx"
depends "rbenv"
#depends "deploy_key"
depends "postgresql"

# attribute "hub/install_path",
#   display_name: "Install path",
#   description: "Base path where bin/hub will be installed",
#   type: "string",
#   required: "optional"

# attribute "git/src_path",
#   display_name: "Source path",
#   description: "Path where hub git repo will be cloned",
#   type: "string",
#   required: "optional"