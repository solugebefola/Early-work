class Article < ActiveRecord::Base
    has_many :comments
    has_many :taggings
    has_many :tags, through: :taggings

    def tag_list
        tags.join(", ")
    end

    def tag_list=(tags_string)
        tag_names = tags_string.downcase.split(",").collect{ |s| s.strip }.uniq
        new_or_found_tags = tag_names.collect { |tag_name| Tag.find_or_create_by(name: tag_name) }
        self.tags = new_or_found_tags
    end
end
