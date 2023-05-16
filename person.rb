class Person
    attr_accessor :name, :age
    attr_reader :id
  
    def self.counter
      @counter ||= 0
    end
  
    def initialize(age, name = 'Unknown', parent_permission: true)
      @id = self.class.counter += 1
      @age = age
      @name = name
      @parent_permission = parent_permission
    end
  
    private
  
    def of_age?
      @age >= 18
    end
  
    public
  
    def can_use_services?
      of_age? || @parent_permission
    end
  end