class Api::V1::BookSerializer < ActiveModel::Serializer
  attributes :id, :title

  belongs_to :author, serializer: Api::V1::AuthorSerializer
  has_many :book_copies, serializer: Api::V1::BookBookCopySerializer
end
