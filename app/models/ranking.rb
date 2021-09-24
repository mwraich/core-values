class Ranking < ApplicationRecord
  belongs_to :card
  belongs_to :rating
  belongs_to :selection
end
