  module GenerateRandomNumber
    extend ActiveSupport::Concern
    def generate_random_number
      identifier_method = self.class.column_names.include?('registration') ? :registration : :indentifier
      number_generate = random_number
      
      while self.class.exists?(identifier_method => number_generate)
        number_generate = random_number
      end
      
      self.assign_attributes(identifier_method => number_generate)
    end

    def random_number
      prefix = respond_to?(:identifier_prefix) ? identifier_prefix : ''
      "#{prefix}#{rand(0..1000000)}"
    end
  end
