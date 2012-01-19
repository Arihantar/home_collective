module BeginningRails
  module SimplySearchable
    
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def simply_searchable(options = {})
        class_inheritable_accessor :fields, :template
        
        raise "Please specify the fields to search on" unless options[:fields]
        
        self.fields   = options[:fields]
        self.template = options[:template]

        include SearchMethods
      end
      
      module SearchMethods
        def search
          # Initialize the conditions and values arrays
          conditions = []
          values = []
          
          # Filter the params to have only the specified fields
          searchable_fields = params.reject {|k,v| !self.fields.include?(k) }
          
          # Add each field to the conditions array
          searchable_fields.each_pair do |field, value|
            conditions << "#{field} LIKE ?"
            values << "%#{value}%"
          end
          
          # Get the model class name from the controller class name
          model_name = self.class.name.chomp('Controller').singularize

          # Create a variable named after the controller
          variable_name = "@#{self.controller_name.pluralize}" 

          if searchable_fields.any?
            # If there are conditions we add :conditions => conditions.join(' AND ')
            instance_eval <<-EOS
              @#{model_name.downcase}_pages, #{variable_name} = paginate(
                :#{model_name.pluralize.downcase},
                :conditions => [conditions.join(' AND '), *values],
                :per_page => 10
              )
            EOS
          else
            # If there are no conditions, just do a find(:all)
            instance_eval <<-EOS
              @#{model_name.downcase}_pages, #{variable_name} = paginate(
                :#{model_name.pluralize.downcase},
                :per_page => 10
              )
            EOS
          end

          if self.template
            render :template => self.template
          else
            render :action => 'index'
          end
        end
      end
    end
  end
end

