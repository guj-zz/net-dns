# -*- encoding: utf-8 -*-

require 'date'

Gem::Specification.new do |s|
  s.name = "net-dns2"
  s.version = "0.8.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marco Ceresa", "Simone Carletti", "Christopher Carpenter"]
  s.date = Date.today.to_s
  s.description = "Net::DNS is a pure Ruby DNS library, with a clean OO interface and an extensible API. The net-dns2 ruby gem is an actively maintained fork of the original net-dns."
  s.email = "mordocai@mordocai.net"
  s.files = [
    ".gitignore", ".travis.yml", "CHANGELOG.md", "Gemfile", "README.md",
    "Rakefile", "THANKS.rdoc", "demo/check_soa.rb", "demo/threads.rb",
    "lib/net/dns.rb", "lib/net/dns/core_ext.rb", "lib/net/dns/header.rb",
    "lib/net/dns/names.rb", "lib/net/dns/packet.rb", "lib/net/dns/question.rb",
    "lib/net/dns/resolver.rb", "lib/net/dns/resolver/socks.rb",
    "lib/net/dns/resolver/timeouts.rb", "lib/net/dns/rr.rb",
    "lib/net/dns/rr/a.rb", "lib/net/dns/rr/aaaa.rb", "lib/net/dns/rr/classes.rb",
    "lib/net/dns/rr/cname.rb", "lib/net/dns/rr/hinfo.rb", "lib/net/dns/rr/mr.rb",
    "lib/net/dns/rr/mx.rb", "lib/net/dns/rr/ns.rb", "lib/net/dns/rr/null.rb",
    "lib/net/dns/rr/ptr.rb", "lib/net/dns/rr/soa.rb", "lib/net/dns/rr/spf.rb",
    "lib/net/dns/rr/srv.rb", "lib/net/dns/rr/txt.rb", "lib/net/dns/rr/types.rb",
    "lib/net/dns/version.rb", "net-dns.gemspec"
  ]
  s.homepage = "http://github.com/mordocai/net-dns"
  s.require_paths = ["lib"]
  s.summary = "Pure Ruby DNS library, fork with fixes."
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")
  s.license = 'Ruby'

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end

  s.add_runtime_dependency "packetfu"
end
