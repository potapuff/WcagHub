class CreateAxeDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :axe_details, id: :integer do |t|
      t.text :url
      t.text :rule_type
      t.text :result_type
      t.text :result_condition
      t.integer :result_condition_index
      t.text :rule_set
      t.text :impact
      t.text :message
      t.text :html_element
      t.text :dom_element
      t.text :help
      t.text :help_url
      t.text :wcag_criteria
      t.text :axe_version
      t.timestamp :version
    end
  end
end