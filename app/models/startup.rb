class Startup
    @@all = []

    attr_reader :founder, :domain
    attr_accessor :name

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        @@all.find {|startup| startup.founder == founder}
        
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.domains
        # iterate through
        # domains = []
        # Startup.all.each {|d| domains << d.domain }
        # domains

        Startup.all.map { |startup| startup.domain }
    end

    def sign_contract(vco, type, amount)
        FundingRound.new(self, vco, type, amount)
    end

    def helper
        FundingRound.all.select { |fundinground| fundinground.startup == self}
    end

    def num_funding_rounds
        FundingRound.all.select { |fundinground| fundinground.startup == self}.length
    end

    def total_funds
        helper.map { |funding_round| funding_round.investment}.sum
    end
end
