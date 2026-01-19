class CreateAboutCompanies < ActiveRecord::Migration[8.1]
  def change
    create_table :about_companies do |t|
      t.string :title
      t.string :sub_title
      t.text :text_about
      t.string :projects_delivered
      t.string :uptime_garanteed
      t.string :sastified_customers

      t.timestamps
    end
  end
end
