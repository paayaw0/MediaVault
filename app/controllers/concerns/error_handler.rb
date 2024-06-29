module ErrorHandler
  extend ActiveSupport::Concern

  included do
    # rescue Standard Errors and log them
  end
end