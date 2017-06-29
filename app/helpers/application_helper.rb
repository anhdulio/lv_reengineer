module ApplicationHelper
  def set_error(message="")
      "this.setCustomValidity('#{message}')"
  end
end
