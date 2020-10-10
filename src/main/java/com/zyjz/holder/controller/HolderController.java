package com.zyjz.holder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 云台控制
 * @ClassName: Holder
 * @Description: 
 * @Author: liyue
 * @Date: 2018年5月7日 下午2:42:32
 */
@Controller
@RequestMapping("/holder")
public class HolderController {
	
	private static final String DeviceList_URL = "https://open.ys7.com/api/lapp/device/list";
	private static final String CONSOLE_URL="https://open.ys7.com/api/lapp/device/ptz/start";//操作云台请求地址
	private static final String shutDownOperation_UPL="https://open.ys7.com/api/lapp/device/ptz/stop"; //停止操作云台请求地址
	private static final String MODE="POST"; //请求方法
	
	
	
	public Object getDeviceList(){
		String s=WebCam.httpsRequest(DeviceList_URL,""
    			+ MODE,""
    			+ "accessToken=at.cr2eug917uhcy14idukrr0kkbd044j5u-9rgsvl28fr-1owqth3-6mxvyu32p"
    			);
		return s;
	}

	/**
	 * 开始操控云台
	 * @Title: Console
	 * @Description: 
	 * @param: @param direction
	 * @param: @return
	 * @return: Object
	 * @throws
	 */
	@RequestMapping("/Console")
	@ResponseBody
	public Object Console(@RequestParam(value = "direction")String direction,String accessToken,String deviceSerial,String channelNo){
		System.out.println("========开始操作============"+direction);
		
		System.out.println("========deviceSerial============"+deviceSerial);
		System.out.println("========channelNo============"+channelNo);
		System.out.println("========accessToken============"+accessToken);
		
		//开始云台控制
    	String s=WebCam.httpsRequest(CONSOLE_URL,""
    			+ MODE,""
    			+ "accessToken="+accessToken+""
    			+ "&deviceSerial="+deviceSerial+"" //设备序列号
    			+ "&channelNo="+channelNo+"" //通道号
    			+ "&direction="+direction+"" //操作命令：0-上，1-下，2-左，3-右，4-左上，5-左下，6-右上，7-右下，8-放大，9-缩小，10-近焦距，11-远焦距
    			+ "&speed=1" //云台速度：0-慢，1-适中，2-快
    			);
		return s;
	}
	
	/**
	 * 设备停止云台控制
	 * @Title: shutDownOperation
	 * @Description: 
	 * @param: @param direction
	 * @param: @return
	 * @return: Object
	 * @throws
	 */
	@RequestMapping("/shutDownOperation")
	@ResponseBody
	public Object shutDownOperation(@RequestParam(value = "direction")String direction,String accessToken,String deviceSerial,String channelNo){
		System.out.println("====停止操作======"+direction);
		//开始云台控制
    	String s=WebCam.httpsRequest(shutDownOperation_UPL,""
    			+ MODE,""
				+ "accessToken="+accessToken+""
    			+ "&deviceSerial="+deviceSerial+"" //设备序列号
    			+ "&channelNo="+channelNo+"" //通道号
    			+ "&direction="+direction+"" //操作命令：0-上，1-下，2-左，3-右，4-左上，5-左下，6-右上，7-右下，8-放大，9-缩小，10-近焦距，11-远焦距
    			+ "&speed=1" //云台速度：0-慢，1-适中，2-快
    			);
		return s;
	}
	
}
