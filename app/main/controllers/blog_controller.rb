class BlogController < ModelController

  def index
    self.model = :store #make the store the default model so we can call _posts directly
    page._new = store._posts.buffer #creates a buffer from model _posts
  end

  def edit
    store._posts.find(_id: params._id).then do |result|
      self.model = result[0].buffer # find currently returns a collection, we need the first one
    end
  end

  def save
    model.save!.then do
      go '/blog'
    end
  end

  def ajax_save
    res = page._new.save!.then do
      page._new = store._posts.buffer #creates a buffer from model _posts
      flash._notices << "added posting successfully"
    end.fail do |val|
      flash._notices << "new posting unsuccessfull #{val.inspect}"
    end

  end
end