require 'rails_helper'

describe CoursesController do
  it "create the course" do
    post :create, params: {course: {name: "Ruby on Rails", description: "Ruby on Rails description",  tutors_attributes: [{name: "First Tutor", total_experience: 5}]}}
    json_response = response
    parsed_body = JSON.parse(json_response.body).with_indifferent_access
    expect(json_response.status).to equal(200)
    expect(parsed_body[:response_code]).to equal(201)
    expect(parsed_body[:course][:id]).to_not eql nil
    expect(parsed_body[:course][:name]).to eql("Ruby on Rails")
  end
  it "should not create the course if name is not present" do
    post :create, params: {course: {tutors_attributes: [{name: "Tutor 2"}]}}
    json_response = response
    parsed_body = JSON.parse(json_response.body).with_indifferent_access
    expect(json_response.status).to equal(200)
    expect(parsed_body[:response_code]).to equal(422)
    expect(parsed_body[:error][:name]).to eql(["can't be blank"])
  end

  it "should not create the course if description is not present" do
    post :create, params: {course: {name: "Ruby on Rails", tutors_attributes: [{name: "Tutor New"}]}}
    json_response = response
    parsed_body = JSON.parse(json_response.body).with_indifferent_access
    expect(json_response.status).to equal(200)
    expect(parsed_body[:response_code]).to equal(422)
    expect(parsed_body[:error][:description]).to eql(["can't be blank"])
  end

  it "should list all the courses" do
    get :index
    json_response = response
    parsed_body = JSON.parse(json_response.body).with_indifferent_access
    expect(response.status).to equal(200)
    expect(parsed_body[:response_code]).to equal(200)
    expect(parsed_body[:course_data].class).to equal(Array)
  end
end