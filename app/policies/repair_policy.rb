class RepairPolicy < ApplicationPolicy
  attr_reader :user, :repair

  def initialize(user, repair)
    @user = user
    @repair = repair
  end

  def update?
    # If the current user is the same as the owner of the item
    repair.user == user
  end
end