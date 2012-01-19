require File.dirname(__FILE__) + '/../test_helper'

class EventTest < Test::Unit::TestCase
  fixtures :events, :users

  def test_should_create_event
    event = Event.new

    event.user = users(:eugene)
    event.title = "Test Event"
    event.url = "http://example.com"
    event.description = "Test description"
    event.location = "Test location"
    event.occurs_on = "2007-09-09"

    assert event.save
  end

  def test_should_find_event
    event_id = events(:tiki_party).id
    assert_nothing_raised { Event.find(event_id) }
  end

  def test_should_update_event
    event = events(:tiki_party)
    event.update_attributes(:title => 'New title')
  end

  def test_should_destroy_event
    event = events(:tiki_party)
    event.destroy
    assert_raise(ActiveRecord::RecordNotFound) { Event.find(event.id) }
  end

  def test_should_not_create_invalid_event
    event = Event.new
    assert !event.valid?
    assert event.errors.invalid?(:title)
    assert event.errors.invalid?(:location)
    assert_equal "can't be blank", event.errors.on(:title)
    assert_equal "can't be blank", event.errors.on(:location)
    assert !event.save
  end
end
