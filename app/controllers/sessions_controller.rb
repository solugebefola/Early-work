class SessionsController < ApplicationController
  attr_reader: :password


validates :password minimum: [length: 6, any_nil: true] #check this

end
