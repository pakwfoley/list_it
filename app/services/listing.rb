class Listing
  attr_reader :session

  def initialize(session)
    @session = session
  end

  def companies
    client.get("companies")
  end

  def client
    @client ||= Procore::Client.new(
      client_id: ENV.fetch("CLIENT_ID"),
      client_secret: ENV.fetch("CLIENT_SECRET"),
      store: store)
  end

  def store
    @store ||= Procore::Auth::Stores::Session.new(session: session)
  end
end
