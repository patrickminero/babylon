class UserPolicy < ApplicationPolicy
  def show?
    !user.nil?
  end

  def edit?
    user == current_user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
