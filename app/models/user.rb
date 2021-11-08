class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def calculate_counter_calories
     calculate_counter_calories = 65+(6*self.weight) + (12 * self.height) - (6*self.age)
     return calculate_counter_calories
   end
end
