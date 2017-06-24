class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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
end
