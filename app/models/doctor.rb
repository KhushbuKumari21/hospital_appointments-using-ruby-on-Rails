class Doctor < ApplicationRecord
    has_many :appointments
    has_many :patients, through: :appointments
    validates :name, :specialty, :address, :joining_date, presence: true
  end
  