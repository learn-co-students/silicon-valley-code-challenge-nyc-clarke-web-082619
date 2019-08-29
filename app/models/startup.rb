class Startup
    attr_accessor :name
    attr_reader :founder, :domain
    @@all = []
    def initialize(name,founder,domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def sign_contract(vc,investment,type)
        FundingRound.new(self,vc,type,investment)
    end

    def num_funding_rounds
        FundingRound.all.select{|x| x.startup == self}.length
    end

    def total_funds
        sum = 0
        FundingRound.all.select{|x| x.startup == self}.each{|y| sum+=y.investment}
        sum
    end

    def investors
        arr = []
        FundingRound.all.select{|x| x.startup == self}.each{|y| arr << y.venture_capitalist}
        arr.uniq
    end

    def big_investors
        investors.select{|x| VentureCapitalist.tres_commas_club.include?(x)}
    end

    def self.all
        @@all
    end

    def self.find_by_founder(f)
        @@all.find{|x| x.founder == f}
    end

    def self.domains
        arr = []
        @@all.each{|x| arr << x.domain}
    end
end
