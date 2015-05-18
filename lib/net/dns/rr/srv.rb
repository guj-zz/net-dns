module Net # :nodoc:
  module DNS
    class RR
      
      #------------------------------------------------------------
      # RR type SRV (RFC2052)
      # A DNS RR for specifying the location of services (DNS SRV),
      # contains the location of the server(s) for a specific
      # protocol and domain (like a more general form of MX).
      #------------------------------------------------------------
      class SRV < RR
        
        attr_reader :priority, :weight, :port, :host
        
        # Gets the standardized value for this record,
        # represented by the value of <tt>port</tt>, <tt>priority</tt>,
        # <tt>weight</tt>, and <tt>host</tt>.
        #
        # Returns a String.
        def value
          "#{port} #{priority} #{weight} #{host}"
        end

        private
        
        def build_pack
          @srv_pack = [@port, @priority, @weight].pack("n n n")
          @srv_pack += pack_name(@host)
          @rdlength = @srv_pack.size
        end

        def subclass_new_from_binary(data,offset)
          off_end = offset + @rdlength
          @priority, @weight, @port = data.unpack("@#{offset} n n n")
          offset+=6

          @host=[]
          while offset < off_end
            len = data.unpack("@#{offset} C")[0]
            offset += 1
            str = data[offset..offset+len-1]
            offset += len
            @host << str
          end
          @host=@host.join(".")
          offset
        end
        
        def set_type
          @type = Net::DNS::RR::Types.new("SRV")
        end

        def get_inspect
          value
        end

        def get_data
          @srv_pack
        end
        
      end
    end
        
  end
end
