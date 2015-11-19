class ChangeColumnNames < ActiveRecord::Migration
  def change
    change_table :meetings do |t|
      t.rename :theme, :address
      t.rename :invited, :time
      t.rename :datetime, :date
    end
  end
end
