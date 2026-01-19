class AddTextsForAboutCompanies < ActiveRecord::Migration[8.1]
  def change
    add_column :about_companies, :text_about_first, :string
    add_column :about_companies, :text_about_second, :string
    add_column :about_companies, :name_projects_delivered, :string
    add_column :about_companies, :name_uptime_garanteed, :string
    add_column :about_companies, :name_sastified_customers, :string
  end
end
