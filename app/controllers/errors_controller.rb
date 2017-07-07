class ErrorsController < ApplicationController
  include MenuConcern
  before_action :set_menubar
  before_action :set_meta

  def not_found
    @header_info = { title: '', subtitle: t('website.error.notfound') }
    render('template', :status => 404)
  end

  def internal_server_error
    @header_info = { title: '', subtitle: t('website.error.internal') }
    render('template', :status => 500)
  end

  def success
    @header_info = { title: '', subtitle: t('website.error.success') }
    render('template')
  end

  private

  def set_meta
    @meta_title = t('website.market.header.title')
    @meta_description= t('website.market.header.subtitle')
    @contact_widget = true
  end

end
