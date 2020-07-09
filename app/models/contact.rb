# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_name, :message, presence: true

  after_create :send_query

  private

  def send_query
    SendEmailJob.perform_later(id)
  end
end
