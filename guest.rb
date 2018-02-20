class Guest
  def connect
    @conn = PG.connect(
        :dbname => 'template1',
        :user => 'postgres',
        :password => 'root')
  end
  def prepareInsertUserStatement
    @conn.prepare("insert_user", "insert into users ( name,mail,mobile,number) values ($1, $2,$3,$4)")
  end

  # Add a user with the prepared statement.
  def addUser(name,mail,mobile,number)
    @conn.exec_prepared("insert_user", [name,mail,mobile,number])
  end
  def disconnect
    @conn.close
  end

    def main
      p = PostgresDirect.new()
      p.connect
      begin
        p.prepareInsertUserStatement
        p.addUser("Marc","tre@gda.com",4567894356,5)

      end
      main

end
