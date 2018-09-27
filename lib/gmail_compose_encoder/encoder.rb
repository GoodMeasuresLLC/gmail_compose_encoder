require 'base64'
module GmailComposeEncoder

FULL_ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
RESTRICTED_ALPHABET = 'BCDFGHJKLMNPQRSTVWXZbcdfghjklmnpqrstvwxz';
THREAD_PREFIX = 'thread-';
MESSAGE_PREFIX = 'msg-';

  # for whatever reason, google choose to Base64.encode64 the string, and then further
  # map it into a restricted alphabet with no vowels or numbers.
  def self.encode(url_parameter)
    transliterate(Base64.strict_encode64(url_parameter.gsub(THREAD_PREFIX,'')).gsub(/=/,''), FULL_ALPHABET, RESTRICTED_ALPHABET)
  end

  def self.transliterate(string, input_alphabet=FULL_ALPHABET, output_alphabet=RESTRICTED_ALPHABET)
    string_indices = string.chars.reverse.map {|char| input_alphabet.index(char)}
    # string_indices.each {|xxx| puts "inputIndices #{xxx}"}
    result_indices = []
    string_indices.reverse.each_with_index do |string_index,iii|
      offset=0
      result_indices.each.with_index do |result_index,j|
        index = result_index * input_alphabet.size + offset
        if(index >=input_alphabet.size)
          remainder = index % output_alphabet.size
          offset = (index - remainder) / output_alphabet.size
          index=remainder
        else
          offset = 0
        end
        result_indices[j]=index
      end
      while(!offset.zero?)
        remainder = offset % output_alphabet.size
        result_indices.push(remainder)
        offset = (offset - remainder) / output_alphabet.size
      end
      jjj=0
      offset=string_index
      while(!offset.zero?)
        result_indices[jjj] = 0 if result_indices[jjj].nil?
        index = result_indices[jjj] + offset
        if(index >=output_alphabet.size)
          remainder = index % output_alphabet.size
          offset = (index - remainder) / output_alphabet.size
          result_indices[jjj]=remainder
        else
          offset=0
          result_indices[jjj]=index
        end
        jjj+=1
      end
    end

    result_indices.reverse.map {|idx| output_alphabet[idx]}.join
  end
end
