package com.zyjz.holder.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.util.TimerTask;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zyjz.video.service.SiteVideoInfoService;

import net.sf.json.JSONObject;


public class EatTimerTask extends TimerTask {
		
	private static final String URL = "https://open.ys7.com/api/lapp/token/get";
	private static final String METHOD = "POST";
	private static final String APPKEY = "941c26f6280e4e7c98df25150ed2c103";
	private static final String APPSECRET ="5dfb720651c895aec2d9a21607487647";
	
	
	@Autowired
	private SiteVideoInfoService siteVideoInfoService;
	
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

    public void run() {
        //获取accessToken
    	/*String s=httpsRequest(URL,""
    			+ METHOD,""
    			+ "appKey="+APPKEY+""
    			+ "&appSecret="+APPSECRET+""
    			);
        System.out.println(s);*/
        String s ="{\"data\":{\"accessToken\":\"at.4u5pnm847kc03lrp8sozh69g09aqcx1m-8kxivk2h7l-0aukjl0-jeay7ox9j\",\"expireTime\":1528959153057},\"code\":\"200\",\"msg\":\"操作成功!\"}";
        JSONObject job = JSONObject.fromObject(s);
        String  accessToken ="";
        String data =job.getString("data");
        JSONObject ds = JSONObject.fromObject(data);       
        accessToken = ds.getString("accessToken");
        System.out.println("==================accessToken==================="+accessToken);
       /* int count = siteVideoInfoService.updateAccessToken(accessToken);
        System.out.println("========count========"+count);*/
        
    }

}
