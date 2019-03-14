require 'pry'
class Transfer

  attr_accessor :sender, :receiver, :amount, :status, :last_transfer
  # your code here
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if self.valid? == true && sender.balance > @amount
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
      @last_transfer = @amount
      @amount = 0
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @last_transfer != nil
      sender.balance += @last_transfer
      receiver.balance -= @last_transfer
      @status = "reversed"
    end
  end
end
