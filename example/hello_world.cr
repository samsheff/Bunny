require "./deps/frank/frank"
require "../src/bunny"

get "/" do
  title = "Bunny"

  Bunny.new.parse("./view/index.bun", { "title" => title })
end
