package com.zyjz.utils;


import com.zyjz.site.entity.*;
import com.zyjz.site.service.*;
import com.zyjz.sysmanage.entity.CanalFlowHight;
import com.zyjz.sysmanage.service.CanalFlowHightService;
import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

//@Component
public class TimerTaskManage {

    //格式化格式年月日 时分秒
    private static final String FORMATTER_YMD_HMS = "yyyy-MM-dd HH:mm:ss";
    //格式化格式年月日
    private static final String FORMATTER_YMD = "yyyy-MM-dd";
    //格式化格式年月
    private static final String FORMATTER_YM = "yyyy-MM";
    //格式化格式年
    private static final String FORMATTER_Y = "yyyy";

    @Autowired
    SiteWaterDynamicService siteWaterDynamicService;

    @Autowired
    SiteHourFlowService siteHourFlowService;

    @Autowired
    SiteDayFlowService siteDayFlowService;

    @Autowired
    SiteMonthFlowService siteMonthFlowService;

    @Autowired
    SiteYearFlowService siteYearFlowService;

    @Autowired
    SiteSluiceDynamicInfoService siteSluiceDynamicInfoService;

    @Autowired
    CanalFlowHightService canalFlowHightService;

    private static final Logger logger = LoggerFactory.getLogger(TimerTaskManage.class);

    //初始化线程池
    ExecutorService service = new ThreadPoolExecutor(4, 8, 0L, TimeUnit.MILLISECONDS,
            new LinkedBlockingQueue<Runnable>(10));
//    ExecutorService service = Executors.newFixedThreadPool(5);

