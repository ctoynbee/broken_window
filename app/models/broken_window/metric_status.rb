module BrokenWindow
  class MetricStatus
    NAMES = [:fail, :unknown, :pass]

    class << self
      def pass
        new(:pass)
      end

      def unknown
        new(:unknown)
      end

      def fail
        new(:fail)
      end

      def combine(states)
        states.min
      end
    end

    attr_reader :value

    def initialize(name)
      @value = NAMES.index(name)
    end

    def to_s
      NAMES[@value].to_s
    end

    def <=>(other)
      value <=> other.value
    end
  end
end