class Category < ApplicationRecord
  has_many :contents
  def locale
    case I18n.locale
    when :vi
      self.vi
    when :en
      self.en
    end
  end
end
