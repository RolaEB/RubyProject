class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  
  validates:name,presence: true ,length:{minimum:4}
  validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates:birthday,presence: true
  validates :gender,presence: true, inclusion:{in:[0,1]}
  
  has_many:courses
  has_many:lectures

  mount_uploader :image, ImageUploader

end
