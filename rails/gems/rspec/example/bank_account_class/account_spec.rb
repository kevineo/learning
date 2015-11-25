require "rspec"

require_relative "account"

describe Account do
  let(:acct_number)     { "2342352523" }
  let(:hidden_acct_num) { "******2523" }
  let(:initial_balance) { 5000 }
  let(:account)         { Account.new(acct_number, initial_balance) }

  describe "#initialize" do
    context "valid input" do
      it "raise an error when no argument is provided" do
        expect { Account.new }.to raise_error
      end
      it "accepts account number without initial balance" do
        expect { Account.new("1234567890") }.not_to raise_error
      end
      it "accepts both account number and initial balance as argument" do
        expect { Account.new("1234567890", 5000) }.not_to raise_error
      end
      it "raise an error when invalid account number (more than 10) is provided" do
        expect { Account.new("12345678901") }.to raise_error(InvalidAccountNumberError)
      end
      it "raise an error when invalid account number (less than 10) is provided" do
        expect { Account.new("123456789") }.to raise_error(InvalidAccountNumberError)
      end
    end
  end

  describe "#transactions" do
    context "returns transactions array" do
      it "returns array with initial balance" do
        expect(account.transactions).to eq([5000])
      end
    end
  end

  describe "#balance" do
    context "returns balance" do
      it "returns the current balance value" do
        expect(account.balance).to eq(5000)
      end
    end
  end

  describe "#account_number" do
    it "should return sliced acc number" do
      expect(account.acct_number).to eq hidden_acct_num
    end

    it "should not return full acc number" do
      expect(account.acct_number ).not_to eq acct_number
    end
  end
end