package com.zyjz.holder.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zyjz.utils.controller.BaseUtils;
import com.zyjz.video.service.SiteVideoInfoService;

/**
 * 定时任务批处理
 * @ClassName: TimerTasksController
 * @Description: 
 * @Author: 李玥
 * @Date: 2018年6月7日 下午6:53:04
 */
@Controller
@RequestMapping("/timerTasks")
public class TimerTasksController {
	private static final String URL = "https://open.ys7.com/api/lapp/token/get";
	private static final String METHOD = "POST";
	private static final String APPKEY = "941c26f6280e4e7c98df25150ed2c103";
	private static final String APPSECRET ="5dfb720651c895aec2d9a21607487647";
	
	private static final String ACCESSTOKEN_LIST ="/taskmanger/task_timemanger_list";//获取accessToken秘钥页面
	
	
	@Autowired
	private  SiteVideoInfoService siteVideoInfoService;
	/* 
     * 处理https GET/POST请求 
     * 请求地址、请求方法、参数 
     * */  
    public static String httpsRequest(String requestUrl,String requestMethod,String outputStr){  
        StringBuffer buffer=null;  
        try{  
        //创建SSLContext  
        SSLContext sslContext=SSLContext.getInstance("SSL");  
        TrustManager[] tm={new MyX509TrustManager()};  
        //初始化  
        sslContext.init(null, tm, new java.security.SecureRandom());;  
        //获取SSLSocketFactory对象  
        SSLSocketFactory ssf=sslContext.getSocketFactory();  
        URL url=new URL(requestUrl);  
        HttpsURLConnection conn=(HttpsURLConnection)url.openConnection();  
        conn.setDoOutput(true);  
        conn.setDoInput(true);  
        conn.setUseCaches(false);  
        conn.setRequestMethod(requestMethod);  
        //设置当前实例使用的SSLSoctetFactory  
        conn.setSSLSocketFactory(ssf);  
        conn.connect();  
        //往服务器端写内容  
        if(null!=outputStr){  
            OutputStream os=conn.getOutputStream();  
            os.write(outputStr.getBytes("utf-8"));  
            os.close();  
        }  
          
        //读取服务器端返回的内容  
        InputStream is=conn.getInputStream();  
        InputStreamReader isr=new InputStreamReader(is,"utf-8");  
        BufferedReader br=new BufferedReader(isr);  
        buffer=new StringBuffer();  
        String line=null;  
        while((line=br.readLine())!=null){
            buffer.append(line);  
        }  
        }catch(Exception e){  
            e.printStackTrace();  
        }  
        return buffer.toString();  
    }
	
	//设定指定任务task在指定时间time执行 schedule(TimerTask task, Date time)
    /**
     * 跳转到获取AccessToken页面
     * @Title: jumpTermAccessToken
     * @Description: 
     * @param: @return
     * @return: String
     * @throws
     */
    @RequestMapping("/jumpTermAccessToken")
    public String jumpTermAccessToken(Model model,HttpServletRequest request,int state){
    	BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
    	return ACCESSTOKEN_LIST;
    }
    
	/**
	 * 定时获取萤石云账户accessToken秘钥
	 * @Title: timer1
	 * @Description: 
	 * @param:
	 * @return: void
	 * @throws
	 */
	@RequestMapping("/timer1")
	@ResponseBody
    public Object timer1() {
		/*TimerTask task = new EatTimerTask();
        Calendar  calendar= Calendar.getInstance();    
        Date firstTime = calendar.getTime();
        //间隔：5天
        long period = 5000; //（5d=432000s）   
        Timer timer = new Timer();        
        timer.schedule(task, firstTime, period);*/
		
		
		//获取accessToken
    	String s=httpsRequest(URL,""
    			+ METHOD,""
    			+ "appKey="+APPKEY+""
    			+ "&appSecret="+APPSECRET+""
    			);
        System.out.println(s);
      // String s ="{\"data\":{\"accessToken\":\"at.4u5pnm847kc03lrp8sozh69g09aqcx1m-8kxivk2h7l-0aukjl0-jeay7ox9j\",\"expireTime\":1528959153057},\"code\":\"200\",\"msg\":\"操作成功!\"}";
        JSONObject job = JSONObject.fromObject(s);
        String  accessToken ="";
        String data =job.getString("data");
        JSONObject ds = JSONObject.fromObject(data);       
        accessToken = ds.getString("accessToken");
        System.out.println("==================accessToken==================="+accessToken);
        siteVideoInfoService.updateAccessToken(accessToken);
        return accessToken;
	} 
	/**
	 * 获取现已有的accessToken
	 * @Title: getExistingAccessToken
	 * @Description: 
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping("/getExistingAccessToken")
	@ResponseBody
	public String getExistingAccessToken(){
		 String  accessToken =siteVideoInfoService.getExistingAccessToken();
		 System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+accessToken);
		return accessToken;
	}
	
	
	
	
	// 第二种方法：设定指定任务task在指定延迟delay后进行固定延迟peroid的执行  
    // schedule(TimerTask task, long delay, long period)  
    public static void timer2() {  
        Timer timer = new Timer();  
        timer.schedule(new TimerTask(){  
            public void run() {  
                System.out.println("-------设定要指定任务--------");  
            }  
        }, 1000, 1000);  
    }  
   
    // 第三种方法：设定指定任务task在指定延迟delay后进行固定频率peroid的执行。  
    // scheduleAtFixedRate(TimerTask task, long delay, long period)
    public static void timer3() {  
        Timer timer = new Timer();  
        timer.scheduleAtFixedRate(new TimerTask() {  
            public void run() {  
                System.out.println("-------设定要指定任务--------");  
            }  
        }, 1000, 2000);  
    }  
      
    // 第四种方法：安排指定的任务task在指定的时间firstTime开始进行重复的固定速率period执行．  
    // Timer.scheduleAtFixedRate(TimerTask task,Date firstTime,long period)  
    public static void timer4() {  
        Calendar calendar = Calendar.getInstance();  
        calendar.set(Calendar.HOUR_OF_DAY, 12); // 控制时  
        calendar.set(Calendar.MINUTE, 0);       // 控制分  
        calendar.set(Calendar.SECOND, 0);       // 控制秒  
   
        Date time = calendar.getTime();         // 得出执行任务的时间,此处为今天的12：00：00  
   
        Timer timer = new Timer();  
        timer.scheduleAtFixedRate(new TimerTask() {  
            public void run() {  
                System.out.println("-------设定要指定任务--------");  
            }  
        }, time, 1000 * 60 * 60 * 24);// 这里设定将延时每天固定执行  
    }  
}
