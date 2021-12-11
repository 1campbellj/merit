class AddDegrees < ActiveRecord::Migration[6.1]
  def change
    ['GED', "Bachelor's Degree", "Master's Degree"].each do |degree|
      Degree.create(name: degree)
    end
  end
end
