gem_group :production do
  gem "lograge"
  gem "newrelic_rpm"
  gem "rack-timeout"
  gem "rails_12factor"
end

__END__

name: production_gems
description: "Add Spartan's recommended production gems"

category: other
requires: [rack_canonical_host]
