class JsonParse < ActiveModel::Validator 
  def validate(record) 
    options[:fields].each do |field| 
      begin 
        JSON.parse(record.send(field)) 
      rescue 
        record.errors[:base] << "#{field} does not successfully pass a JSON.parse" 
      end 
    end 
  end 
end

