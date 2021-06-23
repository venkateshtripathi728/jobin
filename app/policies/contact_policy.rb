class ContactPolicy < ApplicationPolicy
  def create?
    return true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
