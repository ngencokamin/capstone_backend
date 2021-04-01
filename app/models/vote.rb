class Vote < ApplicationRecord
  belongs_to :comment
  belongs_to :user

  # validates :value, numericality: true, inclusion: { in: -1..1, message: "Value must be between -1 and 1" }

end
