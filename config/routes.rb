Rails.application.routes.draw do
  root to: 'posts#index'
  post 'posts', to: 'posts#create'
  get 'posts/:id', to: 'posts#checked'
end

def checked
  post = Post.find(params[:id])
  if post.checked 
    post.update(checked: false)
  else
    post.update(checked: true)
  end

  item = Post.find(params[:id])
  render json: { post: item }
end
