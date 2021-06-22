class ContactsPolicy < ApplicationPolicy
  def create?
    return true
  end

  def update?
    record.applications = @applications
    result = @applications.filter { |application| application == @application }
    result.user == user
  end

  def destroy?
    record.applications = @applications
    result = @applications.filter { |application| application == @application }
    result.user == user
  end
end
