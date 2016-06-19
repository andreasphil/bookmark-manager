#
# Extends the devise mailer with own mailing functionality
#
class DeviseCustomMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  include Roadie::Rails::Automatic
  default template_path: 'devise/mailer'
  before_action :set_options


  def confirmation_instructions(record, token, opts={})
    opts[:from] = @options[:from]
    opts[:reply_to] = @options[:reply_to]
    opts[:subject] = 'Bookmark Manager account confirmation'
    super
  end

  def reset_password_instructions(record, token, opts={})
    opts[:from] = @options[:from]
    opts[:reply_to] = @options[:reply_to]
    opts[:subject] = 'Reset password'
    super
  end

  def password_change(record, opts={})
    opts[:from] = @options[:from]
    opts[:reply_to] = @options[:reply_to]
    opts[:subject] = 'Your password has been changed'
    super
  end


  private

  def set_options
    @options = Hash.new
    @options[:from] = 'Bookmark Manager <no-reply@manage-my-bookmarks.herokuapp.com>'
    @options[:reply_to] = 'Bookmark Manager <no-reply@manage-my-bookmarks.herokuapp.com>'
  end
end