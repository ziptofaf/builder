module MakerHelper

  MINIITX = 1
  MICROATX = 2
  ATX = 3

  DOLLAR = 1
  EURO = 2

  GAMING = 1
  WORKSTATION = 2
  CUSTOM = 3
  # makes whole thing way more readable

  def arrayToTextPC(array)
    if array[0]==0
      puts "Something went wrong. Maybe you entered budget that is too low?"
      return
    end
    cpu = Processor.find(array[0])
    mobo = Motherboard.find(array[1])
    gpu = Graphic.find(array[2])
    ram = Memory.find(array[3])
    drive = Drive.find(array[4])
    psu = PowerSupply.find(array[5])
    chassis = ComputerCase.find(array[6])
    puts "#{cpu.name}, #{mobo.name}, #{gpu.name}, #{ram.name}, #{drive.name}, #{psu.name}, #{chassis.name}"

  end
  def findCompatibleRAM(rams, type, sticks)

    new_rams = Array.new
    rams.each do |ram|
      if (ram.ram_type == type and ram.sticks <= sticks)
      new_rams.push(ram)
      end
    end
    return new_rams
  end

  def findCompatiblePSU(psus, wattage)
    new_psus = Array.new
    psus.each do |psu|
      new_psus.push(psu) if psu.power >= wattage
    end
    return new_psus
  end

  def findCompatibleCase(cases, max_size, only_size=false)
    new_cases = Array.new
    if only_size
      cases.each do |pc_case|
        new_cases.push(pc_case) if pc_case.size == max_size
      end
      return new_cases;
    else
      cases.each do |pc_case|
        new_cases.push(pc_case) if pc_case.size >= max_size
      end
      return new_cases;
    end
  end


  def findCompatibleMobos(mobos, platform)
    new_mobos = Array.new
    mobos.each do |mobo|
      new_mobos.push(mobo) if mobo.platform_id==platform
    end
    return new_mobos
  end

  def findCompatibleGPUs(gpus, performance_needed, igpu_id=0, currency = 0)
    new_gpus = Array.new
    if currency == 0
      gpus.each do |gpu|
        new_gpus.push(gpu) if (gpu.cpu_average <= performance_needed and gpu.dollar_price > 0) or gpu.id == igpu_id

      end
    else
      gpus.each do |gpu|
        new_gpus.push(gpu) if gpu.cpu_average <= performance_needed and gpu.euro_price > 0
        new_gpus.push(gpu) if gpu.id == igpu_id
      end
    end
    return new_gpus
  end
  def prebuiltToArray(prebuilt)
    resultingpc=Array.new
    parts = prebuilt.partlist.split(',')
    parts.each do |part|
      p1 = part.to_i
      resultingpc.push(p1)
    end
    resultingpc.push(prebuilt.performance.to_f.round(2))
    resultingpc.push(prebuilt.price.to_f.round(2))
    return resultingpc
  end
  def fetchAllParts(budget, currency=DOLLAR, size = ATX, type = GAMING)
    amd_apu = Platform.find_by name: "FM2+"
    intel_enthusiast = Platform.find_by name: "X99"
    intel_1151 = Platform.find_by name: "1151"
    intel_1151_oc = Platform.find_by name: "1151OC"
    if currency == DOLLAR
      query = "dollar_price"
    else
      query = "euro_price"
    end
    case budget
      when 0..170
        raise InsufficientBudgetException
      when 171..310
        cpus = Processor.where("#{query} > ? and #{query} < ? and (platform_id = #{amd_apu.id} or platform_id = #{intel_1151.id}) ", 0, 100).to_a
        mobos = Motherboard.where("#{query} > 0 and size<=? and #{query} < ? and (platform_id = #{amd_apu.id} or platform_id = #{intel_1151.id})", size, 65).to_a
        gpus = Graphic.where("size<=? and (#{query} between ? and ? or #{query} = 0)", size, 0, 150).to_a
        rams = Memory.where("#{query} between ? and ?", 0, 70).to_a
        drives = Drive.where("#{query} between ? and ?", 0, 65).to_a
        psus = PowerSupply.where("#{query} between ? and ?", 20, 50).to_a
        cases = ComputerCase.where("#{query} between ? and ?", 0, 40).to_a
      when 311..600
        if type == GAMING
          cpus = Processor.where("#{query} > ? and #{query} < ? and platform_id = #{intel_1151.id}", 55, 225).to_a #
          gpus = Graphic.where("size<=? and (#{query} between ? and ? or #{query} = 0)", size, 80, 250).to_a
        else
          cpus = Processor.where("#{query} > ? and #{query} < ? and platform_id = #{intel_1151.id}", 80, 300).to_a
          gpus = Graphic.where("size<=? and (#{query} between ? and ? or #{query} = 0)", size, 60, 220).to_a
        end
        mobos = Motherboard.where("#{query} > 0 and size<=? and #{query} < ? and platform_id = #{intel_1151.id}", size, 90).to_a
        rams = Memory.where("#{query} between ? and ? and ram_type = 2", 0, 80).to_a
        drives = Drive.where("#{query} between ? and ?", 0, 110).to_a
        psus = PowerSupply.where("#{query} between ? and ?", 30, 60).to_a
        cases = ComputerCase.where("#{query} between ? and ?", 0, 65).to_a

      when 601..900
        if type == GAMING
          cpus = Processor.where("#{query} > ? and #{query} < ?", 105, 270).to_a
          gpus = Graphic.where("size<=? and (#{query} between ? and ? or #{query} = 0)", size, 128, 370).to_a
        else
          cpus = Processor.where("#{query} > ? and #{query} < ?", 130, 315).to_a
          gpus = Graphic.where("size<=? and (#{query} between ? and ? or #{query} = 0)", size, 90, 340).to_a
        end
        mobos = Motherboard.where("#{query} > 0 and size<=? and #{query} < ? and platform_id > #{amd_apu.id}", size, 150).to_a
        rams = Memory.where("#{query} between ? and ? and ram_type = 2", 30, 105).to_a
        drives = Drive.where("#{query} between ? and ?", 20, 110).to_a
        psus = PowerSupply.where("#{query} between ? and ?", 45, 80).to_a
        cases = ComputerCase.where("#{query} between ? and ?", 0, 65).to_a

      when 901..1300
        if type == GAMING
          cpus = Processor.where("#{query} > ? and #{query} < ?", 175, 400).to_a
          gpus = Graphic.where("size<=? and (#{query} between ? and ? or #{query} = 0)", size, 200, 640).to_a
        else
          cpus = Processor.where("#{query} > ? and #{query} < ?", 220, 500).to_a
          gpus = Graphic.where("size<=? and (#{query} between ? and ? or #{query} = 0)", size, 170, 550).to_a
        end
        mobos = Motherboard.where("#{query} > ? and size<=? and #{query} < ? and (platform_id = #{intel_1151.id} or platform_id = #{intel_1151_oc.id} or platform_id = #{intel_enthusiast.id})", 60, size, 230).to_a
        rams = Memory.where("#{query} between ? and ? and ram_type = 2", 24, 125).to_a
        drives = Drive.where("#{query} between ? and ?", 35, 150).to_a
        psus = PowerSupply.where("#{query} between ? and ?", 75, 105).to_a
        cases = ComputerCase.where("#{query} between ? and ?", 10, 100).to_a

      else
        cpus = Processor.where("average >= ? and (platform_id = #{intel_1151_oc.id} or platform_id= #{intel_enthusiast.id})", 70).to_a
        mobos = Motherboard.where("size<=? and score >= ?", size, 50).to_a
        gpus = Graphic.where("size<=? and performance >= ?", size, 65).to_a
        rams = Memory.where("score >= ? and ram_type = 2", 50).to_a
        drives = Drive.where("performance >= ?", 70).to_a
        psus = PowerSupply.where("performance >= ?", 85).to_a
        cases = ComputerCase.where("#{query} between ? and ?", 20, 400).to_a


    end
    if Rails.env.development?
    end
    return {:cpus => cpus, :mobos => mobos, :gpus=> gpus, :rams=>rams, :drives=>drives, :psus=>psus, :cases=>cases}#,coolers]
  end

  def buildAPC(budget, size=ATX, type=GAMING, currency=DOLLAR, custom_weights=[1,1,1,1,1,1,1,1])
    build = [0,0,0,0,0,0,0,0,0,0]
    if type == GAMING
      weights = [6, 1, 9, 1, 1, 1, 1.5, 1] #cpu, mobo, gpu, ram, drive, case, psu, cooler
    else
      if type == WORKSTATION
        weights = [9,3,5,4,2,4,5,1]
      else # type = CUSTOM
        weights = custom_weights
      end
    end

    if type <= WORKSTATION
      prebuilt = Prebuilt.where("type_build = ? and size = ? and price between ? and ? and currency = ?", type, size, budget-35, budget, currency).order(price: :desc).first
      if (prebuilt)
        if (Time.now - prebuilt.updated_at < 2.days)
          return prebuiltToArray(prebuilt)
        end
      else
        prebuilt = Prebuilt.new
        prebuilt.type_build = type
        prebuilt.currency = currency
        prebuilt.size = size
      end
    end
      begin
      local_db = fetchAllParts(budget, currency, size, type)
      rescue
        return build
      end
      #and now the gigamethod
      if currency == DOLLAR
        query = "dollar_price"
      else
        query = "euro_price"
      end
      local_db[:cpus].each do |cpu|

      budget1 = eval "budget-cpu.#{query}"
      next if budget1<0

      findCompatibleMobos(local_db[:mobos], cpu.platform_id).each do |mobo|
        budget2 = eval "budget1-mobo.#{query}"
        next if budget2<0
        findCompatibleGPUs(local_db[:gpus], cpu.average, cpu.iGPU).each do |gpu|
          budget3 = eval "budget2-gpu.#{query}"
          next if budget3<0
          findCompatibleRAM(local_db[:rams], mobo.memory, mobo.ram_slots).each do |ram|
            budget4 = eval "budget3-ram.#{query}"
            next if budget4<0
            local_db[:drives].each do |drive|
              budget5 = eval "budget4-drive.#{query}"
              next if budget5<0
              tdp = cpu.power + gpu.power
              findCompatiblePSU(local_db[:psus], tdp).each do |psu|
                budget6 = eval "budget5-psu.#{query}"
                next if budget6 < 0
                if size!=3
                  computerCases =  findCompatibleCase(local_db[:cases], size, true)
                else
                  computerCases =  findCompatibleCase(local_db[:cases], 3, false)
                end
                computerCases.each do |pc_case|
                  budget7 = eval "budget6-pc_case.#{query}"
                  next if budget7 < 0
                  #cpu, mobo, gpu, ram, drive, case, psu, cooler
                  performance = weights[0]*cpu.average + weights[1] * mobo.score + weights[2] * gpu.performance + weights[3]* ram.score + weights[5]* pc_case.performance + weights[4] * drive.performance + weights[6]*psu.performance
                  if performance > build[7]
                    build[0]=cpu.id
                    build[1]=mobo.id
                    build[2]=gpu.id
                    build[3]=ram.id
                    build[4]=drive.id
                    build[5]=psu.id
                    build[6]=pc_case.id
                    build[7]=performance.to_f.round(2)
                    build[8]=(budget-budget7).to_f.round(2)
                  end
                end
              end
            end
          end
        end
      end
    end
    if build[0]!=0
      prebuilt.price = build[8]
      prebuilt.performance=build[7]
      prebuilt.partlist = "#{build[0]},#{build[1]},#{build[2]},#{build[3]},#{build[4]},#{build[5]},#{build[6]}"
      prebuilt.updated_at=Time.now #this line is hopefully useless but it seems that there were some weird issues when i removed it in dev environment
      prebuilt.save
    end
    return build

  end

end