    /**
     *站点小时报表定时任务
     */
    @Scheduled(cron="0 1/5 * * * ?")     //{秒} {分} {时} {日期} {月} {星期}
//    @Scheduled(cron="0 1/10 * * * ?")     //{秒} {分} {时} {日期} {月} {星期}
    public void hourFlowTask(){
//        System.out.println("---------------------定时任务0启动");
        //异步执行定时任务
        service.execute(()->{
            //遍历当前时间水文信息
            List<SiteWaterDynamicInfo> nowDynamicInfoList = siteWaterDynamicService.selectNowDynamicInfo();
            //雷达
            List<SiteWaterDynamicInfo> nowRadarInfos = nowDynamicInfoList.stream().filter(x -> "0".equals(x.getSwiType())).collect(Collectors.toList());
            //雷达流速一体计
            List<SiteWaterDynamicInfo> nowRadarVelocityInfos = nowDynamicInfoList.stream().filter(x -> "1".equals(x.getSwiType())).collect(Collectors.toList());
            //明渠
            List<SiteWaterDynamicInfo> nowOpenChannelInfos = nowDynamicInfoList.stream().filter(x -> !"0".equals(x.getSwiType()) && !"1".equals(x.getSwiType())).collect(Collectors.toList());

            //遍历前一小时水文信息
            List<SiteWaterDynamicInfo> preDynamicInfoList = siteWaterDynamicService.selectPreHourDynamicInfo();
            //明渠
            Map<String, List<SiteWaterDynamicInfo>> preOpenChannelInfos =
                    preDynamicInfoList.stream().filter(x -> !"0".equals(x.getSwiType())).collect(Collectors.groupingBy(SiteWaterDynamicInfo::getDevicewaterCode));

            //遍历前5分钟水文信息
//            List<SiteWaterDynamicInfo> preFiveDynamicInfoList = siteWaterDynamicService.selectPreFiveMinDynamicInfo();
            //雷达
//            Map<String, List<SiteWaterDynamicInfo>> preRadarInfos =
//                    preFiveDynamicInfoList.stream().filter(x -> "0".equals(x.getSwiType())).collect(Collectors.groupingBy(SiteWaterDynamicInfo::getDevicewaterCode));

            SiteHourFlow siteHourFlow = null;
            //明渠
            for (SiteWaterDynamicInfo info : nowOpenChannelInfos) {
                siteHourFlow = new SiteHourFlow();
                siteHourFlow.setWaterCode(info.getDevicewaterCode());//设备编码
                siteHourFlow.setWaterName(info.getCanclName());//设备名称
                siteHourFlow.setCreateTime(info.getSwdiCreateTime());
                if(info.getTotleFlow() != null && new BigDecimal(0).compareTo(info.getTotleFlow()) != 0){
                    BigDecimal total = info.getTotleFlow().subtract(preOpenChannelInfos.get(info.getDevicewaterCode()).get(0).getTotleFlow());
                    siteHourFlow.setHourFlow(total);//设备小时流量
                }else{
                    siteHourFlow.setHourFlow(new BigDecimal(0));//设备小时流量
                }
                siteHourFlow.setInYear(CommonMethodUtils.timeFormatter(info.getSwdiCreateTime(),"year"));//入库年
                siteHourFlow.setInMonth(CommonMethodUtils.timeFormatter(info.getSwdiCreateTime(),"month"));//入库月
                siteHourFlow.setInDay(CommonMethodUtils.timeFormatter(info.getSwdiCreateTime(),"day"));//入库日
                siteHourFlow.setInHour(CommonMethodUtils.timeFormatter(info.getSwdiCreateTime(),"hour"));//入库时
                siteHourFlow.setDeviceType("1");//0:雷达;1:明渠;2:雷达流速一体计
                handleSiteHourFlow(siteHourFlow,"openChanal");
            }

            //雷达流速一体计
            for (SiteWaterDynamicInfo info : nowRadarVelocityInfos) {
                siteHourFlow = new SiteHourFlow();
                siteHourFlow.setWaterCode(info.getDevicewaterCode());//设备编码
                siteHourFlow.setWaterName(info.getCanclName());//设备名称
                siteHourFlow.setCreateTime(info.getSwdiCreateTime());
                if(info.getInstantFlow()!= null && new BigDecimal(0).compareTo(info.getInstantFlow()) != 0){
                    BigDecimal total = info.getInstantFlow().multiply(new BigDecimal(300)).setScale(3,BigDecimal.ROUND_HALF_UP);
                    siteHourFlow.setHourFlow(total);//设备小时流量
//                    siteHourFlow.setHourFlow(info.getInstantFlow());//设备小时流量
                }else{
                    siteHourFlow.setHourFlow(new BigDecimal(0));//设备小时流量
                }
                siteHourFlow.setInYear(CommonMethodUtils.timeFormatter(info.getSwdiCreateTime(),"year"));//入库年
                siteHourFlow.setInMonth(CommonMethodUtils.timeFormatter(info.getSwdiCreateTime(),"month"));//入库月
                siteHourFlow.setInDay(CommonMethodUtils.timeFormatter(info.getSwdiCreateTime(),"day"));//入库日
                siteHourFlow.setInHour(CommonMethodUtils.timeFormatter(info.getSwdiCreateTime(),"hour"));//入库时
                siteHourFlow.setDeviceType("2");//0:雷达;1:明渠;2:雷达流速一体计
                handleSiteHourFlow(siteHourFlow,"radarVelocity");
            }


            //雷达
            for (SiteWaterDynamicInfo info : nowRadarInfos) {
                //当前时间水位流量关系表
                List<CanalFlowHight> nowCanalFlowHightList = canalFlowHightService.findInfoByWaterSiteIdAndLevel(info.getSiteWaterId(), info.getWaterLevel());
                CanalFlowHight nowCanalFlowHight = new CanalFlowHight();
                if(nowCanalFlowHightList.size()>0){
                    nowCanalFlowHight = nowCanalFlowHightList.get(0);
                }
                siteHourFlow = new SiteHourFlow();
                siteHourFlow.setWaterCode(info.getDevicewaterCode());//设备编码
                siteHourFlow.setWaterName(info.getCanclName());//设备名称
                siteHourFlow.setCreateTime(info.getSwdiCreateTime());
                if(nowCanalFlowHight.getFlow() != null && new BigDecimal(0).compareTo(nowCanalFlowHight.getFlow()) != 0){
//                    siteHourFlow.setHourFlow(nowCanalFlowHight.getFlow().multiply(new BigDecimal(300)).setScale(3,BigDecimal.ROUND_HALF_UP));//设备小时流量
                    siteHourFlow.setHourFlow(nowCanalFlowHight.getFlow());//设备小时流量
                }else{
                    siteHourFlow.setHourFlow(new BigDecimal(0));//设备小时流量
                }
                siteHourFlow.setInYear(CommonMethodUtils.timeFormatter(info.getSwdiCreateTime(),"year"));//入库年
                siteHourFlow.setInMonth(CommonMethodUtils.timeFormatter(info.getSwdiCreateTime(),"month"));//入库月
                siteHourFlow.setInDay(CommonMethodUtils.timeFormatter(info.getSwdiCreateTime(),"day"));//入库日
                siteHourFlow.setInHour(CommonMethodUtils.timeFormatter(info.getSwdiCreateTime(),"hour"));//入库时
                siteHourFlow.setDeviceType("0");//0:雷达;1:明渠;2:雷达流速一体计
                handleSiteHourFlow(siteHourFlow,"radar");
            }

            /*追加闸门日流量统计*/
/*            List<SiteSluiceDynamicInfo> nowSluiceDynamicInfos = siteSluiceDynamicInfoService.selectNowDynamicInfo();
            for (SiteSluiceDynamicInfo info : nowSluiceDynamicInfos) {
                siteHourFlow = new SiteHourFlow();
                siteHourFlow.setWaterCode(info.getSsdiSluiceGateCode());//设备编码
                siteHourFlow.setWaterName(info.getSsgiSluiceGateName());//设备名称
                siteHourFlow.setCreateTime(info.getSsdiCollectTime());
                if(info.getInstantTraffic() != null && new BigDecimal(0).compareTo(info.getInstantTraffic()) != 0){
                    siteHourFlow.setHourFlow(info.getInstantTraffic().multiply(new BigDecimal(300)).setScale(3,BigDecimal.ROUND_HALF_UP));//设备小时流量 5min/次
                }else{
                    siteHourFlow.setHourFlow(new BigDecimal(0));//设备小时流量
                }
                siteHourFlow.setInYear(CommonMethodUtils.timeFormatter(info.getSsdiCollectTime(),"year"));//入库年
                siteHourFlow.setInMonth(CommonMethodUtils.timeFormatter(info.getSsdiCollectTime(),"month"));//入库月
                siteHourFlow.setInDay(CommonMethodUtils.timeFormatter(info.getSsdiCollectTime(),"day"));//入库日
                siteHourFlow.setInHour(CommonMethodUtils.timeFormatter(info.getSsdiCollectTime(),"hour"));//入库时
                siteHourFlow.setDeviceType("2");//0:雷达;1:明渠;2:闸门
                handleSiteHourFlow(siteHourFlow,"sluice");
            }*/
        });
    }


