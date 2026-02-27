module SavingsAccount
  def self.interest_rate(balance)
    return -3.213 if balance < 0
    
    case balance
    when 0...1000
      0.5
    when 1000...5000
      1.621
    else
      2.475
    end
  end

  def self.annual_balance_update(balance)
    return 0 if balance == 0 

    balance * (1 + interest_rate(balance).abs / 100) 
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    balance = current_balance

    until balance >= desired_balance
      balance = annual_balance_update(balance)
      years += 1
    end

    years
  end
end
