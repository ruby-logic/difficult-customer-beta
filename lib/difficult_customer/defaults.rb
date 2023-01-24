# Gem namespace
module DifficultCustomer
  # This class provices defaults for each message priority.
  class Defaults

    def low
      {
        'priority' => 'low',
        'appearance' => 'banner',
        'position' => 'bottom',
        'color' => 'yellow',
        'text' => 'This gem is not configured properly.',
        'frequency' => 'after-sign-in'
      }
    end

    def medium
      {
        'priority' => 'medium',
        'appearance' => 'alert',
        'color' => 'orange',
        'text' => 'This gem is not configured properly.',
        'frequency' => 'every-10-requests'
      }
    end

    def high
      {
        'priority' => 'high',
        'appearance' => 'page',
        'color' => 'red',
        'text' => 'This gem is not configured properly.',
        'frequency' => 'every-2-requests'
      }
    end

  end
end
