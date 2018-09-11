class User < ApplicationRecord
  has_one :owned_list, class_name: 'List', foreign_key: :owner_id
  has_many :list_members
  has_many :lists, through: :list_members

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :omniauthable, :registerable, :rememberable,
         :trackable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      data = session['devise.google_data']
      if data && session['devise.google_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def list
    owned_list || lists.first
  end
end