    /**
     * fixedDelay = 1000*60*60 上一次执行完毕时间点之后一个小时再执行
     * cron="0 0 * * * ？"  每天每一小时触发一次
     */
    @Scheduled(cron="0 0 * * * ?")     //{秒} {分} {时} {日期} {月} {星期}
//    @Scheduled(cron="0 1/6 * * * ?")     //{秒} {分} {时} {日期} {月} {星期}
    public void dayFlowTask(){
//        System.out.println("---------------------定时任务1启动");
        //异步执行定时任务
        service.execute(()->{
            Date localDate = new Date();
            //遍历当天日总流量
            Map<String,Object> map = new HashedMap();
            map.put("year",CommonMethodUtils.timeFormatter(localDate,"year"));
            map.put("month",CommonMethodUtils.timeFormatter(localDate,"month"));
            map.put("day",CommonMethodUtils.timeFormatter(localDate,"day"));
            List<SiteHourFlow> siteHourFlowList = siteHourFlowService.selectCountByDayTime(map);
            for (SiteHourFlow siteHourFlow : siteHourFlowList) {
                map.put("waterCode",siteHourFlow.getWaterCode());
                map.put("deviceType", siteHourFlow.getDeviceType());
                handleSiteDayFlow(siteHourFlow,map);
            }
        });
    }

    /**
     * cron="0 0 0 * * ?" 每天0点执行一次
     * cron="0 0 * * * ?" 每小时执行一次
     */
    @Scheduled(cron="0 0 * * * ?")     //{秒} {分} {时} {日期} {月} {星期}
//    @Scheduled(cron="0 1/7 * * * ?")     //{秒} {分} {时} {日期} {月} {星期}
    public void monthFlowTask(){
//        System.out.println("---------------------定时任务2启动");
        //异步执行定时任务
        service.execute(()->{
            Date localDate = new Date();
            //遍历当月月总流量
            Map<String,Object> map = new HashedMap();
            map.put("year",CommonMethodUtils.timeFormatter(localDate,"year"));
            map.put("month",CommonMethodUtils.timeFormatter(localDate,"month"));
            List<SiteDayFlow> siteDayFlowList = siteDayFlowService.selectCountByMonthTime(map);
            for (SiteDayFlow siteDayFlow : siteDayFlowList) {
                map.put("waterCode",siteDayFlow.getWaterCode());
                map.put("deviceType", siteDayFlow.getDeviceType());
                handleSiteMonthFlow(siteDayFlow,map);
            }
        });
    }

