# Content Model
class Content < ApplicationRecord
  #FriendlyId for SEO URL
  extend FriendlyId
  friendly_id :title, :use => :slugged
  validates_uniqueness_of :slug
  belongs_to :category

  scope :published, (-> { where('published_at <= ?', Time.zone.now) })

  def self.content_attr(attr_name, attr_type = :string)
    content_attributes[attr_name] = attr_type

    define_method(attr_name) do
      self.payload ||= {}
      self.payload[attr_name.to_s]
    end

    define_method("#{attr_name}=".to_sym) do |value|
      self.payload ||= {}
      self.payload[attr_name.to_s] = value
    end
  end

  def self.content_attributes
    @content_attributes ||= {}
  end

  def self.get_values(attr_name, attr_type)
    values = self.where(type: attr_type)
    if values.size.zero?
      return nil
    else
      value_string = ''
      values.each do |value|
        value_string += "#{value.method(attr_name).call},"
      end
      return value_string.split(",").map {|s| s.strip}.uniq
    end
  end

end
