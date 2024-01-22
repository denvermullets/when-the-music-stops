class Topic < ApplicationRecord
  belongs_to :forum
  belongs_to :user
  belongs_to :sub_forum
end
