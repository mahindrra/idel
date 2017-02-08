class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :role
  #before_create :set_default_role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  def check_if_admin?
    self.role.name == 'admin'
  end

  private

  def set_default_role
    self.role ||= Role.find_by_name('student')
  end       
end
