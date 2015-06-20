package services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/Register")
public class RegisterService {
	
	@GET
	@Path("/User/{name}/{age}/{height}/{weight}/{gender}/{password}")
	@Produces(MediaType.APPLICATION_JSON)
	public int registerUser(@PathParam("name") String name, @PathParam("age") int age, @PathParam("height") int height, @PathParam("weight") int weight, @PathParam("gender") int gender, @PathParam("password") String password) throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection connection = null;

		try {

			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TESTDB","TEST");
			String insertTableSQL = "INSERT INTO USERS"
					+ "(USERNAME, PASSWORD, WEIGHT, HEIGHT, AGE, GENDER) VALUES"
					+ "(?,?,?,?,?,?)";
			
			String role = "INSERT INTO USER_ROLES"
					+ "(USERNAME, ROLE) VALUES"
					+ "(?,?)";
			
			PreparedStatement preparedStatement = connection.prepareStatement(insertTableSQL);
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, password);
			preparedStatement.setInt(3, weight);
			preparedStatement.setInt(4, height);
			preparedStatement.setInt(5, age);
			preparedStatement.setInt(6, gender);
			//preparedStatement.setTimestamp(4, getCurrentTimeStamp());
			// execute insert SQL stetement
			preparedStatement .executeUpdate();
			
			PreparedStatement preparedStatement2 = connection.prepareStatement(role);
			//preparedStatement2.setInt(1, 10);
			preparedStatement2.setString(1, name);
			preparedStatement2.setString(2, "ROLE_USER");
			preparedStatement2 .executeUpdate();
			/*Statement stats = connection.createStatement();
			ResultSet result = stats.executeQuery("Select * from tabs");
			System.out.println("JUSt");*/
		} catch (SQLException e) {
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			return 0;
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 1;

	}

}