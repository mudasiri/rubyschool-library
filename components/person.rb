require_relative 'nameable'
require './decorators/capitalize_decorator'
require './decorators/trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals, :parent_permission, :person_type, :specialization

  def initialize(age, name = 'Unknown', parent_permission: true, person_type: 'student')
    super()
    case person_type
    when 'student'
      @id = Random.rand(1..500)
    when 'teacher'
      @id = Random.rand(501..1000)
    end
    @age = age
    @name = name
    @parent_permission = parent_permission
    @person_type = person_type
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def rent_book(rental)
    @rentals << rental
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
