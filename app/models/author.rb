# frozen_string_literal: true

# == Schema Information
#
# Table name: authors
#
#  id         :bigint           not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_authors_on_last_name  (last_name)
#
class Author < ApplicationRecord
  paginates_per 10
  max_paginates_per 100

  has_many :books

  validates :first_name, :last_name, presence: true
end
