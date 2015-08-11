require "lita"

Lita.load_locales Dir[File.expand_path(
  File.join("..", "..", "locales", "*.yml"), __FILE__
)]

require_relative "lita/message.rb"
require_relative "lita/response.rb"
require "lita/handlers/tell"

Lita::Handlers::Tell.template_root File.expand_path(
  File.join("..", "..", "templates"),
 __FILE__
)
