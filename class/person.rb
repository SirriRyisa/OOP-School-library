class Person
  def initialize(id, age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = age
    @age = name
    @parent_permission = parent_permission
  end
  attr_accessor :id, :age, :name, :parent_permission
end

def can_use_service?
  @age >= 18 || @parent_permission
end

def of_age?
  @age >= 18
end
