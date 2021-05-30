class Api::V1::UserBookCopySerializer < ActiveModel::Serializer
  attributes :book_id, :isbn, :format, :published
end
