class Dev < ActiveRecord::Base
  def freebies
    Freebie.where(dev_id: self.id)
  end

  def company
    freebies.map do |f|
      Company.find(f.company_id)
    end
  end

  def received_one?(item_name)
    item = self.freebies.filter do |f|
      f.item_name == item_name
    end
    item.length > 0  ? true : false
  end

  def give_away(dev, freebie) 
    freebie_list = self.freebies
    if freebie_list.length > 0
      if freebie_list.filter {|f| f.item_name == freebie.item_name}.length > 0
        freebie.dev_id = dev.id
        freebie.save
      end
    end
  end
      
end
