module ApplicationHelper

  def gravatar_url(user)
    default_url = "http://gravatar.com/avatar/images/guest.png"
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}?d=retro&s=32"
  end

end
