class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :age, presence: true
  validates :weight, presence: true
  validates :height, presence: true
  validates :sex, presence: true

  def calculate_counter_calories
     calculate_counter_calories = 65+(6*self.weight) + (12 * self.height) - (6*self.age)
     return calculate_counter_calories
   end
end
