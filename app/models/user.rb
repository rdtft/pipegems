class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  attr_accessible :nickname, :name, :email, :github_token, :password

  has_many :rubygems

  def self.find_or_create_by_oauth(access_token)
    data = access_token.info

    if user = User.where(email: data.email).first
      user
    else
      User.create! \
        nickname:     data.nickname,
        name:         data.name,
        email:        data.email,
        github_token: access_token.credentials.token,
        password:     Devise.friendly_token[0, 20]
    end
  end
end
