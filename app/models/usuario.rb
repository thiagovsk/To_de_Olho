class Usuario < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :omniauthable,:validatable,:authentication_keys => [:login]

  validates_presence_of :nome

  validates_presence_of :login
  validates_uniqueness_of :login

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    usuario = Usuario.where(:provider => auth.provider, :uid => auth.uid).first
    if usuario
      return usuario
    else
      registered_usuario = Usuario.where(:email => auth.info.email).first
      if registered_usuario
        return registered_usuario
      else
        usuario = Usuario.create(nome:auth.extra.raw_info.name,
                                 login:auth.info.email,
                                 provider:auth.provider,
                                 uid:auth.uid,
                                 email:auth.info.email,
                                 password:Devise.friendly_token[0,20],
                                 )
    end    end
  end
end
