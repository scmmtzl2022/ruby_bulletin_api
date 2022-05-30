class PostsController < ApplicationController
  # before_action :authorized, except: [:list]

  # POST LIST FOR ADMIN TYPE
  def list
    result = Post::Operation::Index.(params: params)
    render json: result[:model]
  end

  # POST LIST FOR USER TYPE
  def list_user
    result  = Post::Operation::Index_User.(params: params)
    render json: result[:model]
  end
  # POST EDIT CONFIRM
  def edit
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    if !@post.valid?
      render json: @post.errors, status: 422
    else
      Post::Operation::Update::Present.(params: params)    
    end
  end
  # POST EDIT
  def update
    result = Post::Operation::Update.(params: params)
    render json: {noti: "Post Successfully updated"}
  end

  # POST CREATE CONFIRM
  def confirm
    result = Post::Operation::Create::Confirm.(params: params)
    if result["result.notify"]
      return render json: {data: 'pass'}
    else
      render json: result["contract.default"].errors[:title], status: 422
    end
  end

  # POST CREATE
  def create
    Post::Operation::Create.(params: params)
    render json: {noti: "Post Successfully created"}, status: 201
  end

  # POST INFO
  def details
    result = Post::Operation::Update::Detail.(params: params)
    render json: result[:model]
  end
  
  # POST SOFT DELETE
  def delete
    result = Post::Operation::Update::Delete.(params: params)
    render json: result
  end
  
end
