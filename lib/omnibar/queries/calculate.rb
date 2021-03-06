module Omnibar
  class Calculate < Query
    include Math

    def result
      if value.is_a?(Integer)
        [sanitized_input, value].join(' = ')
      else
        value.to_s
      end
    end

    def value
      @value ||= eval('(' + sanitized_input + '.to_f).round(3)')
    rescue ZeroDivisionError
      'Division by zero is undefined'
    rescue Math::DomainError => e
      e.message
    rescue StandardError, SyntaxError
      nil
    end

    def perform!
      copy_to_clipboard value
    end

    def sanitized_input
      input
        .gsub(/(\D)\./, '\10.')
        .gsub('sleep', '')
        .gsub('exit', '')
    end

    def relevance
      !value.nil?
    end

    def pi
      PI
    end

    def e
      E
    end
  end
end

class Integer
  alias ^ **
end
