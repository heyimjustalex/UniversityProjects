class Person < ApplicationRecord
    self.abstract_class = true
    has_many :meetings
end