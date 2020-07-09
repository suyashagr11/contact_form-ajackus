# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  def new_contact_email
    @contact = params[:contact]
    mail(to: ENV['CONTACT_US_EMAIL'], subject: t('contact.email.subject'))
  end
end
