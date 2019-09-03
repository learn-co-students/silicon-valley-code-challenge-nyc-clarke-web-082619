class Startup

    # attr_accessor :name
    attr_reader :founder, :domain, :name

    @@all = []

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

    def sign_contract(venture_capitalist, type, investment)
        VentureCapitalist.new(self, venture_capitalist, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|fr| fr.startup == self}
    end

    def num_funding_rounds
        funding_rounds.length
    end

    def total_funds
        investements = funding_rounds.map {|fr| fr.investment}
        investements.sum
    end

    def investors
        funding_rounds.map {|fr| fr.venture_capitalist}.uniq
    end

    def big_investors
        # big_investors = [ ]
        # investors.each do |investor| 
        #     if  VentureCapitalist.tres_commas_club.include?(investor)
        #         big_investors << investor
        #     end
        # end
        # big_investors.uniq

        investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}.uniq
    end

    def self.find_by_founder(founder)
        all.find {|startup| startup.founder == founder}
    end

    def self.domains
        all.map {|startup| startup.domain}.uniq
    end

    def self.all
        @@all
    end

end
