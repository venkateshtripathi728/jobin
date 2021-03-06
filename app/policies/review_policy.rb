class ReviewPolicy < ApplicationPolicy

  def create?
    true
  end

  def update?
    record.interview.apply.user  == user
  end

  def destroy?
    record.interview.apply.user  == user
  end

  def upvote?
   true
  end

  def downvote?
   true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
