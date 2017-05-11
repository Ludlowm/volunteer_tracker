describe('#add_project') do
  it('adds a project to a specific volunteer') do
    test_project = Project.new({:name => "Ruby learning", :description => "Learn ruby programming"})
    test_project.save
    volunteer1 = Volunteer.new({:name => "Billy Joel"})
    volunteer1.save
    volunteer2 = Volunteer.new({:name => "Jackie Chan"})
    volunteer2.save
    test_project.add_volunteer({:volunteer_ids => [volunteer1.id, volunteer2.id]})
    expect(test_project.see_project_volunteers).to(eq([volunteer1, volunteer2]))
  end
end

describe('#see_project_volunteers') do
  it('will return all the volunteers for a specific project') do
    test_project = Project.new({:name => "Ruby learning", :description => "Learn ruby programming"})
    test_project.save
    volunteer1 = Volunteer.new({:name => "Billy Joel"})
    volunteer1.save
    volunteer2 = Volunteer.new({:name => "Jackie Chan"})
    volunteer2.save
    test_project.add_volunteer({:volunteer_ids => [volunteer1.id, volunteer2.id]})
    expect(test_project.see_project_volunteers).to(eq([volunteer1, volunteer2]))
  end
end


def add_volunteer (attributes)
  attributes.fetch(:volunteer_ids, []).each do |volunteer_id|
    DB.exec("UPDATE projects SET volunteer_id = #{volunteer_id} WHERE id = #{self.id};")
  end
end

def see_volunteers
  project_volunteers = []
  results = DB.exec("SELECT volunteer_id FROM projects WHERE id = #{self.id};")
  results.each do |result|
    volunteer_id = result.fetch('volunteer_id').to_i
    volunteer = DB.exec("SELECT * FROM volunteers WHERE id = #{volunteer_id};")
    name = volunteer.first.fetch('name')
    project_volunteers.push(Volunteer.new({:name => name, :id => volunteer_id}))
    binding.pry
  end
  project_volunteers
end


<% if @volunteer.project_id.any? %>
<h4>Current Project: @volunteer.</h4>


get('/project/:id/add_volunteer') do
  @all_volunteers = Volunteer.all
  @project = Project.find(params.fetch('id').to_i)
  erb(:add_volunteer_to_project)
end

get('/project/:id/volunteer/:id') do
  @project = Project.find(params.fetch('id').to_i)
  @volunteer = Volunteer.find(params.fetch('id').to_i)
  binding.pry
  erb(:test)
end

<h3>Add A New Volunteer To Your Project:</h3>
<form action="/project/:id/add_volunteer" method="post">
  <label for="name">Enter Your Name</label>
  <input type="text" name="name">
  <button type="submit">Submit</button>
</form>

post('/volunteers/new') do
  name = params.fetch('name')
  Volunteer.new({:name => name}).save
  @all_volunteers = Volunteer.all
  erb(:volunteers)
end

<h3>Add A New Volunteer:</h3>
<form action="/volunteers/new" method="post">
  <label for="name">Enter Your Name</label>
  <input type="text" name="name">
  <button type="submit">Submit</button>
</form>
