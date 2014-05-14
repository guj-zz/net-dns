require 'net/dns'

describe Net::DNS::Resolver do
  before :each do
    @resolv = Net::DNS::Resolver.new
  end

  describe "packet_size=" do
    it "can set packet_size as integer" do
      @resolv.packet_size = 2048
      @resolv.packet_size.should eq 2048
    end

    it "can set packet_size as string" do
      @resolv.packet_size = "2048"
      @resolv.packet_size.should eq 2048
    end

    it "can set packet_size as arbitrary class" do
      class Blah
        def to_i
          2048
        end
      end
      x = Blah.new
      @resolv.packet_size = x
      @resolv.packet_size.should eq 2048
    end
  end

  describe "nameservers=" do
    let(:dns_ipaddr) {IPAddr.new("8.8.8.8")}
    let(:dns_string) {"8.8.8.8"}

    it "can set nameserver as IPAddr" do
      @resolv.nameserver = dns_ipaddr
      @resolv.nameserver.should eq [dns_string]
    end

    it "can set nameserver as String ip" do
      @resolv.nameserver = "8.8.8.8"
      @resolv.nameserver.should eq [dns_string]
    end

    it "can set nameserver as String domain" do
      @resolv.nameserver = "google-public-dns-a.google.com"
      @resolv.nameserver.should eq [dns_string]
    end

    it "can set nameserver as Array" do
      @resolv.nameservers = [
        "google-public-dns-a.google.com",
        dns_ipaddr,
        "8.8.8.8"
      ]

      @resolv.nameserver.should eq [
        dns_string,
        dns_string,
        dns_string
      ]
    end

    it "can set nameserver as Arbitrary to_a object" do
      class Blah
        def to_a
          [
            "google-public-dns-a.google.com",
            "8.8.8.8"
          ]
        end
      end
      @resolv.nameservers = Blah.new
      @resolv.nameserver.should eq [
        dns_string,
        dns_string
      ]
    end

    it "can set nameserver as Arbitrary map object" do
      class Blah
        def initialize
          @array = [
            "google-public-dns-a.google.com",
            "8.8.8.8"
          ]
        end

        def map &block
          ret = []
          @array.each do |item|
            ret << block.call(item)
          end
          ret
        end
      end

      @resolv.nameservers = Blah.new
      @resolv.nameserver.should eq [
        dns_string,
        dns_string
      ]
    end
  end

  it "returns TXT records properly" do
    result = Net::DNS::Resolver.new.query "google.com", Net::DNS::TXT
    result.answer.first.should be_a Net::DNS::RR::TXT
  end

  context "packet_size set" do
    before :all do
      @resolv = Net::DNS::Resolver.new({packet_size: 2048})
    end

    it "can query" do
      @resolv.query "google.com"
    end
  end

  context "nameservers set" do
    before :all do
      @resolv = Net::DNS::Resolver.new({nameservers: ["8.8.8.8", "8.8.4.4"]})
    end

    it "can query" do
      @resolv.query "google.com"
    end

    #TODO: Add tests that ensure that the correct nameservers are used for lookup
  end
end
