# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_with_selected(name, url_options={}, html_options={}, &block)
    css_class = (!!block.call) ? 'selected' : nil
    link_to name, url_options, html_options.merge(:class => css_class)
  end

  # Creates a submit button with the given name with a cancel link
  # Accepts a Hash of options in url_for format to create the cancel link
  def submit_tag_or_cancel(name, options={})
    options = 'javascript:history.go(-1);' if options.empty?
    "#{submit_tag(name)} or #{link_to 'Cancel', options, :class => 'cancel' }"
  end
end
