require 'pry'
class Transfer
    attr_accessor :sender, :receiver, :amount, :status

    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount 
      @status = "pending"
    end

    def valid?
      @sender.valid? && @receiver.valid? ? true : false
    end 
    #why does this not call on BankAccount?
    #how does it access .valid?       

    def execute_transaction
      if @sender.balance > @amount && @status == "pending" && valid? 
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      else 
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if @status == "complete"
        @receiver.balance -= @amount
        @sender.balance += @amount
        @status = "reversed"
      end
    end

end
