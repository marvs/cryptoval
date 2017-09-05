module CryptoVal
  class List::CryptoCompare
    #https://api.cryptocoincharts.info/listCoins
    
    def fetch
      format_response
    end
    
    def self.fetch
      new.fetch
    end
    
    private
    
    def base_url
      "https://www.cryptocompare.com"
    end
    
    def url
      "#{base_url}/api/data/coinlist"
    end
    
    def response
      @response ||= get_response
    end
    
    def get_response
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri)
      http.request(request).body
    end
    
    def parsed
      @parsed ||= JSON.parse(response)
    end
    
    def format_response
      list = []
      parsed["Data"].keys.each do |key|
        data = parsed["Data"][key]
        if data.is_a?(Hash)
          logo = data["ImageUrl"].to_s.empty? ? "" : "#{base_url}#{data["ImageUrl"]}"
          list << { 
                    symbol: data["Name"], 
                    name: data["CoinName"],
                    logo: logo,
                    algorithm: data["Algorithm"] 
                  }
        end
      end
      list
    end

  end
end
