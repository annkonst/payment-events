module ApplicationHelper

  def gravatar_url(user)
    hash = Digest::MD5.hexdigest(user.email.downcase.strip)
    return "http://s.gravatar.com/avatar/#{hash}?s=48"
  end

end
