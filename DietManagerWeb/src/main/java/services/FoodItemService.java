package services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

@Path("/FoodItem")
public class FoodItemService {
	
	@GET
	@Path("/Add/{name}/{calories}")
	@Produces(MediaType.APPLICATION_JSON)
	public int reportsAll(@Context HttpServletRequest request, @PathParam("name") String name, @PathParam("calories") int calories) throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection connection = null;
		try {
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TESTDB","TEST");
			String insertTableSQL = "INSERT INTO FOOD_DB"
					+ "(FOODNAME, CALORIES, ADDEDBY) VALUES"
					+ "(?,?,?)";
			
			PreparedStatement preparedStatement = connection.prepareStatement(insertTableSQL);
			preparedStatement.setString(1, name);
			preparedStatement.setInt(2, calories);
			preparedStatement.setString(3, request.getUserPrincipal().getName());
			
			preparedStatement .executeUpdate();
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