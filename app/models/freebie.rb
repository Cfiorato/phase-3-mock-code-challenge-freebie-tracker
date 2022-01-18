class Freebie < ActiveRecord::Base
  def dev
    Dev.find(self.dev_id)
  end

  def company 
    Company.find(self.company_id)
  end

  def print_details
    dev = self.dev
    company = self.company
    "#{dev.name} owns a #{self.item_name} from #{company.name}"
  end
end
