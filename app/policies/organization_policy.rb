class OrganizationPolicy < ApplicationPolicy
  def create?
    return true
  end
  
  def update?
    return true
  end
   
  def edit?
    return true
  end

  def createorfind?
    return true
  end
  
  def destroy?
    record.user == user
  end

end
