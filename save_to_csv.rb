require 'csv'

class SaveCSV
    def saveToCSV(file, data)
      CSV.open(file, "w", :write_headers => true, :col_sep => "\t|\t", :headers => ["Article", "Name", "Price"]) do |csv|
          data.each{ |i|
            csv << i.values
          }
        end
    end
end