package surface_water;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

public class ObjectUtil {

	public static Map<String, Object> getProperty(Object obj) throws IntrospectionException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		if(obj == null)    
            return null;        
     
        Map<String, Object> map = new HashMap<String, Object>();     
     
        BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());      
        PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();     
        for (PropertyDescriptor property : propertyDescriptors) {      
            String key = property.getName();      
            if (key.compareToIgnoreCase("class") == 0) {     
                continue;
            }    
            Method getter = property.getReadMethod();    
            Object value = getter!=null ? getter.invoke(obj) : null;    
            map.put(key, value);    
        }          
        return map; 
	}

	
}
