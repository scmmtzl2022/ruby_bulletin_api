class UsersController < ApplicationController
    #before_action :authorized, only: [:auto_login]
    
    # USER LIST FOR ADMIN TYPE
    def list 
      result = User::Operation::List.(params: params)
      render json: result[:model]
    end
    # USER REGISTER CONFIRM
    def confirm
      result = User::Operation::Create::Confirm.(params: params)
      if result["result.notify"]
        return render json: {data: 'pass'}
      else
        render json: result["contract.default"].errors[:email], status: 422
      end
    end

    # USER REGISTER
    def create
      result = User::Operation::Create.(params:params)
      User::Operation::Create::Image.(params:params)
      render json: {noti: "Post Successfully created"}
    end  

    # LOGGING IN
    def login
      result = User::Operation::Login.(params: params)
      if result["error"]
        render json: result["error"], status: 401
      elsif
        token = encode_token({user_id: result["model"].id})
        render json: {user: result["model"], token: token}
      end
    end

  end