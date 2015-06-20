package app;

import java.util.HashSet;
import java.util.Set;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;

import org.codehaus.jackson.jaxrs.JacksonJaxbJsonProvider;

import services.FoodItemService;
import services.HistoryService;
import services.PlanDietService;
import services.RegisterService;


@ApplicationPath("/rest")
public class DietManagerApplication extends Application{
	
	private Set<Class<?>> classes = new HashSet<Class<?>>();
	
	@Override
	public Set<Class<?>> getClasses() {
		classes.add(PlanDietService.class);
		classes.add(RegisterService.class);
		classes.add(FoodItemService.class);
		classes.add(HistoryService.class);
		return classes;
	}
	
	@Override
	public Set<Object> getSingletons() {
		 Set<Object> singletons = new HashSet<Object>();
		 JacksonJaxbJsonProvider jaxbProvider = new JacksonJaxbJsonProvider();
		 jaxbProvider.setMapper(AppCustomMapper.getInstance().getObjectMapper());
		 singletons.add(jaxbProvider);
	     return singletons;
	}

}
