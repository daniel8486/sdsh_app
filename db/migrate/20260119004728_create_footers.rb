class CreateFooters < ActiveRecord::Migration[8.1]
  def change
    create_table :footers do |t|
      t.string :first_name_company
      t.string :second_name_company
      t.string :sub_title
      t.string :email
      t.string :phone
      t.string :location
      t.string :text_company_footer

      t.timestamps
    end
  end
end
