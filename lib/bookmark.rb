require 'pg'

class Bookmark
  def self.all
    if ENV['RACK_ENV'] = 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end  
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end

  # def self.add
  #   connection = PG.connect(dbname: 'bookmark_manager')
  #   result = connection.exec("INSERT INTO bookmarks (url) VALUES")
  #   result.map { |bookmark| bookmark['url'] }
  # end
end
