class CreateHostsStatusHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :hosts_status_histories do |t|
      t.belongs_to :host, index: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
