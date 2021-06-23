class VotePolicy < ApplicationPolicy

  def create?
    true
  end

  def update?
    record.review.interview.application == user
  end

  def destroy?
    record.review.interview.application == user
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
