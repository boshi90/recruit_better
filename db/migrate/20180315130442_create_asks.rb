class CreateAsks < ActiveRecord::Migration
  def change
    create_table :asks do |t|
      t.integer :company_id
      t.integer :question_id

      t.timestamps

    end
  end
end
