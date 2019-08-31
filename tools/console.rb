require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

v1 = VentureCapitalist.new("Rory", 200000000000)
v2 = VentureCapitalist.new("Erin", 45000000000)
v3 = VentureCapitalist.new("Mikey", 300000000)
v4 = VentureCapitalist.new("Dave", 15000000)
v5 = VentureCapitalist.new("Denice", 67000000000)


s1 = Startup.new("Uber", "Dave Scar", "Taxis")
s2 = Startup.new("Facebook", "Tom Leiber", "Social Networking")
s3 = Startup.new("LinkedIn", "Tina Ruby", "Social Networking")


f1 = FundingRound.new(s1, v1, "Angel", 50000)
f2 = FundingRound.new(s1, v2, "Pre-Seed", 500)
f3 = FundingRound.new(s2, v3, "Seed", 25000)
f4 = FundingRound.new(s3, v4, "Series A", 46000)
f5 = FundingRound.new(s2, v1, "Angel", 3400)
f6 = FundingRound.new(s3, v2, "Pre-Seed", 1000000)
f7 = FundingRound.new(s3, v3, "Seed", 1500)
f8 = FundingRound.new(s1, v3, "Series A", 53000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line