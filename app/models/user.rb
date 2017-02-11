class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :role
  has_one :profile 
  #before_create :set_default_role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def check_if_admin?
    self.role.name == 'admin'
  end
  def get_full_name
    profile = Porfile.where(user_id:self.id).first
    if profile.present?
      full_name = "#{profile.first_name.to_s} #{profile.last_name.to_s}"
      full_name.titleize
    end  
  end  
  def save_learning_style(name)
    lds_obj = LearnerDimensionScale.where(name:name).first
    if lds_obj.present?
      profile = Porfile.where(user_id:self.id).first
      profile.update_attributes(learner_dimension_scale_id:lds_obj.id)
    end 
  end  
  private

  def set_default_role
    self.role ||= Role.find_by_name('student')
  end       
end
