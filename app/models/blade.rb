class Blade < ApplicationRecord
    has_many :basketblades
    has_many :catalogueblades
    has_one_attached :image
end
