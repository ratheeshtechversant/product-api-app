class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable, :rememberable, 
  #        :confirmable, :trackable,
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable:validatable,
  devise :database_authenticatable, :registerable,
         
         :jwt_authenticatable,jwt_revocation_strategy: JwtDenylist
  has_one_attached :image

  has_one :cart
  has_many :orders


  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?       
  end
end
