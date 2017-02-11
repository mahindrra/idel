class InstructorController < ApplicationController

  def dashboard
  end  
  
  def learners
    @profiles = Porfile.where.not(learner_dimension_scale_id:nil)
  end
  def guide
  end  
  def create_course
  end

  def new_course
  end

  def list_course
  end

  def update_course
  end
end
