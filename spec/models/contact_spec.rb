require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'creation' do
    include ActiveJob::TestHelper

    after do
      clear_enqueued_jobs
    end

    context '#valid' do
      it 'should create contact if all fields are valid' do
        contact = Contact.new(first_name: 'John', last_name: 'Doe', email: 'valid@email.com', message: 'test_message')
        expect(contact.save).to be_truthy
      end

      it 'should create contact and enqueue email job' do
        contact = Contact.new(first_name: 'John', last_name: 'Doe', email: 'valid@email.com', message: 'test_message')
        expect { contact.save }.to have_enqueued_job(SendEmailJob)
      end
    end

    context '#invalid' do
      it 'should not create contact when required fields are not present' do
        contact = Contact.new(email: 'valid@email.com')
        expect(contact.save).to be_falsey
      end

      it 'should not create contact when email is not valid' do
        contact = Contact.new(first_name: 'John', last_name: 'Doe', email: 'validemail.com', message: 'test_message')
        expect(contact.save).to be_falsey
      end
    end
  end
end
