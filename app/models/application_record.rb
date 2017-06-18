class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def pretty_errors
    self.errors.full_messages.join(', ')
  end
end
