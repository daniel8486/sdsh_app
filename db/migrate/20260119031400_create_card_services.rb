class CreateCardServices < ActiveRecord::Migration[8.1]
  def change
    create_table :card_services do |t|
      t.string :title_service
      t.string :sub_title
      t.json :cards

      t.timestamps
    end
  end
end
