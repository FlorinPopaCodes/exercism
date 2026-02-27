class BankAccount

  def initialize
    @balance = nil
    @open = false
    @semaphore = Mutex.new
  end

  def open
    @semaphore.syncronize do
      raise ArgumentError.new "You can't open an already open account" if @open

      @balance = 0
      @open = true
    end
  end

  def close
    @semaphore.syncronize do
      raise ArgumentError.new "You can't close an already closed account" unless @open

      @open = false
    end
  end

  def deposit(amount)
    @semaphore.syncronize do
      raise ArgumentError.new "You can't deposit money into a closed account" unless @open
      raise ArgumentError.new "You can't deposit a negative amount" if amount < 0

      @balance += amount
    end
  end

  def withdraw(amount)
    @semaphore.syncronize do
      raise ArgumentError.new "You can't withdraw money into a closed account" unless @open
      raise ArgumentError.new "You can't withdraw more than you have" if amount > @balance
      raise ArgumentError.new "You can't withdraw a negative amount" if amount < 0

      @balance -= amount
    end
  end

  def balance
    @semaphore.syncronize do
      raise ArgumentError.new "You can't check the balance of a closed account" unless @open

      @balance
    end
  end
end
