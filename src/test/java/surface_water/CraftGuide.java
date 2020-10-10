package surface_water;

import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.DatabaseMetaData;

public class CraftGuide {

    private static ApplicationContext context = null;  
    //通过测试类测试  
    public static void main(String[] args) {    
        context = new ClassPathXmlApplicationContext("spring-mybatis.xml");         
        Users user = new Users();    
        user.setUserName("liutengteng");    
        user.setUserPass("liutengteng");           
        int re = insertObject("users",user);    
        System.out.println("================" + re + "====================");    
    }   
    /** 
     * 创建表，添加记录 
     * @param tableName 
     * @param obj 
     * @return 
     */  
    public static int insertObject(String tableName,Object obj){    
        int re = 0;         
        try {    
            JdbcTemplate jt = (JdbcTemplate)context.getBean("jdbcTemplate");    
            SimpleDateFormat format = new SimpleDateFormat("yyyy_MM");              
            String tname = tableName + "_" + format.format(new Date());    
            // 判断数据库是否已经存在这个名称的表，如果有某表  则保存数据；否则动态创建表之后再保存数据  
            if(getAllTableName(jt,tname)){    
                re = saveObj(jt,tname,obj);    
            }else{    
                re = createTable(jt,tname,obj);    
                re = saveObj(jt,tname,obj);    
            }               
        } catch (Exception e) {    
            e.printStackTrace();    
        }           
        return re;    
    }   
    /**  
     * 根据表名称创建一张表  
     * @param tableName  
     * @throws IntrospectionException 
     * @throws InvocationTargetException 
     * @throws IllegalArgumentException 
     * @throws IllegalAccessException 
     */    
    public static int createTable(JdbcTemplate jt,String tableName,Object obj) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, IntrospectionException{    
        StringBuffer sb = new StringBuffer("");    
        sb.append("CREATE TABLE `" + tableName + "` (");    
        sb.append(" `id` int(11) NOT NULL AUTO_INCREMENT,");            
        Map<String, Object> map = ObjectUtil.getProperty(obj);    
        Set<String> set = map.keySet();    
        for(String key : set){    
            sb.append("`" + key + "` varchar(255) DEFAULT '',");    
        }           
        sb.append(" `tableName` varchar(255) DEFAULT '',");    
        sb.append(" PRIMARY KEY (`id`)");    
        sb.append(") ENGINE=InnoDB DEFAULT CHARSET=utf8;");    
        try {    
            jt.update(sb.toString());    
            return 1;    
        } catch (Exception e) {    
            e.printStackTrace();    
        }    
        return 0;    
    }       
      
    /**  
     * 拼接语句，往表里面插入数据 
     */    
    public static int saveObj(JdbcTemplate jt,String tableName,Object obj){    
        int re = 0;    
        try{                
            String sql = " insert into " + tableName + " (";    
            Map<String, Object> map = ObjectUtil.getProperty(obj);    
            Set<String> set = map.keySet();    
            for(String key : set){    
                sql += (key + ",");    
            }    
            sql += " tableName ) ";                 
            sql += " values ( ";    
            for(String key : set){    
                sql += ("'" + map.get(key) + "',");    
            }    
            sql += ("'" + tableName + "' ) ");    
            re = jt.update(sql);            
        } catch (Exception e) {    
            e.printStackTrace();    
        }           
        return re;    
    }       
      
     
    /**  
     * 查询数据库是否有某表  
     * @param cnn  
     * @param tableName  
     * @return  
     * @throws Exception  
     */    
    @SuppressWarnings("unchecked")    
    public static boolean getAllTableName(JdbcTemplate jt,String tableName) throws Exception {    
        Connection conn = (Connection) jt.getDataSource().getConnection();    
        ResultSet tabs = null;    
        try {    
            DatabaseMetaData dbMetaData = (DatabaseMetaData) conn.getMetaData();    
            String[]   types   =   { "TABLE" };    
            tabs = dbMetaData.getTables(null, null, tableName, types);    
            if (tabs.next()) {    
                return true;    
            }    
        } catch (Exception e) {    
            e.printStackTrace();    
        }finally{    
            tabs.close();    
            conn.close();    
        }    
        return false;    
    }  
	
}
