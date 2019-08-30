class Startup
    @@all = []

    attr_reader  :name, :founder, :domain

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def sign_contract(vc, type, investment)
        FundingRound.new(vc, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select{|round| round.startup == self}
    end
    def num_funding_rounds
        funding_rounds.length
    end

    def total_funds
        funding_rounds.reduce(0) {|sum, round| sum + round.investment}
    end

    def investors
        my_investors = []
        funding_rounds.each do |round|
            if !my_investors.include?(round.venture_capitalist)
                my_investors << round.venture_capitalist 
            end
        end
        my_investors
    end

    # def big_investors
    #     VentureCapitalist.tres_commas_club.select {|vc| vc}
    # end

    def self.find_by_founder(founder)
        all.find{|startup| startup.founder == founder}
    end

    def self.domains
        all.map {|startup| startup.domain}
    end

    def self.all
        @@all
    end
end
