module CryptoVal
  class FiatExchange::Fixer
    DEFAULT_SOURCE = "USD"
    DEFAULT_TARGET = "PHP"
    
    attr_reader :source_currency, :target_currency

    def initialize opts={}
      @source_currency = opts[:source_currency] || DEFAULT_SOURCE
      @target_currency = opts[:target_currency] || DEFAULT_TARGET
    end
    
    def fetch
      format_response
    end
    
    private
    
    def base_url
      "https://api.fixer.io"
    end
    
    def url
      "#{base_url}/latest?base=#{@source_currency}&symbols=#{@target_currency}"
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
    
    def parsed_date
      Date.parse(parsed["date"]) rescue nil
    end
    
    def format_response
      {
        source: parsed["base"],
        target: @target_currency,
        date: parsed_date,
        rate: parsed["rates"][@target_currency].to_f
      }
    end
  
  end
  
end
