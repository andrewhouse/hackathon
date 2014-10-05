class Ability
  include CanCan::Ability

  def initialize(employee)
    employee ||= Employee.new

    can :manage, :all if employee.roles == 'admin'

    can :read, :all if employee.roles == 'employee'

  end
end
