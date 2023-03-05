# frozen_string_literal: true

class AddDescriptionToCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :desc, :text
  end
end
