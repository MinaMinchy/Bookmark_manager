require 'pg'

class Bookmark

  def self.all
    # @bookmark_array =[]
    if ENV['RACK_ENV'] == 'test'
    connection = PG.connect(dbname: 'bookmark_manager_test' )
   else
    connection = PG.connect(dbname: 'bookmark_manager' )
   end
    # conn.exec( "SELECT * FROM bookmarks" ) do |result|
    #     result.each do |row|
    #     @bookmark_array << row.values_at('url')[0]

    bookmarks = connection.exec('SELECT * FROM bookmarks;')
    bookmarks.map { |bookmark| bookmark['url'] }
      end

  #   @bookmark_array
  # end



  def self.create(url:)

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test' )
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
end
end
