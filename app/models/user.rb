class User < ApplicationRecord
  has_many :tasks

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def due_today
    self.tasks.select { |task| task.due_date.localtime.to_date ==
    DateTime.now.to_date }

  end

end
