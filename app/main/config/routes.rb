get "/about", _action: 'about'
get "/blog/new", _controller: 'blog', _action: 'new'
get "/blog/{_id}/edit", _controller: 'blog', _action: 'edit'
get "/blog", _controller: 'blog', _action: 'index'
# The main route
get '/'