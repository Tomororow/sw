package webcam;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;

public class WebCam {

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
    
    public static void main(String[] args){  
    	//获取用户下直播视频列表
    	//String s=httpsRequest("https://open.ys7.com/api/lapp/device/list","POST","accessToken=at.94udetvp5jm27q5u50wsm6joahfmbnk2-3us8kj3xga-13jypnv-yko4rggcz");
    	//开始云台控制
    	String s=httpsRequest("https://open.ys7.com/api/lapp/device/ptz/start",""
    			+ "POST",""
    			+ "accessToken=at.45ak5u4la7bose2a98u6aen8714o8742-9dadnt64qu-15rklqp-qaemucc9t"
    			+ "&deviceSerial=107981548" //设备序列号102579307
    			+ "&channelNo=1" //通道号
    			+ "&direction=3" //操作命令：0-上，1-下，2-左，3-右，4-左上，5-左下，6-右上，7-右下，8-放大，9-缩小，10-近焦距，11-远焦距
    			+ "&speed=1" //云台速度：0-慢，1-适中，2-快
    			);
    	//获取设备列表
    	/*String s=httpsRequest("https://open.ys7.com/api/lapp/device/list",""
    			+ "POST",""
    			+ "accessToken=at.cr2eug917uhcy14idukrr0kkbd044j5u-9rgsvl28fr-1owqth3-6mxvyu32p"
    			); */
        System.out.println(s); 
    }  
}
