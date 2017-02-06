# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# added defaukt roles
if Role.first.blank?
	['admin', 'teacher', 'student'].each do |role|
	  Role.find_or_create_by({name: role})
	end
end

## add  users
if User.first.blank?
	email_array = ['admin@example.com','teacher@example.com','student@example.com'] 
	default_password ='12345678'
	email_array.each_with_index do |email,index| 
		user = User.find_or_create_by(email:email)
		user.password = default_password
		user.password_confirmation = default_password
		user.role_id = index+1
		user.save
	end
end

### add default learning styles

if LearnerStyle.first.blank?
	['Visual','Verbal','Balanced'].each  do |ls_style|
		ls_object = LearnerStyle.find_or_create_by(name:ls_style)
		ls_object.save
	end	
end	

if LearnerDimensionScale.first.blank?
	lsds_array =[{name:'Visual Inclined',learner_style_id:1},{name:'Visual',learner_style_id:1},
		{name:'Verbal Inclined',learner_style_id:2},{name:'Verbal',learner_style_id:2},
		{name:'Balanced',learner_style_id:3}]
	lsds_array.each do |lsds|
		lds_obj = LearnerDimensionScale.find_or_create_by(name:lsds[:name])
		lds_obj.learner_style_id = lsds[:learner_style_id]
		lds_obj.save
	end	
end	


