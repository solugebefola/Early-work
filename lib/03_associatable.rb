require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    class_name.constantize
  end

  def table_name
    class_name.tableize
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    name_id = "#{name.to_s.underscore}_id".to_sym
    classy_name = "#{name}".camelize

    defaults = {
      foreign_key: name_id,
      primary_key: :id,
      class_name: classy_name
    }
    new_keys = defaults.merge(options)
    @name = name
    @foreign_key = new_keys[:foreign_key]
    @class_name = new_keys[:class_name]
    @primary_key = new_keys[:primary_key]
  end

end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    name_id = "#{self_class_name.underscore}_id".to_sym
    classy_name = "#{name}".camelize.singularize

    defaults = {
      foreign_key: name_id,
      primary_key: :id,
      class_name: classy_name
    }
    new_keys = defaults.merge(options)
    @name = name
    @foreign_key = new_keys[:foreign_key]
    @class_name = new_keys[:class_name]
    @primary_key = new_keys[:primary_key]
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    # ...
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
end
