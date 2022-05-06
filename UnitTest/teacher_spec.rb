require_relative '../class/teacher'

describe Teacher do
  it 'Teacher class instance' do
    teacher = Teacher.new(1, 'Sirri', 'Code')
    expect(teacher).to be_instance_of(Teacher)
  end

  it 'Check if person attribute match' do
    teacher = Teacher.new(1, 'Code', 'Sirri')
    expect(teacher).to have_attributes(age: 1, specialization: 'Code', name: 'Sirri')
  end

  it 'Check if can run services method runs fine' do
    teacher = Teacher.new(1, name: 'Sirri', specialization: 'Engineering')
    expect(teacher.can_use_services?).to be(true)
  end
end