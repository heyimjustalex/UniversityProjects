class CreateMedicalInterviews < ActiveRecord::Migration[7.0]
  def change
    create_table :medical_interviews do |t|
      t.string :hygiene
      t.string :treatment_story
      t.string :interview_description
      t.references :meeting, null: false, foreign_key: true

      t.timestamps
    end
  end
end
