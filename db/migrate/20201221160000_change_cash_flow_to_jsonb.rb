class ChangeCashFlowToJsonb < ActiveRecord::Migration[6.0]
  def change
    remove_column :platforms, :cashflow_options

    add_column :platforms, :cashflow_options, :jsonb
  end
end
