class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale, :check_domain
  def specific_contents_path
    contents_path(content_type: contents_type.tableize)
  end
  helper_method :specific_contents_path

  def specific_content_path(content)
    content_path(content, content_type: contents_type.tableize)
  end
  helper_method :specific_content_path

  def new_specific_content_path
    new_content_path(content_type: contents_type.tableize)
  end
  helper_method :new_specific_content_path

  def edit_specific_content_path(content)
    edit_content_path(content, content_type: contents_type.tableize)
  end
  helper_method :edit_specific_content_path

private
def set_locale
  if params[:locale]
    I18n.locale = params[:locale]
  elsif session[:locale]
    I18n.locale = session[:locale]
  else
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end
  session[:locale] = I18n.locale
end

def check_domain
  if request.host != "localhost" && request.host != "35.187.234.146"
    if (request.host.include? "locvanrice") == false
      redirect_to 'http://locvanrice.com'
    end
  end
end

def extract_locale_from_tld
  parsed_locale = request.host.split('.').last
  case parsed_locale
  when "com"
    return :vi
  when "net"
    return :en
  end
end

end
