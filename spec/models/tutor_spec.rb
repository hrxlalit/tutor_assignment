require 'rails_helper'

RSpec.describe Tutor, type: :model do
  describe "Validations" do
    
    it "is not valid with new only" do
      expect(Tutor.new).to_not be_valid
    end
    
    it "is not valid with name only" do
      expect(Tutor.new(name: "First Tutor")).to_not be_valid
    end

    it "is not valid with experience only" do
      expect(Tutor.new(total_experience: 5)).to_not be_valid
    end

    it "is valid with name and experience only" do
      course = Course.create(name: "Ruby on Rails", description: "Ruby on Rails is good for project development.")
      expect(Tutor.new(name: "Tutor 2", total_experience: 5, course_id: course.id)).to be_valid
    end



  end
  describe "Associations" do
    it "belongs to course" do
      assc = Tutor.reflect_on_association(:course)
      expect(assc.macro).to eq :belongs_to
    end
  end
end