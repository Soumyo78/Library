class Api::V1::BookBookCopySerializer < ActiveModel::Serializer
  attributes :user_id, :isbn, :format, :published
end
