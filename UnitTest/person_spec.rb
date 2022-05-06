require_relative '../class/person'

describe Person do
  it 'Person class instance' do
    person = Person.new(0, 'Sirri', true)
    expect(person.id).to be_between(0, 50)
    expect(person).to be_instance_of(Person)
  end

  it 'Check if person attribute match' do
    person = Person.new(0, 'Sirri', true)
    expect(person).to have_attribute(name: 'Sirri')
  end

  it 'Check if correct name methos is correct' do
    person2 = person.new(1, 'Ryisa', true)
    expect(person2.correct_name).to eq 'Ryisa'
  end
end
