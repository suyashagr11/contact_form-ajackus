# frozen_string_literal: true

module ApplicationHelper
  def show_errors(object, field_name)
    return unless object.errors.any?

    return if object.errors.messages[field_name].blank?

    field_name.to_s.camelize + ' ' + object.errors.messages[field_name].join(', ')
  end
end
