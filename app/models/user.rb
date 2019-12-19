class User < ApplicationRecord
  after_create :create_tenant
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
         
  private
  
  def create_tenant
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    puts subdomain
    puts email
    Apartment::Tenant.create(subdomain)
  end
end
