class Startup
    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def self.domains
        @@all.map {|startup| startup.domain}
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
        self
    end

    def self.find_by_founder(founder)
        Startup.all.find {|s|s.founder == founder}
    end


    def funding_rounds
        FundingRound.all.select {|fr| fr.startup == self}
    end

    def venture_capitalists
        funding_rounds.map {|fr| fr.venture_capitalist}
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def total_funds
        funding_rounds.reduce(0) {|start, fr| start+ fr.investment}
    end

    def investors
        funding_rounds.map {|fr|fr.venture_capitalist}.uniq {|x|x}
    end

    def big_investors
        investors.select {|i|i.total_worth > 10000000000}
    end

    def num_funding_rounds
        funding_rounds.count
    end
end
