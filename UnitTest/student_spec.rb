require_relative '../class/student'

describe Student do
  before :each do
    # moc the classroom using the double method
    @moc = double('classroom')
    @student = []
    allow(@moc).to receive(:students).and_return(@student)
  end

  it 'Check if it can store the student data' do
    student = Student.new(1, name: 'Ngwa', classroom: @moc)
    student.classroom = @moc
    expect(@student.length).to be(1)
    expect(@student).to contain_exactly(student)
  end

  it 'Check if attributes values matches' do
    student = Student.new(1, 'Ryisa', 'Sirri', true)
    expect(student).to have_attributes(name: 'Sirri', age: 1, classroom: 'Ryisa', parent_permission: true)
  end

  it 'Test student class ' do
    student = Student.new(1, 'Ryisa', 'Sirri', true)
    ryisa = Classroom.new('Software Engineering')
    student.classroom = Ryisa
    expect(student.classroom.label).to eq 'Software Engineering'
    expect(ryisa.students.count).to eq 1
  end
end
