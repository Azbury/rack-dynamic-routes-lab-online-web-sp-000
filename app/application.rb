class Application
  def call (env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      search_item = req.path.split("/items/").last
      if Item.item_names.include?(search_item)
        resp.write "#{Item.all {|item| item.price if item.name == search_item}}"
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
