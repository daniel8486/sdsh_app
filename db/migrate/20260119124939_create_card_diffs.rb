class CreateCardDiffs < ActiveRecord::Migration[8.1]
  def change
    create_table :card_diffs do |t|
      t.string :title
      t.string :subtitle
      t.json :cards

      t.timestamps
    end
  end
end
