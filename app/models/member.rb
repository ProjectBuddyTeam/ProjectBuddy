class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  validates :username, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |member|
      member.email = auth.info.email
      member.username = auth.info.nickname
      member.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |member|
      if (data = session['devise.github_data']) && session['devise.github_data']['extra']['raw_info']
        member.email = data['email'] if member.email.blank?
        member.username = data['nickname'] if member.username.blank?
      end
    end
  end
end
