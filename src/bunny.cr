require "file"
require "string_scanner"

class Bunny
  def parse(view_path, locals)
    output_html = ""
    File.each_line(view_path) do |line|
      scanner = StringScanner.new(line)
      str = scanner.scan(/.+<%= .+ %>.+/)
      puts str
      if str
        str = str.replace(/.+<%=\s/, "").replace(/\s%>.+/,"")
      end

      if locals.has_key? str
        local = locals[str]

        line = line.replace(/<%= .+ %>/, local)
      end

      output_html += line
    end
    
    return output_html
  end
end
