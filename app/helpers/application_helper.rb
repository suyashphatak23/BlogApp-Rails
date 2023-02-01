module ApplicationHelper
    def gravatar_for(user)
        # get the email from URL-parameters or what have you and make lowercase
        email_address = user.email.downcase

        # create the md5 hash
        hash = Digest::MD5.hexdigest(email_address)
        
        # compile URL 
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}"

        image_tag(gravatar_url, alt:user.username, class:"rounded mx-auto shadow d-block", width:200, height:"auto")
    end


end
