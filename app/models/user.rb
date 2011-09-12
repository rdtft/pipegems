class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  attr_accessible :nickname, :name, :email, :github_token, :password

  has_many :rubygems

  def self.find_or_create_by_oauth(access_token)
    user_info = access_token['user_info']

    if user = User.find_by_nickname( user_info['nickname'] )
      user
    else
      User.create \
        nickname:     user_info['nickname'],
        name:         user_info['name'],
        email:        user_info['email'],
        github_token: access_token['credentials']['token'],
        password:     Devise.friendly_token[0, 20]
    end
  end
end
