module Omnibar
  #
  # System Commands
  #
  # Interact with your system
  #
  class System < Query
    COMMANDS = {
      'sleep' => 'xset -display :0.0 dpms force off',
      'reboot' => 'reboot',
      'shutdown' => 'shutdown now',
      'power off' => 'shutdown now'
    }.freeze

    def result
      search.find(input)
    end

    def search
      @fz ||= FuzzyMatch.new(COMMANDS.keys)
    end

    def perform!
      puts COMMANDS[result]
    end
  end
end