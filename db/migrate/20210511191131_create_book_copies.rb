# frozen_string_literal: true

class CreateBookCopies < ActiveRecord::Migration[6.1]
  def change
    create_table :book_copies do |t|
      t.references :book, null: false, foreign_key: true
      t.string :isbn, null: false, index: true
      t.date :published, null: false
      t.integer :format, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
