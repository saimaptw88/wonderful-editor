# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :evaluations, dependent: :destroy

  validates :title, presence: true
end
