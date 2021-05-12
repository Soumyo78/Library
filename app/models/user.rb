# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  first_name :string           not null
#  last_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email)
#
class User < ApplicationRecord
  has_many :book_copies

  validates :first_name, :last_name, :email, presence: true, format: { with: /\A[a-zA-Z0-9+_.-]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Enter a valid email address" }
end
