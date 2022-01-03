require 'nokogiri'
require 'json'
require 'csv'
require 'open-uri'
require_relative 'save_to_csv.rb'
require_relative 'save_to_json.rb'

class Create
  def create_goods(html)
      data = []
      doc = Nokogiri::HTML(html)
          doc.css(".s_item").each do |item|
          article = item.css('.article-in-list').map { |article| article.text.strip }
          name = item.css('.item_name').map{ |name| name.text.strip }
          price = item.css('.f_price').map { |price| price.text.strip }
          data.push(
              article: article.first,
              name: name.first,
              price: price.first
          )
      end
      return data
  end
end

class Goods
    url = 'https://allstars.ua/store/men/shoes/krossovki/'
    html = URI.open(url)

    create = Create.new
    data = create.create_goods(html)

    saveCSV = SaveCSV.new
    saveCSV.saveToCSV(File.join(File.dirname(__FILE__), "data.csv"), data)
    saveJson = SaveJson.new
    saveJson.saveToJson(File.join(File.dirname(__FILE__), "data.json"), data)
end
