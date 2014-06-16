class Usuario < ActiveRecord::Base
  attr_reader :avatar_remote_url
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :omniauthable,:validatable,:authentication_keys => [:login]
  has_many :reclamacao
  validates_presence_of :nome
  validates_presence_of :login
  validates_uniqueness_of :login

  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "50x50>" }, :default_url => "missing1.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def avatar_remote_url=(url_value)
    self.avatar = URI.parse(url_value)
    @avatar_remote_url = url_value
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    usuario = Usuario.where(:provider => auth.provider, :uid => auth.uid).first
    if usuario
      return usuario
    else
      registered_usuario = Usuario.where(:email => auth.info.email).first
      if registered_usuario
        return registered_usuario
      else
        uri = URI.parse(auth.info.image)
        uri.scheme = 'https'
        encoded_url = URI.encode(uri.to_s)
        usuario = Usuario.create(nome:auth.extra.raw_info.name,
                                 login:auth.info.email,
                                 provider:auth.provider,
                                 uid:auth.uid,
                                 email:auth.info.email,
                                 password:Devise.friendly_token[0,20],
                                 avatar: URI.parse(encoded_url)
                                 )

      end
    end
  end
end
