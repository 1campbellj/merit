class AddGoals < ActiveRecord::Migration[6.1]
  def up
    goals = [
      'Work stable hours',
      'Build a career I love',
      'Make more money'
    ]

    goals.each do |g|
      Goal.create(text: g)
    end
  end
end
