require File.dirname(__FILE__) + '/../test_helper'

class EventMailerTest < Test::Unit::TestCase
  FIXTURES_PATH = File.dirname(__FILE__) + '/../fixtures'
  CHARSET = "utf-8"

  include ActionMailer::Quoting
  fixtures :events

  def setup
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []

    @expected = TMail::Mail.new
    @expected.set_content_type "text", "plain", { "charset" => CHARSET }
    @expected.mime_version = '1.0'
  end

  def test_email_friend
    recipient = 'dude@example.com'
    name = 'Duuuuuude'
    event = events(:tiki_party)
    
    @expected.subject = '[Eventalicious] Check out this great event'
    @expected.body    = read_fixture('email_friend')
    @expected.date    = Time.now
    
    mail_to_friend = EventMailer.create_email_friend(recipient, name, event)
    assert_equal mail_to_friend.subject, @expected.subject
  end

  private
    def read_fixture(action)
      IO.readlines("#{FIXTURES_PATH}/event_mailer/#{action}")
    end

    def encode(subject)
      quoted_printable(subject, CHARSET)
    end
end
