module MakerHelper
  class ServerNotOnlineError < StandardError
  end
  class BudgetingIssueOrConnectionError < StandardError
  end
require 'open-uri'
  MINIITX = 1
  MICROATX = 2
  ATX = 3

  DOLLAR = 1
  EURO = 2

  GAMING = 1
  WORKSTATION = 2
  CUSTOM = 3
  # makes whole thing way more readable


  def queryForABuild(budget, currency = 1, size = 3, type = 1)
    begin
    link = "http://127.0.0.1:8888/?budget=#{budget}&currency=#{currency}&type=#{type}&size=#{size}"
    answer = open(link)
    rescue
      raise ServerNotOnlineError
    end
    answer = answer.string.split(',')
    raise BudgetingIssueOrConnectionError if answer[0]=='0'
    return answer
  end

  def savePrebuiltIntoDb(budget, currency, size, type, array, prebuilt=nil)
    if !prebuilt
      prebuilt = Prebuilt.new
    else
      prebuilt.updated_at = Time.now
    end
    prebuilt.currency = currency
    prebuilt.performance = array[0]
    prebuilt.real_price = array[1]
    prebuilt.price = budget
    prebuilt.size = size
    prebuilt.type_build = type
    prebuilt.processor_id = array[2]
    prebuilt.motherboard_id = array[3]
    prebuilt.graphic_id = array[4]
    prebuilt.memory_id = array[5]
    prebuilt.drive_id = array[6]
    prebuilt.power_supply_id = array[7]
    prebuilt.computer_case_id = array[8]
    prebuilt.save
    return prebuilt
  end

  def buildAPC(budget, currency = 1, size = 3, type = 1)
    prebuilt = Prebuilt.where("type_build = ? and size = ? and price between ? and ? and currency = ?", type, size, budget-10, budget+10, currency).order(performance: :desc).first
    if (prebuilt)
      if (Time.now - prebuilt.updated_at < 2.days)
        return prebuilt
      end
        query = queryForABuild(budget, currency, size, type)
      return savePrebuiltIntoDb(budget, currency, size, type, query, prebuilt)
    else
      query = queryForABuild(budget, currency, size, type)
      return savePrebuiltIntoDb(budget, currency, size, type, query)
    end
  end


end
