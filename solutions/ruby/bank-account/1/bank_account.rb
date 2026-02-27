class BankAccount

  def initialize
    @balance = nil
    @open = false
  end

  def open
    raise ArgumentError.new "You can't open an already open account" if @open

    @balance = 0
    @open = true
  end

  def close
    raise ArgumentError.new "You can't close an already closed account" unless @open

    @open = false
  end

  def deposit(amount)
    raise ArgumentError.new "You can't deposit money into a closed account" unless @open
    raise ArgumentError.new "You can't deposit a negative amount" if amount < 0

    @balance += amount
  end

  def withdraw(amount)
    raise ArgumentError.new "You can't withdraw money into a closed account" unless @open
    raise ArgumentError.new "You can't withdraw more than you have" if amount > @balance
    raise ArgumentError.new "You can't withdraw a negative amount" if amount < 0

    @balance -= amount
  end

  def balance
    raise ArgumentError.new "You can't check the balance of a closed account" unless @open

    @balance
  end
end
