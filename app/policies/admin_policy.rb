class AdminPolicy
    def initialize(user)
        @user = user
        
    end

    def index? 
        return false unless @user  
        @user.user_role == "admin"
    end
    def user_management? 
        return false unless @user  
        @user.user_role == "admin"
    end
    def activity? 
        return false unless @user  
        @user.user_role == "admin"
    end


    private

    def admin?
        @user.user_role == "admin"
    end

end
