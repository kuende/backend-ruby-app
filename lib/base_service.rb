class BaseService
  include Contracts
  
  def self.perform(*payload)
    new(*payload).perform
  end
end
