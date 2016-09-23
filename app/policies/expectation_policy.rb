class ExpectationPolicy < ApplicationPolicy
 
  attr_reader :user, :expectation

  # define access policies

  def initialize(user, expectation)
    @user = user
    @expectation = expectation
  end

  def update?
    true
  end

  def edit?
    true
  end

  def show?
  	true
  end

end