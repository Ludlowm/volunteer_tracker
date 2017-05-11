require('spec_helper')

describe(Project) do

  describe('#name') do
    it('will return the name of the project') do
      test_project = Project.new({:name => "Ruby Learning"})
      expect(test_project.name).to(eq("Ruby Learning"))
    end
  end

  describe('#description') do
    it('will return the description of the project') do
      test_project = Project.new({:description => "Building homes for the homeless"})
      expect(test_project.description).to(eq("Building homes for the homeless"))
    end
  end

  describe('#id') do
    it('will return the id of the project') do
      test_project = Project.new({:id => 1})
      expect(test_project.id).to(eq(1))
    end
  end

  describe('#save') do
    it('saves the project to the database') do
      test_project = Project.new({:name => "Ruby Learning", :description => "Learn ruby programming"})
      test_project.save
      expect(Project.all).to(eq([test_project]))
    end
  end

  describe('.all') do
    it('returns all the saved projects but starts out empty') do
      expect(Project.all).to(eq([]))
    end
  end

  describe('#==') do
    it('returns true if the project name and description are the same') do
      test_project1 = Project.new({:name => "Ruby Learning", :description => "Learn ruby programming"})
      test_project1.save
      test_project2 = Project.new({:name => "Ruby Learning", :description => "Learn ruby programming"})
      test_project2.save
      expect(test_project1 == test_project2).to(eq(true))
    end
  end

  describe('.find') do
    it('returns a specific project based on its id') do
      test_project1 = Project.new({:name => "Ruby Learning", :description => "Learn ruby programming"})
      test_project1.save
      test_project2 = Project.new({:name => "Java Learning", :description => "Learn java programming"})
      test_project2.save
      expect(Project.find(test_project1.id)).to(eq(test_project1))
    end
  end

  describe('#update') do
    it('updates a specific project in the database') do
      test_project = Project.new({:name => "Ruby Learning", :description => "Learn ruby programming"})
      test_project.save
      test_project.update({:name => "Java Learning", :description => "Learn java programming"})
      expect(test_project.description).to(eq("Learn java programming"))
    end
  end

  describe('#delete') do
    it('deletes a project from the database') do
      test_project = Project.new({:name => "Ruby Learning", :description => "Learn ruby programming"})
      test_project.save
      test_project2 = Project.new({:name => "Java Learning", :description => "Learn java programming"})
      test_project2.save
      test_project.delete
      expect(Project.all).to(eq([test_project2]))
    end
  end

  describe('#see_volunteers') do
    it('will return all the volunteers for a specific project') do
      test_project = Project.new({:name => "Ruby Learning", :description => "Learn ruby programming"})
      test_project.save
      volunteer1 = Volunteer.new({:name => "Billy Joel"})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => "Jackie Chan"})
      volunteer2.save
      volunteer1.add_project(test_project)
      volunteer2.add_project(test_project)
      expect(test_project.see_volunteers).to(eq([volunteer1, volunteer2]))
    end
  end



end
