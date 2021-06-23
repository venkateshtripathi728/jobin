class ReviewPolicy < ApplicationPolicy

  def create?
    true
  end

  def update?
    record.interview.application.user  == user
  end

  def destroy?
    record.interview.application.user  == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
