class Todo < ApplicationRecord
  before_save :set_due_date_if_not_provided

  validates :title, presence: true
  validates :description, length: { maximum: 500 }
  
  private

  def set_due_date_if_not_provided
    self.dueDate ||= Date.current
  end
end
