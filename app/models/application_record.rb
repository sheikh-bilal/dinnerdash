# frozen_string_literal: true

# calls abstract
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
