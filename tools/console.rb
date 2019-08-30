require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
startup1 = Startup.new('AppyBoi', 'Jeb', 'Fintech')
startup2 = Startup.new('Jetfool', 'Lou', 'Transport')
startup3 = Startup.new('FaceTheft', 'Lisa', 'Social Media')
venture1 = VentureCapitalist.new('Bill Gates', 50_000_000_000)
venture2 = VentureCapitalist.new('Warren Buffet', 90_000_000_000)
venture3 = VentureCapitalist.new('Poor Person', 500_000_000)
#fund1 = FundingRound.new('AppyBoi', 'Bill Gates', 'Angel', 10_000_000)
#fund2 = FundingRound.new('Jetfool', 'Poor Person', 'Seed', 20_000_000)
#fund3 = FundingRound.new('FaceTheft', 'Warren Buffet', 'Series C', 30_000_000)

startup1.sign_contract(venture1, 'Angel', 100_000_000)
startup1.sign_contract(venture2, 'Seed', 200_000_000)
startup1.sign_contract(venture3, 'C-Series', 100_000_000)
startup1.sign_contract(venture1, 'Seed', 200_000_000)
startup1.sign_contract(venture1, 'C-Series', 300_000_000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line