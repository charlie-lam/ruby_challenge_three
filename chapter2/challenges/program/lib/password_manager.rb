class PasswordManager
    def initialize 
        @store = {}
    end
    def add(service, password)
        if(password.length >= 8 && (password.include?("!") || password.include?("@") || password.include?("$") || password.include?("%") || password.include?("&")))
            @store[service] = password
        end
    end
    def password_for(service) 
        @store[service]
    end
    def services
        @store.keys
    end
end

my_manager = PasswordManager.new
my_manager.add("Netflix", "Pass123$")
my_manager.add("Slack", "Secret123@")
puts my_manager.password_for("Netflix")
puts my_manager.services

new_manager = PasswordManager.new
new_manager.add("Github", "Password123$")
puts new_manager.services

