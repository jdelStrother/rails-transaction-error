class PostsController < ApplicationController
  def show
    @post = Post.find_by(id: params[:id])
    Post.connection.select_rows "select * from posts"

    # Uncomment for 'Cannot expire connection, it is not currently leased':
    # raise unless @post

    render inline: (@post&.title || 'not found')
  end
end
