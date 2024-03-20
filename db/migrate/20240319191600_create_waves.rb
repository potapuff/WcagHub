class CreateWaves < ActiveRecord::Migration[6.0]
  def change
    create_table :waves, id: :integer do |t|
      t.text :url
      t.text :keys
      t.boolean :successful
      t.integer :wcag_errors, default:0
      t.integer :contrast_errors , default:0
      t.integer :aria_elements, default:0
      t.integer :text_length, default:0
      t.timestamp :version

    end
  end
end