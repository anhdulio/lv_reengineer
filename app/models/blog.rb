class Blog < Content
    has_and_belongs_to_many :tags
end