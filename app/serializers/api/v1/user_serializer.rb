class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email

  has_many :book_copies, serializer: Api::V1::UserBookCopySerializer
end
