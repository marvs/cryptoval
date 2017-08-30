module CryptoVal
  class Latest
    # Gets the latest value of a cryptocurrency
    DEFAULT_CRYPTO = "BTC"
    DEFAULT_CURRENCY = "USD"
    
    def initialize opts={}
      @symbol       = opts[:symbol] || DEFAULT_CRYPTO
      @currency     = opts[:currency] || DEFAULT_CURRENCY
      @crypto_klass = opts[:crypto_klass] || CryptoVal::CryptoExchange::Cryptonator
      @fiat_klass   = opts[:fiat_klass] || CryptoVal::FiatExchange
    end
    
    def fetch
      { 
        symbol: @symbol,
        currency: @currency,
        value: currency_value
      } 
    end
    
    def self.fetch opts={}
      new(opts).fetch
    end
  
    private
    
    def crypto
      @crypto ||= @crypto_klass.fetch({ symbol: @symbol })
    end
    
    def fiat
      @fiat ||= @fiat_klass.fetch({ target_currency: @currency })
    end
    
    def crypto_value
      @crypto_value ||= crypto[:price]
    end
    
    def exchange_rate
      exchange_rate ||= fiat[:rate]
    end
    
    def currency_value
      @currency != DEFAULT_CURRENCY ? (crypto_value * exchange_rate).to_f.round(2) : crypto_value.to_f.round(2)
    end
  
  end
end
