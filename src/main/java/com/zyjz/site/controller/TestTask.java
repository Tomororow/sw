package com.zyjz.site.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import com.zyjz.sysmanage.entity.SiteWaterInfo;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.zyjz.site.entity.SiteWaterDynamicInfo;
import com.zyjz.site.service.DataSheetService;
import com.zyjz.site.service.SiteWaterDynamicService;
import com.zyjz.sysmanage.service.CanalFlowHightService;
import com.zyjz.sysmanage.service.SiteWaterService;
@Component 
public class TestTask implements BeanPostProcessor {
 
	@Autowired
	private SiteWaterService siteWaterService;
	
	@Autowired
	private SiteWaterDynamicService siteWaterDynamicService;
	
	@Autowired
	private CanalFlowHightService canalFlowHightService;
	
	@Autowired
	private DataSheetService dataSheetService;
	
	//bean实例化之后执行
	public Object postProcessAfterInitialization(Object bean, String arg1)
			throws BeansException {
		// TODO Auto-generated method stub
		return bean;
	}
	//bean实例化之前执行
	public Object postProcessBeforeInitialization(Object bean, String arg1)
			throws BeansException {
		// TODO Auto-generated method stub
		return bean;
	}
	/*
	 * 累积流量计算定时任务
	 * 每天晚上11点四十准时开跑
	 */
	@Scheduled(cron="0 40 23 * * ?")
	public void cumulative(){
		System.out.println("==============开始执行定时任务11111111111111111111111=============");
		List<SiteWaterDynamicInfo> dlist=null;
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 SimpleDateFormat sdftime = new SimpleDateFormat("yyyy-MM-dd");
		List<SiteWaterInfo> siteList= siteWaterService.selectAll();
		for (SiteWaterInfo siteWaterInfo : siteList) {
			dlist=siteWaterDynamicService.setCumulative(siteWaterInfo.getDeviceWaterCode(), sdf.format(getStartTime()), sdf.format(getEndTime()));
			//把查到的累积流量放到数据库中
			
			
			
		}
		System.out.println("==============定时任务运行结束11111111111111111111111=============");
	} 
	
