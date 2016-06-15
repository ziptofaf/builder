module PriceHelper
require 'mechanize'

def getPrice
  if self.link.nil? or self.link.empty?
    if self.dollar_price.nil?
      self.dollar_price = -1.00
      self.euro_price = -1.00
    else
      return
    end
  else
    prices = fetchPrices(self.link.dup)
    self.dollar_price = prices[0]
    self.euro_price = prices[1]
  end
end


  def fetchPrices(address)
    sleep(1.5) #i dont want to abuse pcpartpicker
    agent = Mechanize.new
    begin
      page = agent.get(address)
      list = page.search(".total a")
      if list.length > 0
        price = list[0].text.gsub(/[$€+£]/, '').to_f
        dollar_price = price
      else
        dollar_price = -1.00
      end
      address["pcpartpicker.com"]="de.pcpartpicker.com"
      agent = Mechanize.new
      page = agent.get(address)
      list = page.search(".total a")
      if list.length > 0
        price = list[0].text.gsub(/[$€+£]/, '').to_f
        euro_price = price
      else
        euro_price = -1.00
      end
      return [dollar_price, euro_price]
    rescue
      return [-1.00, -1.00]
    end
  end

def getValidURL(url, currency)
  return url if currency==1
  url = url.gsub('pcpartpicker.com', 'de.pcpartpicker.com')
  return url
end

def getValidCurrency(thing, currency)
  if currency==1
    return "$" + (sprintf "%.02f", thing.dollar_price)
  end
  if currency==2
    return (sprintf "%.02f", thing.euro_price)+"€"
  end
end

def totalWithCurrency(value, currency)
  if currency==1
    return "$" + (sprintf "%.02f", value)

  end
  if currency==2
    return (sprintf "%.02f", value)+"€"
  end
end

end
