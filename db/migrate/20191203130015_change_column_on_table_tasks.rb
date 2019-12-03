class ChangeColumnOnTableTasks < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tasks, :category_id, :null => true
  end
end
