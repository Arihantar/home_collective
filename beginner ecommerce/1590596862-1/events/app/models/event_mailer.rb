class EventMailer < ActionMailer::Base
  def email_friend(recipient, sender_name, event)
    @subject      = '[Eventalicious] Check out this great event'
    @from         = 'Eventalicious <events@example.com>'
    @recipients   = recipient
    @content_type = 'text/html'
    @body         = { :sender_name => sender_name, :event => event }
    
    # attachment('image/png') do |a|
    #   a.body     = File.read('public/images/rails.png')
    #   a.filename = 'eventalicious.png'
    # end
  end
end
