module CryptoVal
  class List::CryptoCoinCharts
    
    def fetch
      format_response
    end
    
    def self.fetch
      new.fetch
    end
    
    private
    
    def base_url
      "https://api.cryptocoincharts.info"
    end
    
    def url
      "#{base_url}/listCoins"
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
      parsed.each do |data|
        if data.is_a?(Hash)
          list << { 
                    symbol: data["id"].upcase, 
                    name: data["name"] 
                  }
        end
      end
      list
    end

  end
end
