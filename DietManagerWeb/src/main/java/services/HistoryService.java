package services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import pojo.UserFoodDetails;

@Path("/History")
public class HistoryService {
	
		@GET
		@Path("/All")
		@Produces(MediaType.APPLICATION_JSON)
		public List<UserFoodDetails> getDietHistory(@Context HttpServletRequest request) throws Exception{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection = null;
			List<UserFoodDetails> list = new ArrayList<UserFoodDetails>();
			try {
				connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TESTDB","TEST");
				String query = " select fooditem, calories, plandate from user_food_db where username=? order by plandate desc";
				PreparedStatement preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, request.getUserPrincipal().getName());
				ResultSet result = preparedStatement.executeQuery();
				UserFoodDetails item = null;
				while(result.next()){
					item = new UserFoodDetails();
					item.setFoodItem(result.getString(1));
					item.setCalories(result.getString(2));
					item.setPlandate(result.getString(3));
					list.add(item);
				}
			} catch (SQLException e) {
				System.out.println("Connection Failed! Check output console");
				e.printStackTrace();
				return null;
			} finally {
				connection.close();
			}
			return list;
		}
}

