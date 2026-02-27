module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    case city
    when "Hamburg"
      :HAMB
    when "Rome"
      :ROME
    when "Kiel"
      :KIEL
    end
  end

  def self.get_terminal(ship_identifier)
    case ship_identifier
    when :OIL123, :GAS674
      :A
    when :CAR942, :CLO315
      :B
    end
  end
end
