class Task < ApplicationRecord
  before_validation :assign_description, unless: :description_present

  validates :description, presence: true

  def assign_description
    self.description = 'No task description provided!'
  end

  def description_present
    description.present?
  end
end
