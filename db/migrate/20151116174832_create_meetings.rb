class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :title
      t.string :datetime
      t.string :location
      t.string :theme
      t.string :details
      t.string :host
      t.string :invited
      t.string :attending
      t.string :meeting_image
      t.references :club, index: true, foreign_key: true
    end
  end
end
