class Sanitize
  module Config
    USER = {
      :elements => %w[
        p a
      ],

      :attributes => {
        'a' => ['href']
      },

      :add_attributes => {
        'a' => {'rel' => 'nofollow'}
      },

      :protocols => {
        'a' => {'href' => ['http', 'https', :relative]}
      }
    }
  end
end