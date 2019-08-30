class FundingRound
    @@all = []

    attr_reader :venture_capitalist, :startup, :type
    attr_accessor :investment

    def initialize(vc, startup, type, investment = 0.0)
        @venture_capitalist = vc
        @startup = startup
        @type = type
        @investment = investment

        @@all << self
    end


    def self.all
        @@all
    end 
end
