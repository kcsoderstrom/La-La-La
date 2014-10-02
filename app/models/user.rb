class User < ActiveRecord::Base
  include BCrypt
  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom.hex(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.update!(session_token: session_token)
    #rescue if already used
  end

  def password=(password)
    self.password_digest = Password.create(password)
  end

  def is_password?(password)
    Password.new(password_digest).is_password?(password)
  end

  def to_s
    email
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