    /**
     * cron="0 0 0 ? * 1 " 每周日0点执行一次 //TODO
     * cron="0 0 * * * ?" 每小时执行一次
     */
    @Scheduled(cron="0 0 * * * ?")     //{秒} {分} {时} {日期} {月} {星期}
//    @Scheduled(cron="0 1/8 * * * ?")     //{秒} {分} {时} {日期} {月} {星期}
    public void yearFlowTask(){
//        System.out.println("---------------------定时任务3启动");
        //异步执行定时任务
        service.execute(()->{
            Date localDate = new Date();
            //遍历当年年总流量
            Map<String,Object> map = new HashedMap();
            map.put("year",CommonMethodUtils.timeFormatter(localDate,"year"));
            List<SiteMonthFlow> siteMonthFlowList = siteMonthFlowService.selectCountByYearTime(map);
            for (SiteMonthFlow siteMonthFlow : siteMonthFlowList) {
                map.put("waterCode",siteMonthFlow.getWaterCode());
                map.put("deviceType", siteMonthFlow.getDeviceType());
                handleSiteYearFlow(siteMonthFlow,map);
            }
        });
    }

    //小时报表更新
    private void handleSiteHourFlow(SiteHourFlow siteHourFlow,String type){
        Map<String, Object> map = new HashedMap();
        map.put("waterCode", siteHourFlow.getWaterCode());
        map.put("year", siteHourFlow.getInYear());
        map.put("month", siteHourFlow.getInMonth());
        map.put("day", siteHourFlow.getInDay());
        map.put("hour", siteHourFlow.getInHour());
        map.put("deviceType", siteHourFlow.getDeviceType());
        //查询当前设备当天是否有数据
        SiteHourFlow hourFlow = siteHourFlowService.selectInfoByCodeAndTime(map);
        //当天该设备有数据
        if (hourFlow != null) {
            try {
                siteHourFlow.setId(hourFlow.getId());
                if ("openChanal".equals(type)) {
                    siteHourFlowService.updateByPrimaryKeySelective(siteHourFlow);
                }
                if ("radar".equals(type)) {
                    siteHourFlow.setHourFlow(hourFlow.getHourFlow().add(siteHourFlow.getHourFlow()));
                    siteHourFlowService.updateByPrimaryKeySelective(siteHourFlow);
                }
                if("radarVelocity".equals(type)){
                    siteHourFlow.setHourFlow(hourFlow.getHourFlow().add(siteHourFlow.getHourFlow()));
                    siteHourFlowService.updateByPrimaryKeySelective(siteHourFlow);
                }
                logger.info(siteHourFlow.getWaterCode() + "设备" + siteHourFlow.getCreateTime() + "数据插入成功");
            } catch (Exception e) {
                logger.info(siteHourFlow.getWaterCode() + "设备" + siteHourFlow.getCreateTime() + "数据插入失败");
            }
        } else {
            //当天该设备没有数据
            try {
                siteHourFlowService.insertSelective(siteHourFlow);
                logger.info(siteHourFlow.getWaterCode() + "设备" + siteHourFlow.getCreateTime() + "数据更新成功");
            } catch (Exception e) {
                logger.info(siteHourFlow.getWaterCode() + "设备" + siteHourFlow.getCreateTime() + "数据更新失败");
            }
        }
    }

    //日报表更新
    private void handleSiteDayFlow(SiteHourFlow siteHourFlow,Map<String,Object> map){
        //查询当前设备当天是否有数据
        SiteDayFlow siteDayFlow = siteDayFlowService.selectInfoByCodeAndTime(map);
        SiteDayFlow dayFlow = new SiteDayFlow();
        try {
            //当天该设备有数据
            if (siteDayFlow != null) {
                dayFlow = siteDayFlow;
                dayFlow.setDayFlow(siteHourFlow.getDaySumFlow());//设备日总流量
                dayFlow.setCreateTime(new Date());//创建时间
                //日报表更新
                siteDayFlowService.updateByPrimaryKeySelective(dayFlow);
            } else {
                //当天该设备没有数据
                dayFlow.setWaterCode(siteHourFlow.getWaterCode());//设备编码
                dayFlow.setWaterName(siteHourFlow.getWaterName());//设备名称
                dayFlow.setDayFlow(siteHourFlow.getDaySumFlow());//设备日总流量
                dayFlow.setCreateTime(new Date());
                dayFlow.setInYear(siteHourFlow.getInYear());//入库年
                dayFlow.setInMonth(siteHourFlow.getInMonth());//入库月
                dayFlow.setInDay(siteHourFlow.getInDay());//入库日
                dayFlow.setDeviceType(siteHourFlow.getDeviceType());//0:雷达;1:明渠;2:闸门
                //日报表插入
                siteDayFlowService.insertSelective(dayFlow);
            }
            logger.info(siteHourFlow.getWaterCode() + "设备" + new SimpleDateFormat(FORMATTER_YMD_HMS).format(new Date()) + "数据修改成功");
        } catch (Exception e) {
            logger.info(siteHourFlow.getWaterCode() + "设备" + new SimpleDateFormat(FORMATTER_YMD_HMS).format(new Date()) + "数据修改失败");
        }
    }

