class CreateSiteInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :site_infos do |t|
      t.string :title
      t.string :enter_code_message
      t.string :invalid_code_message
      t.string :successful_code_message

      t.timestamps
    end
  end
end
