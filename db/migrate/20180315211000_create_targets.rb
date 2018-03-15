class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.integer :applicant_id
      t.integer :company_id

      t.timestamps

    end
  end
end
