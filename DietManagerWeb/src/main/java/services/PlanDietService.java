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
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import pojo.FoodItemDetail;

@Path("/PlanDiet")
public class PlanDietService {
	
		@GET
		@Path("/FoodList")
		@Produces(MediaType.APPLICATION_JSON)
		public List<FoodItemDetail> getFoodList(@Context HttpServletRequest request) throws Exception{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection = null;
			List<FoodItemDetail> list = new ArrayList<FoodItemDetail>();
			try {
				connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TESTDB","TEST");
				String query = " select * from FOOD_DB where addedby=? or addedby='superUser'";
				PreparedStatement preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, request.getUserPrincipal().getName());
				ResultSet result = preparedStatement.executeQuery();
				FoodItemDetail item = null;
				while(result.next()){
					item = new FoodItemDetail();
					item.setName(result.getString(1));
					item.setCalories(result.getString(2));
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
		
		@GET
		@Path("/AddToPlan/{foodItem}/{calories}")
		@Produces(MediaType.APPLICATION_JSON)
		public int addToPlan(@Context HttpServletRequest request, @PathParam("foodItem") String foodItem, @PathParam("calories") int calories) throws Exception{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection = null;
			try {
				String insertTableSQL = "insert into user_food_db (username, fooditem, calories) values (?,?,?)";
				connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TESTDB","TEST");
				PreparedStatement preparedStatement = connection.prepareStatement(insertTableSQL);
				preparedStatement.setString(1, request.getUserPrincipal().getName());
				preparedStatement.setString(2, foodItem);
				preparedStatement.setInt(3, calories);
				preparedStatement .executeUpdate();
			} catch (SQLException e) {
				System.out.println("Connection Failed! Check output console");
				e.printStackTrace();
				return 0;
			} finally {
				connection.close();
			}
			return 1;
		}
		
		@GET
		@Path("/removeFromPlan/{foodItem}")
		@Produces(MediaType.APPLICATION_JSON)
		public int removeFromPlan(@Context HttpServletRequest request, @PathParam("foodItem") String foodItem) throws Exception{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection = null;
			try {
				String insertTableSQL = "delete from (select * from user_food_db where USERNAME=? and fooditem=?) WHERE ROWNUM = 1";
				connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TESTDB","TEST");
				PreparedStatement preparedStatement = connection.prepareStatement(insertTableSQL);
				preparedStatement.setString(1, request.getUserPrincipal().getName());
				preparedStatement.setString(2, foodItem);
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
				//System.out.println("Connection Failed! Check output console");
				e.printStackTrace();
				return 0;
			} finally {
				connection.close();
			}
			return 1;
		}
		
		@GET
		@Path("/IntakeForToday/")
		@Produces(MediaType.APPLICATION_JSON)
		public int inTakeForday(@Context HttpServletRequest request) throws Exception{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection = null;
			int cal = 0;
			try {
				String insertTableSQL = "select sum(calories) from user_food_db where username = ? and to_date(plandate) = to_date(sysdate)";
				connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "TESTDB","TEST");
				PreparedStatement preparedStatement = connection.prepareStatement(insertTableSQL);
				preparedStatement.setString(1, request.getUserPrincipal().getName());
				ResultSet result = preparedStatement.executeQuery();
				while(result.next()){
					cal = result.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("Connection Failed! Check output console");
				e.printStackTrace();
				return 0;
			} finally {
				connection.close();
			}
			return cal;
		}
		
		@GET
		@Path("/Recommended/")
		@Produces(MediaType.APPLICATION_JSON)
		public int recommended(@Context HttpServletRequest request) throws Exception{
			int cal = 500;
			try {
				cal = (int)Math.floor((Math.random() * (2400 - 1500))) +1500;
			} catch (Exception e) {
				System.out.println("Connection Failed! Check output console");
				e.printStackTrace();
				return 0;
			} 
			return cal;
		}
		
		
}

