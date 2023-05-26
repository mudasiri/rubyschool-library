require 'spec_helper'

describe Person do
  describe '#initialize' do
    before :each do
      @person = Person.new(29, 'Mudasir')
    end

    it 'returns a Person object' do
      expect(@person).to be_an_instance_of Person
    end

    it 'returns true for can_use_services?' do
      expect(@person.can_use_services?).to eq(true)
    end
    describe '#add_rental' do
    it "should create a new Rental object and add it to the person's rentals" do
      book = Book.new('Title', 'Author')
    date = '2023-5-25'
    rental = Rental.new(date, book, @person)
    @person.rent_book(rental)
    expect(@person.rentals).to include(rental)
    end
  end

    it 'creates a new Person object with default values' do
      expect(@person.parent_permission).to eq(true)
      expect(@person.person_type).to eq('student')
      expect(@person.rentals).to eq([])
    end

    it { expect(@person).to have_attributes(age: 29) }
    it { expect(@person).to have_attributes(name: 'Mudasir') }
  end
end
