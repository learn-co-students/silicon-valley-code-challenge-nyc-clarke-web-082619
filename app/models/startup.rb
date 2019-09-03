class Startup

attr_accessor :name, :founder
attr_reader :domain

@@all = []

def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
end

def pivot(name, domain)
    @name = name
    @domain = domain
end

def sign_contract(vc, type, investment)
    fund = FundingRound.new(self, vc, type, investment)
end

def funding_rounds
    FundingRound.all.select { |round| round.startup == self }
end

def num_funding_rounds
    funding_rounds.length
end

def total_funds
    total = 0.0
    funding_rounds.map {|round| total += round.investment}
    total
end

def investors
    funding_rounds.map {|round| round.venture_capitalist}.uniq
end

def big_investors
    funding_rounds.map {|round| round.venture_capitalist if round.venture_capitalist.total_worth > 1000000000}
end

def self.find_by_founder(founder)
    all.find { |startup| startup.founder == founder }
end

def self.domains
    all.map { |startup| startup.domain }
end

def self.all
    @@all
end


end
