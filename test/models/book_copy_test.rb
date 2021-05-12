# frozen_string_literal: true

# == Schema Information
#
# Table name: book_copies
#
#  id         :bigint           not null, primary key
#  format     :integer          not null
#  isbn       :string           not null
#  published  :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#  user_id    :bigint
#
# Indexes
#
#  index_book_copies_on_book_id  (book_id)
#  index_book_copies_on_isbn     (isbn)
#  index_book_copies_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class BookCopyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