	//@Scheduled(fixedDelay = 12000000)
    public void setValue() {
    		System.out.println("==============开始执行11111111111111111111111=============");
    		/*DataSheet ds = new DataSheet();
    		List<SiteWaterInfo> swiList = siteWaterService.findAllSiteWater();
			for(SiteWaterInfo swi :swiList){
				System.out.println("------------getDeviceWaterName------------"+swi.getDeviceWaterName());
				List<SiteWaterDynamicInfo> swdsList = siteWaterDynamicService.selectWaterCode(swi.getDeviceWaterCode());
				System.out.println("------------swdsList.size()----------"+swdsList.size());
				List<CanalFlowHight> cfhList = canalFlowHightService.findCanalFlowHightsByWaterSiteId(swi.getId());
				if(cfhList.size()>0){
					BigDecimal bdl = new BigDecimal("0.0");
					for(SiteWaterDynamicInfo swdi:swdsList){
						int type = swdi.getSwdiCreateTime().getMonth()+1;
						//System.out.println("@@@@@@@@@@@@@@@@@-----type"+type);
						for(CanalFlowHight cfh:cfhList ){
							BigDecimal bgdc = swi.getSiteDepth().subtract(swdi.getTestHeight()).divide(new BigDecimal("100"));
							System.out.println("---------bgdc----------"+bgdc);
							int upder = bgdc.compareTo(cfh.getUpperLimit());
							int downr = bgdc.compareTo(cfh.getDownerLimit());
							System.out.println("---------upder----------"+cfh.getUpperLimit());
							System.out.println("---------downr----------"+cfh.getDownerLimit());
							
							System.out.println("**************************************************-");
							                                                                                                                 
							if(bgdc!=null&&upder==1&&downr==-1){
								DataSheet dss = dataSheetService.selectCode(swi.getDeviceWaterCode());
								switch (type) {
								case 1:
									if(dss!=null){
										if(dss.getJanuary()==null){
											bdl =new BigDecimal("0");
										}
										bdl = bdl.add(cfh.getFlow());
										dss.setJanuary(bdl);
										dataSheetService.updateByPrimaryKey(dss);
									}else{
										ds.setWaterName(swi.getDeviceWaterName());
										ds.setWaterCode(swi.getDeviceWaterCode());
										bdl = bdl.add(cfh.getFlow());
										ds.setJanuary(bdl);
										dataSheetService.insertSelective(ds);
									}
									break;
								case 2:
									if(dss!=null){
										if(dss.getFebruary()==null){
											bdl =new BigDecimal("0"); 
										}
										bdl = bdl.add(cfh.getFlow());
										dss.setFebruary(bdl);
										dataSheetService.updateByPrimaryKey(dss);
									}else{
										ds.setWaterName(swi.getDeviceWaterName());
										ds.setWaterCode(swi.getDeviceWaterCode());
										bdl = bdl.add(cfh.getFlow());
										ds.setFebruary(bdl);
										dataSheetService.insertSelective(ds);
									}
									break;
								case 3:
									if(dss!=null){
										if(dss.getMarch()==null){
											bdl =new BigDecimal("0"); 
										}
										bdl = bdl.add(cfh.getFlow());
										dss.setMarch(bdl);
										dataSheetService.updateByPrimaryKey(dss);
									}else{
										ds.setWaterName(swi.getDeviceWaterName());
										ds.setWaterCode(swi.getDeviceWaterCode());
										bdl = bdl.add(cfh.getFlow());
										ds.setMarch(bdl);
										dataSheetService.insertSelective(ds);
									}
									break;
								case 4:
									if(dss!=null){
										if(dss.getApril()==null){
											bdl =new BigDecimal("0"); 
										}
										bdl = bdl.add(cfh.getFlow());
										dss.setApril(bdl);
										dataSheetService.updateByPrimaryKey(dss);
									}else{
										ds.setWaterName(swi.getDeviceWaterName());
										ds.setWaterCode(swi.getDeviceWaterCode());
										bdl = bdl.add(cfh.getFlow());
										ds.setApril(bdl);
										dataSheetService.insertSelective(ds);
									}
									break;
								case 5:
									if(dss!=null){
										if(dss.getMay()==null){
											bdl =new BigDecimal("0"); 
										}
										bdl = bdl.add(cfh.getFlow());
										dss.setMay(bdl);
										dataSheetService.updateByPrimaryKey(dss);
									}else{
										ds.setWaterName(swi.getDeviceWaterName());
										ds.setWaterCode(swi.getDeviceWaterCode());
										bdl = bdl.add(cfh.getFlow());
										ds.setMay(bdl);
										dataSheetService.insertSelective(ds);
									}
									break;
								case 6:
									if(dss!=null){
									//	System.out.println("**********cfh.getFlow()********"+cfh.getFlow());
										if(dss.getJune()==null){
											bdl =new BigDecimal("0"); 
										}
									//	System.out.println("**********dss.getJune()********"+dss.getJune());
										bdl = bdl.add(cfh.getFlow());
										dss.setJune(bdl);
										dataSheetService.updateByPrimaryKey(dss);
									}else{
										ds.setWaterName(swi.getDeviceWaterName());
										ds.setWaterCode(swi.getDeviceWaterCode());
										bdl = bdl.add(cfh.getFlow());
										ds.setJune(bdl);
										dataSheetService.insertSelective(ds);
									}
									break;
								case 7:
									if(dss!=null){
										if(dss.getJuly()==null){
											bdl =new BigDecimal("0"); 
										}
										bdl = bdl.add(cfh.getFlow());
										dss.setJuly(bdl);
										dataSheetService.updateByPrimaryKey(dss);
									}else{
										ds.setWaterName(swi.getDeviceWaterName());
										ds.setWaterCode(swi.getDeviceWaterCode());
										bdl = bdl.add(cfh.getFlow());
										ds.setJuly(bdl);
										dataSheetService.insertSelective(ds);
									}
									break;
								case 8:
									if(dss!=null){
										if(dss.getAugust()==null){
											bdl =new BigDecimal("0"); 
										}
										bdl = bdl.add(cfh.getFlow());
										dss.setAugust(bdl);
										dataSheetService.updateByPrimaryKey(dss);
									}else{
										ds.setWaterName(swi.getDeviceWaterName());
										ds.setWaterCode(swi.getDeviceWaterCode());
										bdl = bdl.add(cfh.getFlow());
										ds.setAugust(bdl);
										dataSheetService.insertSelective(ds);
									}
									break;
								case 9:
									if(dss!=null){
										if(dss.getSeptember()==null){
											bdl =new BigDecimal("0"); 
										}
										bdl = bdl.add(cfh.getFlow());
										dss.setSeptember(bdl);
										dataSheetService.updateByPrimaryKey(dss);
									}else{
										ds.setWaterName(swi.getDeviceWaterName());
										ds.setWaterCode(swi.getDeviceWaterCode());
										bdl = bdl.add(cfh.getFlow());
										ds.setSeptember(bdl);
										dataSheetService.insertSelective(ds);
									}
									break;
								case 10:
									if(dss!=null){
										if(dss.getOctober()==null){
											bdl =new BigDecimal("0"); 
										}
										bdl = bdl.add(cfh.getFlow());
										dss.setOctober(bdl);
										dataSheetService.updateByPrimaryKey(dss);
									}else{
										ds.setWaterName(swi.getDeviceWaterName());
										ds.setWaterCode(swi.getDeviceWaterCode());
										bdl = bdl.add(cfh.getFlow());
										ds.setOctober(bdl);
										dataSheetService.insertSelective(ds);
									}
									break;
								case 11:
									if(dss!=null){
										if(dss.getNovember()==null){
											bdl =new BigDecimal("0"); 
										}
										bdl = bdl.add(cfh.getFlow());
										dss.setNovember(bdl);
										dataSheetService.updateByPrimaryKey(dss);
									}else{
										ds.setWaterName(swi.getDeviceWaterName());
										ds.setWaterCode(swi.getDeviceWaterCode());
										bdl = bdl.add(cfh.getFlow());
										ds.setNovember(bdl);
										dataSheetService.insertSelective(ds);
									}
									break;
								default:
									if(dss!=null){
										if(dss.getDecember()==null){
											bdl =new BigDecimal("0"); 
										}
										bdl = bdl.add(cfh.getFlow());
										dss.setDecember(bdl);
										dataSheetService.updateByPrimaryKey(dss);
									}else{
										ds.setWaterName(swi.getDeviceWaterName());
										ds.setWaterCode(swi.getDeviceWaterCode());
										bdl = bdl.add(cfh.getFlow());
										ds.setDecember(bdl);
										dataSheetService.insertSelective(ds);
									}
									break;
								}
							}else{
								
							}
							
						}
					}
				}
			}*/
    }
    /*
     * 获取当天的开始时间
     */
    
    private Long getStartTime() {
    	         Calendar todayStart = Calendar.getInstance();
    	         todayStart.set(Calendar.HOUR, 0);
    	         todayStart.set(Calendar.MINUTE, 0);
    	         todayStart.set(Calendar.SECOND, 0);
    	         todayStart.set(Calendar.MILLISECOND, 0);
    	        return todayStart.getTime().getTime();
    	     }
    /*
     * 获取当天的结束时间
     */
    
    private Long getEndTime() {
    	         Calendar todayEnd = Calendar.getInstance();
    	         todayEnd.set(Calendar.HOUR, 23);
    	         todayEnd.set(Calendar.MINUTE, 59);
    	         todayEnd.set(Calendar.SECOND, 59);
    	         todayEnd.set(Calendar.MILLISECOND, 999);
    	         return todayEnd.getTime().getTime();
    	     }
}  