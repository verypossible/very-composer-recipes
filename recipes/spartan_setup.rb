## Ruby on Rails
HOST_OS = RbConfig::CONFIG['host_os']
say_wizard "Your operating system is #{HOST_OS}."
say_wizard "You are using Ruby version #{RUBY_VERSION}."
say_wizard "You are using Rails version #{Rails::VERSION::STRING}."

__END__

name: spartan_setup
description: "Spartan makes choices for your application."

run_after: [git]
category: configuration
