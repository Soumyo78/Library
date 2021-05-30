class Api::V1::AuthorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name


  has_many :books, serializer: Api::V1::BookSerializer
end
