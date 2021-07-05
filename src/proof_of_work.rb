require 'digest'

class ProofOfWork
    @@charset = Array('A'..'Z')+Array('a'..'z')+Array('0'..'9')
    @@string_size = ENV['STRING_SIZE'].to_i
    @@base_string = ENV['BASE_STRING']

    def initialize
        @limit_count = ENV['MAX_ATTEMPTS'].to_i
    end

    def perform(target)
        while @limit_count > 0
            string = generate_candidate
            hash = get_hash(string)
            if hash.include? target
                break
            end
            @limit_count -= 1
        end
        return hash, string
    end

    private
    def generate_candidate
        @@base_string+Array.new(@@string_size) { @@charset.sample }.join
    end

    def get_hash(string)
        Digest::SHA256.hexdigest(string)
    end
end
