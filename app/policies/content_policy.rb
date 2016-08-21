class ContentPolicy < ApplicationPolicy
  attr_reader :user, :track

  def initialize(user, content)
    @user = user
    @content = content
  end

  def update?
    @user.contents.find(content.id).nil?
  end

  def edit?
    update?
  end

  def show?
  	true
  end
  
end