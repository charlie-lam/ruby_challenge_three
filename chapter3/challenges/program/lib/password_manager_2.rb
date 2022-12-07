require 'date'
class PasswordManager2
    # Start with an empty state
    def initialize
        @state = {}
    end
    # Split the add requirement so this method invalidates the password and is not already in the hash with if statements and maybe hash.values.include? password.
    def invalid_password(pass)
        @state.values.any?{|e| e["password"] == pass}
    end
    # Need to validate services as well
    def invalid_services(service)
        @state.keys.include?(service)
    end
    # The add method should add the service/password combo if the validate method returns true with normal hash appeneding. We will also need time now added.
    def add(service, password)
        if(invalid_password(password))
            "ERROR: Passwords must be unique"
        elsif(invalid_services(service))
            "ERROR: Service names must be unique"
        else  
            @state[service] = {"password" => password, "added_on" => Time.now()}
        end
    end
    # remove method to simply delete service entered, can use hash.delete 
    def remove(service)
        @state.delete(service)
    end
    # services method to show the current services in the state of password manager
    def services
        @state.keys
    end
    # Split up the sort method, this one will be the sort by services
    def service_sort
        @state.sort_by{|key, value| key}.to_h.keys
    end
    # this will be the added_on sort method
    def added_sort
        @state.sort_by{|key, value| value["added_on"]}.to_h.keys
    end
    # Bring the sort methods together based on argument
    def sort_by(arg)
        arg == "service" ? service_sort : added_sort
    end
    # Return password for service just by accsessing the hash with bracket notation
    def password_for(service)
        @state[service]["password"]
    end
    # Update password for service just using bracket notation as well, the validate method can be used again here
    def update(service, newPass)
        if(invalid_password(newPass))
            "ERROR: Passwords must be unique"
        else  
            @state[service] = {"password" => newPass, "added_on" => Time.now()}
        end
    end

end


my_manager = PasswordManager2.new
my_manager.add("MakersBnB", "password123$")
my_manager.add("Acebook", "superpassword123")
puts "Current services:"
puts my_manager.services
puts "New services after remove:"
my_manager.remove("Acebook")
puts my_manager.services
puts "Add back in Acebook"
my_manager.add("Acebook", "superpassword123")
puts "Services by service order:"
puts my_manager.sort_by("service")
puts "Service by time order:"
puts my_manager.sort_by("added_on")
puts "Password finder for Acebook:"
puts my_manager.password_for("Acebook")
puts "Now the new password for Acebook"
my_manager.update("Acebook", "newpass123")
puts my_manager.password_for("Acebook")

