class ReferenceLink < ActiveRecord::Base
  belongs_to :drone_attack, :autosave => true
  belongs_to :publisher, :autosave => true
  attr_accessible :url, :publisher, :publishers_attributes, :publisher_id
  accepts_nested_attributes_for :publisher
end
