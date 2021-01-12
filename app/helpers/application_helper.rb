module ApplicationHelper
  # include MD5 gem, should be part of standard ruby install
  require 'digest/md5'

  def gravatar_img_url(email)
    email_address = email.downcase
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)
    # compile URL which can be used in <img src="RIGHT_HERE"...
    "https://www.gravatar.com/avatar/#{hash}"
  end

  def parser_json(str)
    JSON.parse(str)
  rescue StandardError
    str
  end

  def date_format(date)
    if date.instance_of?(Date)
      date.strftime('%Y-%m-%d')
    else
      date
    end
  end
end
