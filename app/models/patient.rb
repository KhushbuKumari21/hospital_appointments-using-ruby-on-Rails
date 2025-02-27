class Patient < ApplicationRecord
    has_many :appointments
    has_many :doctors, through: :appointments
    validates :name, :address, presence: true
    validates :email, uniqueness: true
  end
  