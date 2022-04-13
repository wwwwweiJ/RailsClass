module Encoder
    module EncoderPassword
        def self.salted_string(str)
            chars = ["a" , "b" , "c" , "d" , "e" , "f"]
            part_a = str.chars[0..5].map.with_index{ |v , i| v + chars[i] }.join
            part_b = str.chars[6..].join
            "y#{part_a}#{part_b}z"
        end

        def self.encode_password(password)
            Digest::SHA1.hexdigest(salted_string(password))
        end
    end
end