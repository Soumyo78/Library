class Api::V1::BookCopySerializer < ActiveModel::Serializer
  attributes :book_id, :user_id, :isbn, :format, :published
end
