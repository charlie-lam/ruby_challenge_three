# Valid passowords are
# - 8 or more characters
# - include at least one of these characters: !, @, $, %, &

def valid?(password)
     # The function will need one if branch to check length of string is > 8 then child if branch that will contain multiple || operators to check special chars
     if(password.length >= 8)
        if(password.include?("!") || password.include?("@") || password.include?("$") || password.include?("%") || password.include?("&"))
            true
        else 
            false 
        end 
    else 
        false
    end

    # regex match would be my go to for the special character check but it hasn't been in the course so I left it
end
