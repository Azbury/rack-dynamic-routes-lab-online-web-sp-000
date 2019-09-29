class Application
  def call (env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      search_item = req.params["q"]
      if Items.all.include?(search_item)
        resp.write "#{Items.all {|item| item.price if item.name = search_item}}"
      else
        resp.write "Item not found"
        resp.status = 400
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
