module CryptoVal
  class FiatExchange
    DEFAULT_CURRENCY = "USD"
    
    def initialize opts={}
      @source_currency  = opts[:source_currency] || DEFAULT_CURRENCY
      @target_currrency = opts[:target_currency]
      @exchange_klass   = opts[:exchange_class] || CryptoVal::FiatExchange::Fixer
    end
    
    def fetch
      { 
        source_currency: exchange[:source],
        target_currency: exchange[:target],
        date: exchange[:date],
        rate: exchange[:rate]
      } 
    end
    
    def self.fetch opts={}
      new(opts).fetch
    end
  
    private
    
    def exchange
      @exchange ||= @exchange_klass.new({ source_currency: @source_currency, target_currency: @target_currency }).fetch
    end
  
  end
end
