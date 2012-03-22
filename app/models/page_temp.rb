class PageTemp < ActiveRecord::Base
	 private
    def randomize_file_name

      unless data_file_name.nil?
        extension = File.extname(data_file_name).downcase
        self.data.instance_write(:file_name, "#{ActiveSupport::SecureRandom.hex(16)}#{extension}")
      end
    end

	def validate  

		if temp_type=='主页' and is_acticity==true
        	 p = PageTemp.find(:all,:conditions=>"temp_type='主页' and is_acticity = true")
        	 if p and p[0].id != id
        	 	puts id
        	 	errors.add_to_base("主页模板只能生效一个")  
        	 end
      	end 
	end
end