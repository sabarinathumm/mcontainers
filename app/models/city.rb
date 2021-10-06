class City < ApplicationRecord
    belongs_to :province
    validates_presence_of :name
end
