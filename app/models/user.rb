class User < ActiveRecord::Base

  def generate_session_token
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

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
