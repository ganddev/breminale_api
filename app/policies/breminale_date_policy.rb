class BreminaleDatePolicy
  attr_reader :user, :breminale_date

  def initialize(user, breminale_date)
    @user = user
    @breminale_date = breminale_date
  end

  def index?
    true
  end

  def show?
    @user == @breminale_date.user
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    @user == @breminale_date.user
  end

  def edit?
    update?
  end

  def destroy?
    @user == @breminale_date.user
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end