class DynamicRedirection < ApplicationRecord
    before_create :create_code_key

    def create_code_key
        generated_key = nil
        loop do
        generated_key = SecureRandom.hex

        key_value = DynamicRedirection.where(key_value: generated_key).first
        break if key_value.nil?
        end
        self.key_value = generated_key
    end
end
