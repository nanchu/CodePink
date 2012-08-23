class Publisher < ActiveRecord::Base
  belongs_to :reference_link, :autosave => true
  attr_accessible :name
end
