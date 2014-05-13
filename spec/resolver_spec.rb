require 'net/dns'

describe Net::DNS::Resolver do
  before :each do
    @resolv = Net::DNS::Resolver.new
  end

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

  context "packet_size set" do
    before :all do
      @resolv = Net::DNS::Resolver.new({packet_size: 2048})
    end

    it "can query" do
      @resolv.query "google.com"
    end
  end
end
