class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    # def resolve
    #   scope.all
    # end
    def resolve
      scope.where(user: user)
    end
  end
end
