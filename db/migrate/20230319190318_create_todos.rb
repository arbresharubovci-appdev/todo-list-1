class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :next_up
      t.string :in_progress
      t.string :done

      t.timestamps
    end
  end
end
