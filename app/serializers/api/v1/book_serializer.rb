class Api::V1::BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :author, :book_copies

  def author
    instance_options[:without_serializer] ? object.author : AuthorSerializer.new(object.author, without_serializer: true)
  end
end
