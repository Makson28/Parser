require 'json'

class SaveJson
  def saveToJson(file, data)
    File.open(file, "w") do |f|
        f.write(data.to_json)
    end
  end
end