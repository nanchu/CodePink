class Publisher < ActiveRecord::Base
  has_many :reference_link, :autosave => true
  attr_accessible :name
end
