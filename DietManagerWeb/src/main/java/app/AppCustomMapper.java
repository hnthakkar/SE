package app;


import org.codehaus.jackson.map.AnnotationIntrospector;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializationConfig;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
import org.codehaus.jackson.map.introspect.JacksonAnnotationIntrospector;
import org.codehaus.jackson.xc.JaxbAnnotationIntrospector;

public class AppCustomMapper {
	
    private static AppCustomMapper SINGLETON = new AppCustomMapper();
    private ObjectMapper objectMapper;
    
	private AppCustomMapper(){
		init();
	}
	
	
	private void init(){
		objectMapper = new ObjectMapper();
		AnnotationIntrospector primary = new JacksonAnnotationIntrospector();
		AnnotationIntrospector secondary = new JaxbAnnotationIntrospector();
		AnnotationIntrospector pair = new AnnotationIntrospector.Pair(primary, secondary);
		objectMapper.getDeserializationConfig().withAnnotationIntrospector(pair);
		objectMapper.getSerializationConfig().withAnnotationIntrospector(pair);
		objectMapper.getSerializationConfig().withSerializationInclusion(Inclusion.NON_NULL);
		objectMapper.configure(SerializationConfig.Feature.WRITE_DATES_AS_TIMESTAMPS, false);
	}
	
	public static AppCustomMapper getInstance(){
		return SINGLETON;
	}
	
	public ObjectMapper getObjectMapper() {
        return objectMapper;
	}

}
