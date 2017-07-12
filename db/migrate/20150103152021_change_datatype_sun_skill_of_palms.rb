class ChangeDatatypeSunSkillOfPalms < ActiveRecord::Migration[5.1]
  def change
    change_column :palms, :sun_skill, :integer
  end
end
