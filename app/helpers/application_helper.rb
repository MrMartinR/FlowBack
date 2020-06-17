
module ApplicationHelper
  # include MD5 gem, should be part of standard ruby install
  require 'digest/md5'

  def gravatar_img_url(email)
    email_address = email.downcase
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)
    # compile URL which can be used in <img src="RIGHT_HERE"...
    image_src = "https://www.gravatar.com/avatar/#{hash}"
  end

  def date_format(dt)
    if dt.class == Date
     dt.strftime('%d-%m-%Y')
    else
     dt
    end
  end
end
