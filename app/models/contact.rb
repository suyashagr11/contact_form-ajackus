class Contact < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_name, :message, presence: true
end
