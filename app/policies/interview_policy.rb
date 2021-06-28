class InterviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    record.apply.user == user
  end

  def destroy?
    record.apply.user == user
  end
end
