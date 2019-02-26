require 'pg'

class Bookmark

  def self.all
    @bookmark_array =[]
    conn = PG.connect(dbname: 'bookmark_manager' )
    conn.exec( "SELECT * FROM bookmarks" ) do |result|
      result.each do |row|
        @bookmark_array << row.values_at('url')[0]
      end
    end
    @bookmark_array
  end
end
