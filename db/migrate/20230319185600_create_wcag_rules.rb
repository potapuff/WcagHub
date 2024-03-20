class CreateWcagRules < ActiveRecord::Migration[6.0]
  def change
    create_table :wcag_rules, id: :integer do |t|
      t.text :key
      t.text :description
      t.text :url
    end
  end
end