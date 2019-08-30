class Startup
  attr_reader :founder, :domain
  attr_accessor :name
  @@all = []

  def initialize(name, founder, domain)
    @name = name 
    @founder = founder 
    @domain = domain 
    @@all << self
  end

  def pivot(new_name, new_domain)
    @name = new_name
    @domain = new_domain
  end

  def sign_contract(venture_boi, investment, amt)
    FundingRound.new(self, venture_boi, investment, amt)
  end

  def funding 
     FundingRound.all.select{|rounds| rounds.startup == self}
  end

  def num_funding_rounds
    funding.length
  end

  def total_funds
   funding.map{|rounds| rounds.investment}.reduce(&:+)
  end

  def investors
    funding.map{|rounds| rounds.venture_capitalist}.uniq
  end

  def big_investors
    investors.select{|investor| VentureCapitalist.tres_commas_club.include?(investor)}.uniq
  end

  def self.find_by_founder(founder_name)
    self.all.find{|x| x.founder == founder_name}
  end

  def self.domains
    self.all.map{|x| x.domain}
  end

  def self.all 
    @@all 
  end


end
