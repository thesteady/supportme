module Client
  def connection
    @connection ||= Faraday.new("http://localhost:3000")
  end

  def post(path, data)
    response = connection.post(path, data)
    JSON.parse(response.body)
  end

  def get(path)
    response = connection.get(path)
    JSON.parse(response.body)
  end

  def put(path, data)
    response = connection.put(path, data)
    JSON.parse(response.body)
  end
end
