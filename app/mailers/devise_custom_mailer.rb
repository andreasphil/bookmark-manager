#
# Extends the devise mailer with own mailing functionality
#
class DeviseCustomMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer'
  before_action :set_options


  def confirmation_instructions(record, token, opts={})
    opts[:from] = @options[:from]
    opts[:reply_to] = @options[:reply_to]
    opts[:subject] = 'Bookmark Manager account confirmation'
    super
  end

  private

  def set_options
    @options = Hash.new
    @options[:from] = 'no-reply@example.com'
    @options[:reply_to] = 'no-reply@example.com'
  end
end