module PdfHelper
  class ReportPdf < Prawn::Document
    def initialize(build, currency)
      super()
      @build = build
      @currency = currency
      table_content
    end


    def table_content
      if @currency == 1
      table([  ["Partname", "Price", "URL"], [@build.processor.name, getValidCurrency(@build.processor, @currency), @build.processor.link],
      [@build.graphic.name, getValidCurrency(@build.graphic,@currency), @build.graphic.link],
      [@build.motherboard.name, getValidCurrency(@build.motherboard, @currency), @build.motherboard.link], [@build.memory.name, getValidCurrency(@build.memory, @currency), @build.memory.link],
      [@build.drive.name, getValidCurrency(@build.drive, @currency), @build.drive.link], [@build.power_supply.name, getValidCurrency(@build.power_supply, @currency), @build.power_supply.link],
      ["Computer case", getValidCurrency(@build.computer_case, @currency) +" (estimated)", ""], ["Total", "$"+sprintf("%.02f", @build.real_price) + "", ""] ] )
      else
        table([  ["Partname", "Price", "URL"], [@build.processor.name, getValidCurrency(@build.processor, @currency), @build.processor.link],
        [@build.graphic.name, getValidCurrency(@build.graphic,@currency), @build.graphic.link],
        [@build.motherboard.name, getValidCurrency(@build.motherboard, @currency), @build.motherboard.link], [@build.memory.name, getValidCurrency(@build.memory, @currency), @build.memory.link],
        [@build.drive.name, getValidCurrency(@build.drive, @currency), @build.drive.link], [@build.power_supply.name, getValidCurrency(@build.power_supply, @currency), @build.power_supply.link],
        ["Computer case", getValidCurrency(@build.computer_case, @currency) +" (estimated)", ""], ["Total", sprintf("%.02f", @build.real_price) + "€", ""] ] )
      end
      if (@build.motherboard.platform.name == "1151OC" or @build.motherboard.platform.name == "X99")
        text "\nRemember that you will also need a cooler for your CPU! Check this link for details: "
      end
    end

    def product_rows
      [['#', 'Name', 'Price']] +
        @build.map do |build|
        [build.id, build.processor.name, build.graphics.name]
      end
    end

    def getValidCurrency(thing, currency)
      if currency==1
        return "$" + (sprintf "%.02f", thing.dollar_price)
      end
      if currency==2
        return (sprintf "%.02f", thing.euro_price)+"€"
      end
    end

  end
end
