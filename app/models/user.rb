class User < ApplicationRecord

	attr_accessor :role

	before_create :associate_roles

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :blogs, class_name: 'Blog', foreign_key: :author_id
  has_many :feedbacks

  private
  	def associate_roles
  		add_role(role)
  	end
end
