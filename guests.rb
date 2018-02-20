class Guests
  begin

    con = PG.connect :dbname => 'template1', :user => 'postgres' , :password => 'root'

 con.exec "insert into Guest values ('ramesh','ram@gmail.com',2435674434,5)"

    end


  ensure

    con.close if con

  end
