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
			question_type:0
		},
		{
		 	name: 'I prefer to get new information in ?', 
	 		answer_a:"pictures, diagrams, graphs, or maps.",
			answer_b:"written directions or verbal information.",
			question_type:0
		},
		{ 
			name:"In a book with lots of pictures and charts, I am likely to",
			answer_a:'look over the pictures and charts carefully.',
			answer_b:'focus on the written text.',
			question_type:0
		},
		{ 
			name:'I like teachers', 
			answer_a:'who put a lot of diagrams on the board.',
			answer_b:'who spend a lot of time explaining.',
			question_type:0
		},	 
		{
			name: "I remember best", 
			answer_a:'what I see.',
			answer_b:'what I hear.',
			question_type:0
		},	 
		{
			name: "When I get directions to a new place, I prefer", 
	 		answer_a:'a map.', 
			answer_b:'written instructions.',
			question_type:0
		},
		{ 
			name:'When I see a diagram or sketch in class, I am most likely to remember', 
			answer_a:'the picture.', 
	    	answer_b:'what the instructor said about it.',
			question_type:0
		},     
		{   
			name:'When someone is showing me data, I prefer', 
			answer_a:'charts or graphs.',
			answer_b:'text summarizing the results.',
			question_type:0
		},
		{
			name: "When I meet people at a party, I am more likely to remember",
			answer_a:'what they looked like.', 
			answer_b:'what they said about themselves.',
			question_type:0
		},
		{
			name:"For entertainment, I would rather", 
			answer_a:'watch television.', 
			answer_b:'read a book.',
			question_type:0

		}, 
		{  
			name: "I tend to picture places I have been", 
			answer_a:'easily and fairly accurately.',
			answer_b:'with difficulty and without much detail.',
			question_type:0 
		},
		{  
			name: "You are going to cook something as a special treat for your family. You would:", 
			answer_a:'Ask friends for suggestions.',
			answer_b:'Use a cookbook where you know there is a good recipe.',
			question_type:1
		},
		{  
			name: "You are about to purchase a digital camera or mobile phone. Other than price, what would most influence your decision?", 
			answer_a:'The salesperson telling me about its features.',
			answer_b:'Read & Compare features with other mobile’s features.',
			question_type:1
		},
		{  
			name: "Remember a time when you learned how to do something new. Try to avoid choosing a physical skill, e.g. riding a bike. You learned best by:", 
			answer_a:'Listening to somebody explaining it and asking questions.',
			answer_b:'Written instructions – e.g. a manual or textbook.',
			question_type:1
		},
		{  
			name: "You have a problem with your knee. You will prefer that the doctor:", 
			answer_a:'Described what was wrong',
			answer_b:'Gave you a web address or something to read about it.',
			question_type:1
		},
		{  
			name: "You want to learn a new program, skill or game on a computer. You will:", 
			answer_a:'Talk with the people who know about the program.',
			answer_b:'Read the written instructions that came with the program.',
			question_type:1
		},
		{  
			name: "I like websites that have:", 
			answer_a:'Audio channels where I can hear music, radio programs or interviews.',
			answer_b:'Interesting written descriptions, lists and explanations.',
			question_type:1
		},
		{  
			name: "Other than price, what would most influence your decision to buy a new non-fiction book?", 
			answer_a:'A friend talks about it and recommends it.',
			answer_b:'Quickly reading parts of it.',
			question_type:1
		},
		{  
			name: "You are using a book, CD or website to learn how to take photos with your new digital camera. You will like to have:", 
			answer_a:'A chance to ask questions and talk about the camera and its features.',
			answer_b:'Clear written instructions with lists and bullet points about what to do.',
			question_type:1
		},
		{  
			name: "Do you prefer a teacher or a presenter who uses:", 
			answer_a:'Question and answer, talk, group discussion, or guest speakers.',
			answer_b:'Handouts, books, or readings.',
			question_type:1
		},
		{  
			name: "You are going to choose food at a restaurant or cafe. You would:", 
			answer_a:'Ask the waiter or friends to recommend choices.',
			answer_b:'Choose from the descriptions in the menu.',
			question_type:1
		},
		{  
			name: "Choose from the descriptions in the menu.", 
			answer_a:'Tell him / her directions.',
			answer_b:'Write down the directions (without a map).',
			question_type:2
		},
		{  
			name: "You are not sure whether a word should be spelled `dependent' or `dependant'. You would:", 
			answer_a:'Think about how each word sounds and choose one.',
			answer_b:'Find it online or in a dictionary / Write again and compare the words.',
			question_type:2
		},
		{  
			name: "You are planning a holiday for friends group. You want some feedback from them about the plan. You will:", 
			answer_a:'Talk over phone, text or email them.',
			answer_b:'Give them a copy of the printed itinerary.',
			question_type:2
		},
		{  
			name: "A group of tourists want to learn about the parks or wildlife reserves in your area. You will:", 
			answer_a:'Talk about, or arrange a talk for them about parks or wildlife reserves.',
			answer_b:'Give them a book or pamphlets about the parks or wildlife reserves.',
			question_type:2
		},
		{  
			name: "You have finished a competition or test and would like some feedback. You would like to have feedback:", 
			answer_a:'From somebody who talks it through with you.',
			answer_b:'Using a written description of your results.',
			question_type:2
		},
		{  
			name: "You have to make an important speech at a conference or special occasion. You would:", 
			answer_a:'Write a few key words and practice saying your speech over and over.',
			answer_b:'Write out your speech and learn from reading it over several times.',
			question_type:2
		}
	]

	questions_array.each do |hash|
		q = Question.find_or_create_by(name:hash[:name],answer_a:hash[:answer_a],answer_b:hash[:answer_b],
			question_type:hash[:question_type])
		q.save
	end
end	