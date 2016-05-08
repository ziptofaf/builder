module MakerHelper

  def arrayToTextPC(array)
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

  def findCompatibleGPUs(gpus, performance_needed)
    new_gpus = Array.new
    gpus.each do |gpu|
      new_gpus.push(gpu) if gpu.cpu_average <= performance_needed
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
  def BuildAStandardPCInDollars(budget, size=3)
    build = [0,0,0,0,0,0,0,0,0]
    prebuilt = Prebuilt.where("type_build = ? and size = ? and price between ? and ?", 1, size, budget-20, budget).order(price: :desc).first
    if (prebuilt)
      if (Time.now - prebuilt.updated_at < 2.days)
        return prebuiltToArray(prebuilt)
      end
    else
      prebuilt=Prebuilt.new
      prebuilt.type_build = 1
      prebuilt.size = size
    end

    cpus = Processor.where("dollar_price > 0").to_a
    mobos = Motherboard.where("dollar_price > 0 and size<=?", size).to_a
    gpus = Graphic.where("size<=?", size).to_a
    rams = Memory.where("dollar_price > 0").to_a
    drives = Drive.where("dollar_price > 0").to_a
    psus = PowerSupply.where("dollar_price > 0").to_a
    cases = ComputerCase.where("dollar_price > 0").to_a

      cpus.each do |cpu|
      budget1 = budget-cpu.dollar_price
      next if budget1<0

      findCompatibleMobos(mobos, cpu.platform_id).each do |mobo|
        budget2 = budget1 - mobo.dollar_price
        next if budget2<0
        findCompatibleGPUs(gpus, cpu.average).each do |gpu|
          budget3 = budget2 - gpu.dollar_price
          next if budget3<0
          findCompatibleRAM(rams, mobo.memory, mobo.ram_slots).each do |ram|
            budget4 = budget3 - ram.dollar_price
            next if budget4<0
            drives.each do |drive|
              budget5 = budget4 - drive.dollar_price
              next if budget5<0
              tdp = cpu.power + gpu.power
              findCompatiblePSU(psus, tdp).each do |psu|
                budget6 = budget5-psu.dollar_price
                next if budget6 < 0
                if size!=3
                  computerCases =  findCompatibleCase(cases, size, true)
                else
                  computerCases =  findCompatibleCase(cases, 3, false)
                end
                computerCases.each do |pc_case|
                  budget7 = budget6-pc_case.dollar_price
                  next if budget7 < 0
                  performance = 5*cpu.average + 3* mobo.score + 10 * gpu.performance + 3* ram.score + 2* pc_case.performance + 3 * drive.performance + 5*psu.performance
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
    prebuilt.price = build[8]
    prebuilt.performance=build[7]
    prebuilt.partlist = "#{build[0]},#{build[1]},#{build[2]},#{build[3]},#{build[4]},#{build[5]},#{build[6]}"
    prebuilt.updated_at=Time.now #this line is hopefully useless but it seems that there were some weird issues when i removed it in dev environment
    prebuilt.save
    return build
  end

end
