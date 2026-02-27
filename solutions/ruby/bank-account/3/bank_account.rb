class BankAccount

  def initialize
    @open = false
    @mutex = Mutex.new
  end

  def open
    @mutex.synchronize do
      raise ArgumentError, "You can't open an already open account" if @open

      @balance = 0
      @open = true
    end
  end

  def close
    @mutex.synchronize do
      raise ArgumentError, "You can't close an already closed account" unless @open

      @open = false
    end
  end

  def deposit(amount)
    @mutex.synchronize do
      ensure_open!
      raise ArgumentError, "You can't deposit a negative amount" if amount < 0

      @balance += amount
    end
  end

  def withdraw(amount)
    @mutex.synchronize do
      ensure_open!
      raise ArgumentError, "You can't withdraw more than you have" if amount > @balance
      raise ArgumentError, "You can't withdraw a negative amount" if amount < 0

      @balance -= amount
    end
  end

  def balance
    @mutex.synchronize do
      ensure_open!

      @balance
    end
  end

  private

  def ensure_open!
    raise ArgumentError, "Account is closed" unless @open
  end
end
