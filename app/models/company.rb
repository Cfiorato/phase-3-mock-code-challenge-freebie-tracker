class Company < ActiveRecord::Base
  def freebies
    Freebie.where(company_id: self.id)
  end

  def devs
    freebies.map do |f|
      Dev.find(f.dev_id)
    end
  end

  def give_freebie(dev, item_name, value)
    Freebie.create(item_name: item_name, value: value, dev_id: dev.id, company_id: self.id)
  end

  def self.oldest_company
    self.order(:founding_year).limit(1)
  end

end
