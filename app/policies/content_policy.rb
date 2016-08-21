class ContentPolicy < ApplicationPolicy
  attr_reader :user, :track

  def initialize(user, content)
    @user = user
    @content = content
  end

  def destroy?
    @user.contents.any? { |c| c.id == @content.id }
  end

  def show?
  	true
  end
  
end