class PostService
    def self.getPostById(id)
      @post = Post.find_by(id: id)
    end
  end