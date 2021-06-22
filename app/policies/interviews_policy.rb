class InterviewsPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    record.application.user == user
  end

  def destroy?
    record.application.user == user
  end
end
