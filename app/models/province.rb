class Province < ApplicationRecord
    validates_presence_of :name
    has_many :cities
end
