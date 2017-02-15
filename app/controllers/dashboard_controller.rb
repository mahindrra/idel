class DashboardController < ApplicationController
  
  def index
    if current_user.role.name == 'admin'
      root_path = dashboard_admin_home_path
    elsif current_user.role.name =='teacher'
      root_path = instructor_dashboard_path
    else
      root_path = dashboard_student_home_path
    end
    redirect_to root_path
  end

	def admin_home
	end

	def teacher_home
	end

	def student_home
  	### check if profile learner id is set for the user 
  	#if set dont show questions show the courses
  	## else show questions
  	@show_questions_flag = true
  	profile = Porfile.where(user_id:current_user.id).first
  	if profile.present?
  		if profile.learner_dimension_scale_id.present?
  			### show courses here
  			@show_questions_flag = false
        @courses = Course.where(learner_style_id:profile.learner_dimension_scale.learner_style.id)
  		else
  			@questions = Question.all
  		end	
  	else
  		@questions = Question.all
  	end	
  	
  end
  def edit_profile
  	@profile = Porfile.find_or_create_by(user_id:current_user.id)
  end
  def save_profile
  	profile_params = save_profile_params
  	if profile_params[:user_id].present?
  		profile = Porfile.where(user_id:profile_params[:user_id]).first
  		profile.update_attributes(first_name:profile_params[:first_name],
  			last_name:profile_params[:last_name])
  	end	
  	redirect_to dashboard_student_home_path
  end
  def test
  	hash =  params[:user][:test] unless params[:user][:test].nil?
  	result_array = hash.values.sort
  	a_count = 0
  	b_count = 0
  	lds = 0
  	learner_dimension_scale_name = ''
  	answer_of_larger_letter = ''
  	result_array.each do|result|
  		if result=='a'
  			a_count +=1
  		else
  			b_count +=1
  		end
  	end
  	if a_count > b_count
  		answer_of_larger_letter = 'a'
  		lds = a_count - b_count
  	else
  		answer_of_larger_letter = 'b'
  		lds = b_count - a_count
  	end	
  	lds_str = "#{lds}#{answer_of_larger_letter}"
  	if lds_str=='1a' || lds_str=='3a' || lds_str=='1b' || lds_str=='3b'
  		#puts "Your Visually and verbalar balanced learner"
  		learner_dimension_scale_name = 'Balanced'
  	elsif lds_str=='5a' || lds_str=='7a'
  		#puts "You are Visually inclined learner"
  		learner_dimension_scale_name = 'Visual Inclined'
  	elsif lds_str=='9a' || lds_str=='11a'
  		#puts "You are Visual Learner"
  		learner_dimension_scale_name = 'Visual'
  	elsif lds_str=='5b' || lds_str=='7b'
  		#puts "Your are verbally inclined Learner"
  		learner_dimension_scale_name = 'Verbal Inclined'
  		
  	elsif lds_str=='9b' || lds_str=='11b'
  		#puts "You are verbal learner"
  		learner_dimension_scale_name = 'Verbal'				    			
  	end
  	current_user.save_learning_style(learner_dimension_scale_name)
  	redirect_to dashboard_student_home_path, notice:"You are learning style is #{learner_dimension_scale_name}"
  end	
  private
  def save_profile_params
  	params.require(:porfile).permit(:first_name,:last_name,:user_id)
  end
  def test_params
  	params.require(:user).permit('test[]',:id)
  end	
end
