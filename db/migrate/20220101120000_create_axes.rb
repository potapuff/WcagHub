class CreateAxes < ActiveRecord::Migration[6.0]
  def change
    create_table :axes, id: :integer do |t|
      t.text :url, null: false
      t.text :criteria
      t.text :level
      t.text :result
      t.timestamp :version

    end
  end
end