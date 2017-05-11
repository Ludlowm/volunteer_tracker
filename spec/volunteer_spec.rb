describe(Volunteer) do
  describe('#name') do
    it('will return the name of the volunteer') do
      test_volunteer = Volunteer.new({:name => "Billy Joel"})
      expect(test_volunteer.name).to(eq("Billy Joel"))
    end
  end

  describe('#id') do
    it('will return the id of the volunteer') do
      test_volunteer = Volunteer.new({:id => 1})
      expect(test_volunteer.id).to(eq(1))
    end
  end

  describe('.all') do
    it('will return all of the volunteers but starts out empty') do
      expect(Volunteer.all).to(eq([]))
    end
  end

  describe('#save') do
    it('will save the volunteer to the database') do
      test_volunteer = Volunteer.new({:name => "Billy Joel"})
      test_volunteer.save
      expect(Volunteer.all).to(eq([test_volunteer]))
    end
  end

  describe('#==') do
    it('will return true if the volunteer name and class is the same') do
      volunteer1 = Volunteer.new({:name => "Billy Joel"})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => "Billy Joel"})
      volunteer2.save
      expect(volunteer1 == volunteer2).to(eq(true))
    end
  end

  describe('.find') do
    it('find a specific volunteers based on its id') do
      volunteer1 = Volunteer.new({:name => "Billy Joel"})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => "Jackie Chan"})
      volunteer2.save
      expect(Volunteer.find(volunteer1.id)).to(eq(volunteer1))
    end
  end

  describe('#update') do
    it('find a specific volunteers based on its id') do
      volunteer1 = Volunteer.new({:name => "Billy Joel"})
      volunteer1.save
      volunteer1.update({:name => "Jackie Chan"})
      expect(volunteer1.name).to(eq("Jackie Chan"))
    end
  end

  describe('#delete') do
    it('deletes a specific volunteer from the database') do
      volunteer1 = Volunteer.new({:name => "Billy Joel"})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => "Jackie Chan"})
      volunteer2.save
      volunteer1.delete
      expect(Volunteer.all).to(eq([volunteer2]))
    end
  end

  describe('#add_project') do
    it('adds a project to a specific volunteer') do
      test_project = Project.new({:name => "Ruby Learning", :description => "Learn ruby programming"})
      test_project.save
      volunteer1 = Volunteer.new({:name => "Billy Joel"})
      volunteer1.save
      volunteer1.add_project(test_project)
      expect(volunteer1.project_id).to(eq(test_project.id))
    end
  end

end
