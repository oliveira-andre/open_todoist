# frozen_string_literal: true

module Response
  def parsed_response
    JSON.parse(response.body)
  end
end
