# Changelog

## Release 0.8.7
 - MERGED: Pull Request #32 Use query instead of send in demo code
 - MERGED: Pull Request #36 Fix invalid usage logger.fatal
 - MERGED: Pull Request #37 Fix crashes for DNS::RR and fix DNS::Packet missing methods.
 - MERGED: Pull Request #38 Remove duplicate def of query

## Release 0.8.6
 - FIXED: Removed lookup of desitination mac address from send_raw* queries.

## Release 0.8.5
 - FIXED: Disable logger by default and change logger behaivior issue #20
 - FIXED: Logger and log4j [feature request] issue #16
 - FIXED: Resolver#logger= should not call close on old logger issue #3
 - FIXED: Could not disable mac source_address spoofing, added option
 - MERGED: Pull request #33, switches to enumerators

## Release 0.8.4
 - FIXED: Missing file for new spf record, pull/57

## Release 0.8.3
 - FIXED: Packet size cannot be set issue #1
 - FIXED: Now raise exception if raw sockets are requested and we are not
          running as root issue #23
 - FIXED: Rake can build gem, travis file updated to test up to
	    ruby-head issue #30
 - FIXED: Merged in pending bluemonk pull requests issue #29, remaining
          fixes are from these
 - FIXED: Cannot get TXT record issue #13
	  https://github.com/bluemonk/net-dns/pull/42
 - FIXED: Various fixes by neoraider
	  https://github.com/bluemonk/net-dns/pull/36
 - FIXED: query_tcp fix by nbaum
	  https://github.com/bluemonk/net-dns/pull/63
 - FIXED: Text fixes by chrislundquist
	  https://github.com/bluemonk/net-dns/pull/52
          https://github.com/bluemonk/net-dns/pull/51
 - CHANGED: Support SPF records by winebarrel
	    https://github.com/bluemonk/net-dns/pull/57
 - CHANGED: Simplified nameserver settings
	    https://github.com/bluemonk/net-dns/pull/60

## Release 0.8.2
 - FIXED: Exception when using new raw support issue #2
 - FIXED: Gemspec file has wrong emails
 - FIXED: Removed debug statement from raw support

## Release 0.8.1
 - First release from fork by Christopher Carpenter(mordocai@mordocai.net)
 - FIXED: Multiple bugs with Resolver::source_address= preventing it from
	  executing.
 - FIXED: Implemented send_raw_tcp and send_raw_udp
 - CHANGED: Added interface config parameter for Net::DNS::Resolver,
            currently only used by send_raw*
 - CHANGED: Added TODO file for known things that I need to do.

## Release 0.8.0

- FIXED: undefined local variable or method `source_address_inet6' (GH-40). [Thanks @simsicon]

- FIXED: Fixed bug on parsing multiple nameservers on different lines (GH-45). [Thanks @nicholasren]

- CHANGED: Dropped duplicate query ID filter. Query ID is now randomically generated but it's not guaranteed to be unique (GH-39). [Thanks @ebroder]

- CHANGED: require 'net/dns' is now the preferred way to load the library (GH-37). [Thanks @johnroa]

- CHANGED: Removed setup.rb installation script.


## Release 0.7.1

- FIXED: Invalid file permissions on several files (GH-35) [Thanks @jamespharaoh]


## Release 0.7.0

- ADDED: Added (experimental) Support for HINFO record.

- FIXED: Use Net::DNS::Resolver::Error class (not ResolverError, which does not exist).

- FIXED: Cleaned up require dependency and recursive require statements.

- FIXED: Use RbConfig instead of obsolete and deprecated Config (GH-28, GH-33) [Thanks @shadowbq, @eik3]

- FIXED: SRV record not required by Net::DNS::RR (GH-27) [Thanks @sebastian]

- FIXED: Resolver now supports IPv6 (GH-32) [Thanks @jamesotron]

- FIXED: Net::DNS::RR::PTR references an invalid parameter (GH-19) [Thanks @dd23]

- FIXED: Net::DNS::Question changes input arguments (GH-7) [Thanks @gfarfl]

- CHANGED: Refactoring unit test to follow most used Ruby conventions.

- CHANGED: Rewritten and simplified Net::DNS::Classes. Improved test harness.

- CHANGED: Removed Jeweler development dependency.

- CHANGED: The library is now compatible with Bundler.

- CHANGED: Minimum supported Ruby version changed to Ruby 1.8.7.

- CHANGED: Rescue NameError so unsupported record types only result in a warning.

- CHANGED: Renamed Net::DNS::Resolver#send to Net::DNS::Resolver#query to avoid overriding default meaning of send method.


## Release 0.6.1

- ADDED: Net::DNS::Packet#to_s method (alias of #inspect)

- FIXED: typo in lib/net/dns/rr/ptr.rb [Thanks Chris Lundquist]

- FIXED: warning: method redefined; discarding old inspect (GH-3) [Thanks Kevin Baker]

- FIXED: issue with rescue ArgumentError (GH-5) and with IPAddr handling (GH-6)


## Release 0.6.0

*WARNING:- If you are upgrading from a previous minor release, check out the Compatibility issue list below.

- FIXED: Added missing #to_s method to Net::DNS::Question.

- FIXED: Compatibility with Ruby 1.9

- FIXED: Types regexp order issue

- CHANGED: Refactoring unit test to follow most used Ruby conventions

- CHANGED: default timeout is now 5 seconds for both UDP and TCP

- CHANGED: Moved main dns.rb file to lib/net folder as default for GEMs. In this way it can be autoloaded when the gem is required.

### Compatibility issues

- CHANGED: RR#set_stype scope is now private to prevent invalid usage.

- CHANGED: DnsTimeout#timeout now raises LocalJumpError instead of DnsTimeoutArgumentError when block is missing.

- CHANGED: Renamed Net::DNS::RR::Types::Types to Net::DNS::RR::Types::TYPES to follow Ruby coding standards.


## Release 0.4

- many bug fixes (thanks guys!)
- a whole new class Net::DNS::Header::RCode
- new methods in Net::DNS::Resolver class to do AXFR queries
- a new SRV resource record written by Dan Janowski
- more documentation written and corrected
