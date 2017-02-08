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


### questions
if Question.first.blank?
	questions_array = [
		{ 
			name:'When I think about what I did yesterday, I am most likely to get',
			answer_a:'a picture.',
			answer_b:'words.', 
		},
		{
		 	name: 'I prefer to get new information in ?', 
	 		answer_a:"pictures, diagrams, graphs, or maps.",
			answer_b:"written directions or verbal information."
		},
		{ 
			name:"In a book with lots of pictures and charts, I am likely to",
			answer_a:'look over the pictures and charts carefully.',
			answer_b:'focus on the written text.'
		},
		{ 
			name:'I like teachers', 
			answer_a:'who put a lot of diagrams on the board.',
			answer_b:'who spend a lot of time explaining.',
		},	 
		{
			name: "I remember best", 
			answer_a:'what I see.',
			answer_b:'what I hear.'
		},	 
		{
			name: "When I get directions to a new place, I prefer", 
	 		answer_a:'a map.', 
			answer_b:'written instructions.'
		},
		{ 
			name:'When I see a diagram or sketch in class, I am most likely to remember', 
			answer_a:'the picture.', 
	    	answer_b:'what the instructor said about it.'
		},     
		{   
			name:'When someone is showing me data, I prefer', 
			answer_a:'charts or graphs.',
			answer_b:'text summarizing the results.'
		},
		{
			name: "When I meet people at a party, I am more likely to remember",
			answer_a:'what they looked like.', 
			answer_b:'what they said about themselves.'
		},
		{
			name:"For entertainment, I would rather", 
			answer_a:'watch television.', 
			answer_b:'read a book.'
		}, 
		{  
			name: "I tend to picture places I have been", 
			answer_a:'easily and fairly accurately.',
			answer_b:'with difficulty and without much detail.' 
		}
	]

	questions_array.each do |hash|
		q = Question.find_or_create_by(name:hash[:name],answer_a:hash[:answer_a],answer_b:hash[:answer_b])
		q.save
	end
end	