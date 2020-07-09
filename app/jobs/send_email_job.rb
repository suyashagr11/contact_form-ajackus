# frozen_string_literal: true

class SendEmailJob < ApplicationJob
  def perform(contact_id)
    return unless contact(contact_id)

    ContactMailer.with(contact: @contact).new_contact_email.deliver
  end

  private

  def contact(id)
    @contact ||= Contact.find_by(id: id)
  end
end
