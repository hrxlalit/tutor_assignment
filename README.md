This README would normally document whatever steps are necessary to get the application up and running.

Things you may want to cover:

Ruby version 3.2.2

System dependencies require rvm with ruby, rails etc Rails Version: 7.0.4.3

Configuration

Database creation using sqlite3 database 
rails db:create
rails db:migrate

How to run the test suite: use the following command to run the test 

rspec spec/controllers/courses_controller_spec.rb
rspec spec/models/tutor_spec.rb
rspec spec/models/course_spec.rb


Deployment instructions

we can deploy on AWS ec2 using capstrano ngins/apache as a web server and Puma/passenger as application server

we can deploy on Heroku

tutor_assignment