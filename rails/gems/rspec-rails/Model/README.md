# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  username            :string           not null
#  email               :string           not null
#  avatar              :string
#  created_at          :datetime
#  updated_at          :datetime

class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true,
    format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }

  has_many :listings, dependent: destroy

  def eat(food)
    @eating = "#{self.username} is eating #{food}."
  end
end

---------------------------------

require 'rails_helper'

RSpec.describe User, type: :model do

  # testing active record associations using shoulda-matchers
  context "active record associations " do
    it { is_expected.to have_many(:listings).dependent(:destroy) }
  end

  # testing validations using shoulda-matchers
  context "validations" do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:email) }

    # testing emails with correct and incorrect values
    it { is_expected.to allow_value("good@email.com").for(:email) }
    it { is_expected.not_to allow_value("bad@email").for(:email) }
  end

  # create user for testing
  let(:user) { User.create(user_name: 'johndoe', email: 'john@doe.com') }

  # each method within the model should have it's own context
  context '#eat' do

    # testing happy path of the method
    context 'with valid params' do
      it 'should return string with username and input' do
        hungry_user = user.eat('sushi')
        expect(hungry_user).not_to be nil
        # to test for @eating, we use assigns(:eating) in rspec
        expect(assigns(:eating)).to include user.user_name
        expect(assigns(:eating)).to include 'sushi'
      end
    end

    # testing unhappy path of the method
    context 'without params' do
      it 'will raise ArgumentError' do
        # #eat method must take in one params,
        # so by calling user.eat, it will raise wrong number of arguments error.
        expect{user.eat}.to raise_error ArgumentError
      end
    end
  end
end

