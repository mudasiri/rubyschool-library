require '../decorators/nameable'
require '../decorators/capitalize_decorator'
require '../decorators/trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def self.counter
    @counter ||= 0
    @counter += 1
  end

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = self.class.counter
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
  person.correct_name
  capitalizedPerson = CapitalizeDecorator.new(person)
  capitalizedPerson.correct_name
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  capitalizedTrimmedPerson.correct_name