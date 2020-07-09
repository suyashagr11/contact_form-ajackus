class ContactMailer < ApplicationMailer

  def new_contact_email
    @contact = params[:contact]
    mail(to: ENV['CONTACT_US_EMAIL'], subject: 'New Query')
  end
end