    //月报表更新
    private void handleSiteMonthFlow(SiteDayFlow siteDayFlow,Map<String,Object> map){
        //查询当前设备当月是否有数据
        SiteMonthFlow siteMonthFlow = siteMonthFlowService.selectInfoByCodeAndTime(map);
        SiteMonthFlow monthFlow = new SiteMonthFlow();
        try {
            //当天该设备有数据
            if (siteMonthFlow != null) {
                monthFlow = siteMonthFlow;
                monthFlow.setMonthFlow(siteDayFlow.getMonthSumFlow());//设备日总流量
                monthFlow.setCreateTime(new Date());//创建时间
                //日报表更新
                siteMonthFlowService.updateByPrimaryKeySelective(monthFlow);
            } else {
                //当天该设备没有数据
                monthFlow.setWaterCode(siteDayFlow.getWaterCode());//设备编码
                monthFlow.setWaterName(siteDayFlow.getWaterName());//设备名称
                monthFlow.setMonthFlow(siteDayFlow.getMonthSumFlow());//设备月总流量
                monthFlow.setCreateTime(new Date());
                monthFlow.setInYear(siteDayFlow.getInYear());//入库年
                monthFlow.setInMonth(siteDayFlow.getInMonth());//入库月
                monthFlow.setDeviceType(siteDayFlow.getDeviceType());//0:雷达;1:明渠;2:闸门
                //日报表插入
                siteMonthFlowService.insertSelective(monthFlow);
            }
            logger.info(siteDayFlow.getWaterCode() + "设备" + new SimpleDateFormat(FORMATTER_YMD_HMS).format(new Date()) + "数据修改成功");
        } catch (Exception e) {
            logger.info(siteDayFlow.getWaterCode() + "设备" + new SimpleDateFormat(FORMATTER_YMD_HMS).format(new Date()) + "数据修改失败");
        }
    }

    //年报表更新
    private void handleSiteYearFlow(SiteMonthFlow siteMonthFlow,Map<String,Object> map){
        //查询当前设备当年是否有数据
        SiteYearFlow siteYearFlow = siteYearFlowService.selectInfoByCodeAndTime(map);
        SiteYearFlow yearFlow = new SiteYearFlow();
        try {
            //当天该设备有数据
            if (siteYearFlow != null) {
                yearFlow = siteYearFlow;
                yearFlow.setYearFlow(siteMonthFlow.getYearSumFlow());//设备日总流量
                yearFlow.setCreateTime(new Date());//创建时间
                //日报表更新
                siteYearFlowService.updateByPrimaryKeySelective(yearFlow);
            } else {
                //当天该设备没有数据
                yearFlow.setWaterCode(siteMonthFlow.getWaterCode());//设备编码
                yearFlow.setWaterName(siteMonthFlow.getWaterName());//设备名称
                yearFlow.setYearFlow(siteMonthFlow.getYearSumFlow());//设备日总流量
                yearFlow.setCreateTime(new Date());
                yearFlow.setInYear(siteMonthFlow.getInYear());//入库年
                yearFlow.setDeviceType(siteMonthFlow.getDeviceType());//0:雷达;1:明渠;2:闸门
                //日报表插入
                siteYearFlowService.insertSelective(yearFlow);
            }
            logger.info(siteMonthFlow.getWaterCode() + "设备" + new SimpleDateFormat(FORMATTER_YMD_HMS).format(new Date()) + "数据修改成功");
        } catch (Exception e) {
            logger.info(siteMonthFlow.getWaterCode() + "设备" + new SimpleDateFormat(FORMATTER_YMD_HMS).format(new Date()) + "数据修改失败");
        }
    }


//    @Scheduled(cron="0 1/5 * * * ?")     //{秒} {分} {时} {日期} {月} {星期}
//    public void testTask(){
//        service.execute(()->{
//            System.out.println("--------------test----------1234567890");
//        });
//    }
//
//    public static void main(String[] args) {
//    }
}
