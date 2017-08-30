module CryptoVal::CryptoExchange
  class Cryptonator
    DEFAULT_SYMBOL = "BTC"
    DEFAULT_CURRENCY = "USD"
    
    attr_reader :symbol, :currency

    def initialize opts={}
      @symbol   = opts[:symbol] || DEFAULT_SYMBOL
      @currency = opts[:currency] || DEFAULT_CURRENCY
    end
    
    def fetch
      format_response
    end
    
    def self.fetch opts={}
      new(opts).fetch
    end
    
    private
    
    def base_url
      "https://api.cryptonator.com"
    end
    
    def url
      "#{base_url}/api/ticker/#{@symbol}-#{@currency}"
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
      {
        symbol: parsed["ticker"]["base"],
        currency: parsed["ticker"]["target"],
        price: parsed["ticker"]["price"].to_f
      }
    end

  end
end
