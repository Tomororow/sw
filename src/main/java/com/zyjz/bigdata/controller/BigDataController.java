package com.zyjz.bigdata.controller;

import com.alibaba.fastjson.JSONObject;
import com.zyjz.bigdata.entity.ReservoirLevel;
import com.zyjz.bigdata.service.ReservoirLevelService;
import com.zyjz.plan.entity.ForecastWater;
import com.zyjz.plan.entity.ForecastWaterTable;
import com.zyjz.plan.entity.WaterPlanNew;
import com.zyjz.plan.service.ForecastWaterService;
import com.zyjz.plan.service.WaterPlanNewService;
import com.zyjz.remotecontrol.entity.SiteSluiceGateInfo;
import com.zyjz.remotecontrol.entity.SiteSluiceJzMiddDevice;
import com.zyjz.remotecontrol.service.SiteSluiceGateInfoService;
import com.zyjz.site.entity.SiteDayFlow;
import com.zyjz.site.entity.SiteHourFlow;
import com.zyjz.site.entity.SiteMonthFlow;
import com.zyjz.site.service.SiteDayFlowService;
import com.zyjz.site.service.SiteHourFlowService;
import com.zyjz.site.service.SiteMonthFlowService;
import com.zyjz.site.service.SiteWaterDynamicService;
import com.zyjz.sitemanage.entity.EvaporateSurveySite;
import com.zyjz.sitemanage.entity.MeteorSurveySite;
import com.zyjz.sitemanage.entity.MoistureSurveySite;
import com.zyjz.sitemanage.entity.WaterSurveySite;
import com.zyjz.sitemanage.service.EvaporateSurveySiteService;
import com.zyjz.sitemanage.service.MeteorSurveySiteService;
import com.zyjz.sitemanage.service.MoistureSurveySiteService;
import com.zyjz.sitemanage.service.WaterSurveySiteService;
import com.zyjz.sysmanage.entity.*;
import com.zyjz.sysmanage.service.*;
import com.zyjz.utils.CommonMethodUtils;
import com.zyjz.video.entity.SiteVideoInfo;
import com.zyjz.video.service.SiteVideoInfoService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/big_data")
public class BigDataController {

    @Autowired
    CalCanalInfoService calCanalInfoService;

    @Autowired
    private SysAreaService sysAreaService;

    @Autowired
    ReservoirManagerService reservoirManagerService;

    @Autowired
    SiteWaterService siteWaterService;

    @Autowired
    SiteWaterDynamicService siteWaterDynamicService;

    @Autowired
    private SiteVideoInfoService siteVideoInfoService;

    @Autowired
    SiteSluiceService siteSluiceService;

    @Autowired
    SiteSluiceGateInfoService siteSluiceGateInfoService;

    @Autowired
    private WaterSurveySiteService waterSurveySiteService;

    @Autowired
    private MeteorSurveySiteService meteorSurveySiteService;

    @Autowired
    private MoistureSurveySiteService moistureSurveySiteService;

    @Autowired
    private EvaporateSurveySiteService evaporateSurveySiteService;

    @Autowired
    ReservoirLevelService reservoirLevelService;

    @Autowired
    SiteHourFlowService siteHourFlowService;

    @Autowired
    SiteDayFlowService siteDayFlowService;

    @Autowired
    SiteMonthFlowService siteMonthFlowService;

    @Autowired
    ForecastWaterService forecastWaterService;

    @Autowired
    WaterPlanNewService waterPlanNewService;

    private List<String> sysAreaCode = new ArrayList<>();

    /** 水质等级 */
    private final static Map<String, String> waterGradeMap = new HashMap<String, String>();
    static {
        waterGradeMap.put("20", "Ⅰ类");
        waterGradeMap.put("40", "Ⅱ类");
        waterGradeMap.put("60", "Ⅲ类");
        waterGradeMap.put("80", "Ⅳ类");
        waterGradeMap.put("100", "Ⅴ类");
    }

    /** 视图解析页面路径 */
    protected static final String SYS_LOGIN_JSP =  "/big_data/index";

    //格式化格式年月日 时分秒
    private static final String FORMATTER_YMD_HMS = "yyyy-MM-dd HH:mm:ss";

    /**
     * 首页
     * @return
     */
    @RequestMapping(value="/index")
    public String loginPage(){
        return SYS_LOGIN_JSP;
    }

    /**
     * //TODO
     * @return
     */
    @RequestMapping(value = "/data", produces =  "text/html; charset=utf-8")
    public @ResponseBody String getUserInfo(){
        //TODO
        return "";
    }

    /**
     * 灌区下拉选查询
     */
    @RequestMapping(value = "/down_select_irrigation_query", produces =  "text/html; charset=utf-8")
    public @ResponseBody String downSelectIrrigationQuery(){
        List<CalCanalInfo> calCanalInfoAll = calCanalInfoService.findAllCanal();//查询渠道表的所有节点数据
        //筛选出灌区
        List<CalCanalInfo> calCanalInfoList =
                calCanalInfoAll.stream().filter(x -> "1".equals(x.getCanallevelCode().toString())).collect(Collectors.toList());
        return JSONObject.toJSONString(calCanalInfoList);
    }

    /**
     * 水库下拉选查询
     */
    @RequestMapping(value = "/down_select_reservoir_query", produces =  "text/html; charset=utf-8")
    public @ResponseBody String downSelectReservoirQuery(){
        List<SiteReservoirInfo> allReservoir = reservoirManagerService.findAllReservoir();
        return JSONObject.toJSONString(allReservoir);
    }

    /**
     * 河道下拉选查询
     */
    @RequestMapping(value = "/down_select_river_query", produces =  "text/html; charset=utf-8")
    public @ResponseBody String downSelectRiverQuery(){
        //TODO
        return "";
    }

    /**
     * 行政区下拉选查询
     */
    @RequestMapping(value = "/down_select_sysArea_query", produces =  "text/html; charset=utf-8")
    public @ResponseBody String downSelectSysAreaQuery(){
        List<SysArea> sysAreaList = sysAreaService.findAreaByLevel(1);
        return JSONObject.toJSONString(sysAreaList);
    }

    /**
     * 日引水量查询
     */
    @RequestMapping(value = "/day_water_consumption_query", produces =  "text/html; charset=utf-8")
    public @ResponseBody String dayWaterConsumptionQuery(String canalCode){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        Calendar cal = Calendar.getInstance();//得到一个Calendar的实例
        Date currentDate = new Date();
        cal.setTime(currentDate); //设置时间为当前时间
        Map<String, Object> map = new HashedMap();
        map.put("canalCode", canalCode);
        map.put("year", CommonMethodUtils.timeFormatter(currentDate,"year"));
        map.put("month", CommonMethodUtils.timeFormatter(currentDate,"month"));
        map.put("day", CommonMethodUtils.timeFormatter(currentDate,"day"));
        //当日日引水量
        List<SiteHourFlow> currentDayFlowList = siteHourFlowService.selectCountDayFlowPerHour(map);

        //获取前一天
        cal.add(Calendar.DATE,-1);
        Date previousDate = cal.getTime();
        map.put("year", CommonMethodUtils.timeFormatter(previousDate,"year"));
        map.put("month", CommonMethodUtils.timeFormatter(previousDate,"month"));
        map.put("day", CommonMethodUtils.timeFormatter(previousDate,"day"));
        //昨日日引水量
        List<SiteHourFlow> previousDayFlowList = siteHourFlowService.selectCountDayFlowPerHour(map);
        //数据封装
        Map<String, Object[]> dataMap = new HashedMap();
        dataMap.put("legend",new String[]{dateFormat.format(currentDate)+"用量",dateFormat.format(previousDate)+"用量"});
        previousDayFlowList.stream().map(x -> x.getInHour().toString()).forEach(x->x= x+":00-" + x+1+":00");
        dataMap.put("dayXsiaData",previousDayFlowList.stream().map(x -> x.getInHour()+":00-" + (x.getInHour()+1)+":00").collect(Collectors.toList()).toArray());
        dataMap.put("dayYsiaDataA",currentDayFlowList.stream().map(x -> x.getTotalFlowPerHour()).collect(Collectors.toList()).toArray());
        dataMap.put("dayYsiaDataB",previousDayFlowList.stream().map(x -> x.getTotalFlowPerHour()).collect(Collectors.toList()).toArray());
//        dataMap.put("dayYsiaDataB",previousDayFlowList.stream().map(x -> x.getTotalFlowPerHour().divide(new BigDecimal(1000000000),2,BigDecimal.ROUND_HALF_UP)).collect(Collectors.toList()).toArray());
        return JSONObject.toJSONString(dataMap);
    }

    /**
     * 月引水量查询
     */
    @RequestMapping(value = "/month_water_consumption_query", produces =  "text/html; charset=utf-8")
    public @ResponseBody String monthWaterConsumptionQuery(String canalCode){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM");
        Calendar cal = Calendar.getInstance();//得到一个Calendar的实例
        Date currentMonthDate = new Date();
        cal.setTime(currentMonthDate); //设置时间为当前时间
        Map<String, Object> map = new HashedMap();
        map.put("canalCode", canalCode);
        map.put("year", CommonMethodUtils.timeFormatter(currentMonthDate,"year"));
        map.put("month", CommonMethodUtils.timeFormatter(currentMonthDate,"month"));
        //当月月引水量
        List<SiteDayFlow> currentMonthFlowList = siteDayFlowService.selectCountMonthFlowPerDay(map);

        //获取前一月
        cal.add(Calendar.MONTH,-1);
        Date previousMonthDate = cal.getTime();
        map.put("year", CommonMethodUtils.timeFormatter(previousMonthDate,"year"));
        map.put("month", CommonMethodUtils.timeFormatter(previousMonthDate,"month"));
        List<SiteDayFlow> previousMonthFlowList = siteDayFlowService.selectCountMonthFlowPerDay(map);
        //数据封装
        Map<String, Object[]> dataMap = new HashedMap();
        dataMap.put("legend",new String[]{dateFormat.format(currentMonthDate)+"用量",dateFormat.format(previousMonthDate)+"用量"});
        dataMap.put("dayXsiaData",currentMonthFlowList.stream().map(x -> x.getInDay()+"日").collect(Collectors.toList()).toArray());
        dataMap.put("dayYsiaDataA",currentMonthFlowList.stream().map(x -> x.getTotalFlowPerDay()).collect(Collectors.toList()).toArray());
        dataMap.put("dayYsiaDataB",previousMonthFlowList.stream().map(x -> x.getTotalFlowPerDay()).collect(Collectors.toList()).toArray());
        return JSONObject.toJSONString(dataMap);
    }

    /**
     * 总用水量查询
     */
    @RequestMapping(value = "/total_water_consumption_query", produces =  "text/html; charset=utf-8")
    public @ResponseBody String totalWaterConsumptionQuery(String canalCode){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
        Calendar cal = Calendar.getInstance();//得到一个Calendar的实例
        Date currentYearDate = new Date();
        cal.setTime(currentYearDate); //设置时间为当前时间
        Map<String, Object> map = new HashedMap();
        map.put("canalCode", canalCode);
        map.put("year", CommonMethodUtils.timeFormatter(currentYearDate,"year"));
        //当年年引水量
        List<SiteMonthFlow> currentYearFlowList = siteMonthFlowService.selectCountYearFlowPerMonth(map);
        //查询当月月引水量
        map.put("month", CommonMethodUtils.timeFormatter(currentYearDate,"month"));
        List<SiteDayFlow> currentMonthFlowList = siteDayFlowService.selectCountMonthFlowPerDay(map);
        //查询当日日引水量
        map.put("day", CommonMethodUtils.timeFormatter(currentYearDate,"day"));
        List<SiteHourFlow> currentDayFlowList = siteHourFlowService.selectCountDayFlowPerHour(map);

        //获取前一年
        cal.add(Calendar.YEAR,-1);
        Date previousYearDate = cal.getTime();
        map.put("year", CommonMethodUtils.timeFormatter(previousYearDate,"year"));
        List<SiteMonthFlow> previousYearFlowList = siteMonthFlowService.selectCountYearFlowPerMonth(map);
        //数据封装
        Map<String, Object[]> dataMap = new HashedMap();
        //日引水量
        dataMap.put("dailyWaterDiversion",new BigDecimal[]{currentDayFlowList.stream().map(SiteHourFlow::getTotalFlowPerHour)
                .reduce(BigDecimal.ZERO, BigDecimal::add)});
        //月引水量
        dataMap.put("monthlyWaterDiversion",new BigDecimal[]{currentMonthFlowList.stream().map(SiteDayFlow::getTotalFlowPerDay)
                .reduce(BigDecimal.ZERO, BigDecimal::add)});
        //年引水量
        dataMap.put("annualWaterDiversion",new BigDecimal[]{currentYearFlowList.stream().map(SiteMonthFlow::getTotalFlowPerMonth)
                .reduce(BigDecimal.ZERO, BigDecimal::add)});

        dataMap.put("legend",new String[]{dateFormat.format(previousYearDate)+"年用量",dateFormat.format(currentYearDate)+"年用量"});
        Integer[] dayXsiaData = {1,2,3,4,5,6,7,8,9,10,11,12};
        String[] dayXsiaDataBar = {"1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"};
        dataMap.put("dayXsiaData",dayXsiaDataBar);
        Map<Integer, BigDecimal> previousYearFlowMap = previousYearFlowList.stream().collect(Collectors.toMap(SiteMonthFlow::getInMonth, SiteMonthFlow::getTotalFlowPerMonth));
//        dataMap.put("dayYsiaDataA",previousYearFlowList.stream().map(x -> x.getTotalFlowPerMonth()).collect(Collectors.toList()).toArray());
//        dataMap.put("dayYsiaDataB",currentYearFlowList.stream().map(x -> x.getTotalFlowPerMonth()).collect(Collectors.toList()).toArray());
        dataMap.put("dayYsiaDataA", Arrays.stream(dayXsiaData).map(x->previousYearFlowMap.getOrDefault(x,new BigDecimal(0))).collect(Collectors.toList()).toArray());

        Map<Integer, BigDecimal> currentYearFlowMap = currentYearFlowList.stream().collect(Collectors.toMap(SiteMonthFlow::getInMonth, SiteMonthFlow::getTotalFlowPerMonth));
        dataMap.put("dayYsiaDataB", Arrays.stream(dayXsiaData).map(x->currentYearFlowMap.getOrDefault(x,new BigDecimal(0))).collect(Collectors.toList()).toArray());
        return JSONObject.toJSONString(dataMap);
    }

    /**
     * 干渠引水量
     * @param canalCode
     * @return
     */
    @RequestMapping(value = "/main_channel_consumption_query", produces =  "text/html; charset=utf-8")
    public @ResponseBody String mainChannelConsumptionQuery(String canalCode){

        //查询干渠数量
        List<CalCanalInfo> mainCanalList = calCanalInfoService.findSubsetInfoByCanalCode(canalCode);
        List<CalCanalInfo> branchCanalListAll = new ArrayList<>();
        //查询支渠
        for (CalCanalInfo Info : mainCanalList) {
            List<CalCanalInfo> branchCanalList = calCanalInfoService.findSubsetInfoByCanalCode(Info.getCanalCode());
            branchCanalListAll.addAll(branchCanalList);
        }
        List<CalCanalInfo> branchCanalListAll_xinba = new ArrayList<>();
        if("620810000000".equals(canalCode)){//新坝灌区时
            for (CalCanalInfo Info : branchCanalListAll) {
                List<CalCanalInfo> branchCanalList = calCanalInfoService.findSubsetInfoByCanalCode(Info.getCanalCode());
                branchCanalListAll_xinba.addAll(branchCanalList);
            }
        }
        //查询提灌 TODO

        //各干渠年引水量
        Map<String, Object> map = new HashedMap();
        map.put("canalCode", canalCode);
        map.put("year", CommonMethodUtils.timeFormatter(new Date(),"year"));
        List<SiteMonthFlow> currentYearFlowList = siteMonthFlowService.selectCountYearFlowGroupByWaterCode(map);
        //该灌区引水总量
        BigDecimal irrigationTotalFlow = currentYearFlowList.stream().map(SiteMonthFlow::getYearSumFlow).reduce(BigDecimal.ZERO, BigDecimal::add);
        if(irrigationTotalFlow.compareTo(new BigDecimal(0)) !=0){
            currentYearFlowList.forEach(x->{
                //计算该渠道占灌区总引水量百分比
               x.setPercentage(x.getYearSumFlow().divide(irrigationTotalFlow,2,BigDecimal.ROUND_HALF_UP).multiply(new BigDecimal(100)).toString());
            });
        }
        //数据封装
        Map<String, Object> dataMap = new HashedMap();
        if("620810000000".equals(canalCode)) {//新坝灌区时
            dataMap.put("mainCanalNum",branchCanalListAll.size());//干渠
            dataMap.put("branchCanalNum",branchCanalListAll_xinba.size());//支渠
        }else{
            dataMap.put("mainCanalNum",mainCanalList.size());//干渠
            dataMap.put("branchCanalNum",branchCanalListAll.size());//支渠
        }
        dataMap.put("liftIrrigationNum",0);//提灌
        dataMap.put("irrigationDistrictList",currentYearFlowList);//灌区下各干渠引水量数组
        dataMap.put("irrigationTotalFlow",irrigationTotalFlow);//灌区下各干渠引水量数组
        return JSONObject.toJSONString(dataMap);
    }


    /**
     * 库水位库容日变化曲线图
     * @return
     */
    @RequestMapping(value = "/reservoir_capacity_day_change", produces =  "text/html; charset=utf-8")
    public @ResponseBody String reservoirCapacityDayChange(String reservoirCode){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        List<ReservoirLevel> reservoirLevelList = reservoirLevelService.selectLevelAndCapacityByCode(reservoirCode,dateFormat.format(new Date()));
        //数据封装
        Map<String, Object> dataMap = new HashedMap();
        dataMap.put("legend",new String[]{"库水位日变化曲线图","库容日变化曲线图"});
        dataMap.put("dayXsiaData",reservoirLevelList.stream().map(x->x.getHour()+":00-"+ (Integer.parseInt(x.getHour())+1)+":00").collect(Collectors.toList()).toArray());
        dataMap.put("dayYsiaDataA",reservoirLevelList.stream().map(x->x.getWaterlevelAvgPerHour()).collect(Collectors.toList()).toArray());
        dataMap.put("dayYsiaDataB",reservoirLevelList.stream().map(x->x.getCapacityAvgPerHour()).collect(Collectors.toList()).toArray());
        return JSONObject.toJSONString(dataMap);
    }

    /**
     * 较上年库容日比较柱状图
     * @return
     */
    @RequestMapping(value = "/reservoir_capacity_day_compare", produces =  "text/html; charset=utf-8")
    public @ResponseBody String reservoirCapacityDayCompare(String reservoirCode){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();//得到一个Calendar的实例
        Date currentDate = new Date();
        cal.setTime(currentDate); //设置时间为当前时间
        List<ReservoirLevel> curReservoirLevelList = reservoirLevelService.selectLevelAndCapacityByCode(reservoirCode,dateFormat.format(currentDate));

        //获取前一年
        cal.add(Calendar.YEAR,-1);
        Date previousDate = cal.getTime();
        List<ReservoirLevel> preReservoirLevelList = reservoirLevelService.selectLevelAndCapacityByCode(reservoirCode,dateFormat.format(previousDate));
        //数据封装
        dateFormat = new SimpleDateFormat("yyyy年MM月dd日");
        Map<String, Object[]> dataMap = new HashedMap();
        dataMap.put("legend",new String[]{dateFormat.format(previousDate),dateFormat.format(currentDate)});
        dataMap.put("dayXsiaData",curReservoirLevelList.stream().map(x->x.getHour()+":00-"+ (Integer.parseInt(x.getHour())+1)+":00").collect(Collectors.toList()).toArray());
        dataMap.put("dayYsiaDataA",preReservoirLevelList.stream().map(x->x.getCapacityAvgPerHour()).collect(Collectors.toList()).toArray());
        dataMap.put("dayYsiaDataB",curReservoirLevelList.stream().map(x->x.getCapacityAvgPerHour()).collect(Collectors.toList()).toArray());

        return JSONObject.toJSONString(dataMap);
    }

    /**
     * 来水预测
     * @param canalCode
     * @return
     */
    @RequestMapping(value="/water_flow_predict_query",produces = "text/html; charset=utf-8")
    public @ResponseBody String waterFlowPredictQuery(String canalCode){
        List<ForecastWater> forecastWaterInfos = forecastWaterService.findForecastWaterByCanalCode(canalCode);
        List<ForecastWaterTable> forecastWaterTableInfos = null;
        if(forecastWaterInfos.size()>0){
            ForecastWater forecastWater = forecastWaterInfos.get(0);
            forecastWaterTableInfos = forecastWaterService.findForecastWaterTableByForecastId(forecastWater.getId());
        }

        //数据封装
        Map<String, Object[]> dataMap = new HashedMap();
        dataMap.put("legend",new String[]{"上旬","中旬","下旬"});
        dataMap.put("dayXsiaData",new String[]{"1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"});
        if(forecastWaterTableInfos != null){
            dataMap.put("dayYsiaDataA",forecastWaterTableInfos.stream().map(x->x.getEarlyTen()).collect(Collectors.toList()).toArray());
            dataMap.put("dayYsiaDataB",forecastWaterTableInfos.stream().map(x->x.getMiddleTen()).collect(Collectors.toList()).toArray());
            dataMap.put("dayYsiaDataC",forecastWaterTableInfos.stream().map(x->x.getLastTen()).collect(Collectors.toList()).toArray());
        }else{
            Integer dataArr[] = new Integer[]{0,0,0,0,0,0,0,0,0,0,0,0};
            dataMap.put("dayYsiaDataA",dataArr);
            dataMap.put("dayYsiaDataB",dataArr);
            dataMap.put("dayYsiaDataC",dataArr);
        }
        return JSONObject.toJSONString(dataMap);
    }


    /**
     * 需水与配水管理
     * @param canalCode
     * @return
     */
    @RequestMapping(value="/water_require_plan_query",produces = "text/html; charset=utf-8")
    public @ResponseBody String waterRequireAndPlanQuery(String canalCode){
        List<WaterPlanNew> waterPlanNewInfos = waterPlanNewService.findWaterPlanByCanalCode(canalCode);
        WaterPlanNew waterPlanNew = new WaterPlanNew();
        waterPlanNew.setRealityArea(new BigDecimal(0));
        waterPlanNew.setNeedReservoirWaterAmount(new BigDecimal(0));
        Iterator<WaterPlanNew> iterator = waterPlanNewInfos.iterator();
        while (iterator.hasNext()) {
            WaterPlanNew waterPlanNewCopy = iterator.next();
            if(waterPlanNewCopy.getRealityArea().compareTo(waterPlanNew.getRealityArea()) > 0){
                waterPlanNew = waterPlanNewCopy;
            }
        }
        return JSONObject.toJSONString(waterPlanNew);
    }

    /**
     * 站点监测模块
     * @param downSelectVal
     * @param index
     * @return
     */
    @RequestMapping(value = "/site_monitor_query", produces =  "text/html; charset=utf-8")
    public @ResponseBody String siteMonitorQuery(String downSelectVal, int index, HttpServletRequest request){
        SimpleDateFormat dateFormat = new SimpleDateFormat(FORMATTER_YMD_HMS);
        //水位站点实体
        List<SiteWaterInfo> siteWaterlist = new ArrayList<>();
        //行政区实体
        SysArea sysArea = new SysArea();
        String[] siteMonitorThead2;
        Object[] siteMonitorTbody;
        //站点监测模块数据
        List<Object[]> siteMonitorList = new ArrayList<>();
        //返回map数据
        Map<String, Object> dataMap = new HashMap<>();
        //查询站点信息
        switch (index){
            case 0://雷达站
                //设置表头
                siteMonitorThead2 = new String[]{"站点名称","设备状态","水位","流量","上传时间"};
                List<SiteWaterInfo> radarSiteInfos = new ArrayList<>();
                radarSiteInfos = (List<SiteWaterInfo>) request.getSession().getAttribute("radarSiteInfos");
                if (!downSelectVal.equals(request.getSession().getAttribute("downSelectVal"))
                        || radarSiteInfos == null || radarSiteInfos.size() == 0) {
                    siteWaterlist = siteWaterService.findSiteWaterByCanalCodesJoin(downSelectVal);
                    radarSiteInfos = siteWaterlist.stream().filter(x -> 5 == x.getSiteType() || 12 == x.getSiteType()).collect(Collectors.toList());
                    //将雷达站点信息保存到Session
                    request.getSession().setAttribute("radarSiteInfos",radarSiteInfos);
                    //遍历出明渠设备
                    List<SiteWaterInfo> openChannelSiteInfos = siteWaterlist.stream().filter(x -> 8 == x.getSiteType()).collect(Collectors.toList());
                    //将明渠站点信息保存到Session
                    request.getSession().setAttribute("openChannelSiteInfos",openChannelSiteInfos);
                }
                for (SiteWaterInfo info : radarSiteInfos) {
                    siteMonitorTbody = new Object[]{info.getDeviceWaterName(),"0".equals(info.getType())?"离线":"在线", info.getWaterLevel(), info.getInstantFlow(), dateFormat.format(info.getUploadTime())};
                    siteMonitorList.add(siteMonitorTbody);
                }
                //封装数据
                dataMap.put("siteMonitorThead2",siteMonitorThead2);
                break;
            case 1://明渠站
                //设置表头
                siteMonitorThead2 = new String[]{"站点名称","设备状态","水位","流量","上传时间"};
                List<SiteWaterInfo> openChannelInfos = new ArrayList<>();
                openChannelInfos = (List<SiteWaterInfo>) request.getSession().getAttribute("openChannelSiteInfos");
                if (!downSelectVal.equals(request.getSession().getAttribute("downSelectVal"))
                        || openChannelInfos == null || openChannelInfos.size() == 0) {
                    siteWaterlist = siteWaterService.findSiteWaterByCanalCodesJoin(downSelectVal);
                    openChannelInfos = siteWaterlist.stream().filter(x -> 8 == x.getSiteType()).collect(Collectors.toList());
                    //将明渠站点信息保存到Session
                    request.getSession().setAttribute("openChannelSiteInfos",openChannelInfos);
                }
                for (SiteWaterInfo info : openChannelInfos) {
                    siteMonitorTbody = new Object[]{info.getDeviceWaterName(),"0".equals(info.getType())?"离线":"在线", info.getWaterLevel(), info.getInstantFlow(), dateFormat.format(info.getUploadTime())};
                    siteMonitorList.add(siteMonitorTbody);
                }
                //封装数据
                dataMap.put("siteMonitorThead2",siteMonitorThead2);
                break;
            case 2://视频站
                List<SiteVideoInfo> siteVideoInfos = null;
                //设置表头
                siteMonitorThead2 = new String[]{"站点名称","设备类型","物联网卡号","安装位置","安装时间"};
                siteVideoInfos = (List<SiteVideoInfo>) request.getSession().getAttribute("siteVideoInfos");
                //Session中存在数据
                if(!downSelectVal.equals(request.getSession().getAttribute("downSelectVal"))
                        || siteVideoInfos == null || siteVideoInfos.size() == 0){
                    siteVideoInfos = siteVideoInfoService.findSiteVideoByCanalCodeJoin(downSelectVal);
                    //将视频信息保存到Session
                    request.getSession().setAttribute("siteVideoInfos",siteVideoInfos);
                }
                for (SiteVideoInfo info : siteVideoInfos) {
                    siteMonitorTbody = new Object[]{info.getDeviceVideoName(),info.getDevicemodelName(), info.getComm1(), info.getSviAddr(), dateFormat.format(info.getSviBuildTime())};
                    siteMonitorList.add(siteMonitorTbody);
                }
                //封装数据
                dataMap.put("siteMonitorThead2",siteMonitorThead2);
                break;
            case 3://闸门站
                List<SiteSluiceGateInfo> siteSluiceGateInfos = new ArrayList<>();
                //设置表头
                siteMonitorThead2 = new String[]{"闸门名称","所属闸门站","闸门状态","当前开度","上传时间"};
                siteSluiceGateInfos = (List<SiteSluiceGateInfo>) request.getSession().getAttribute("siteSluiceGateInfos");
                if(!downSelectVal.equals(request.getSession().getAttribute("downSelectVal"))
                        || siteSluiceGateInfos == null || siteSluiceGateInfos.size() == 0){
                    siteSluiceGateInfos = new ArrayList<>();
                    //查询符合条件的闸门站
                    List<SiteSluiceInfo> siteSluiceInfoList = siteSluiceService.findSiteSluiceInfoByCanalCodeJoin(downSelectVal);
                    //查询所有闸门
                    List<SiteSluiceGateInfo> siteSluiceGateInfoAll= siteSluiceGateInfoService.findSluiceGateAndSluiceJzMiddDevice();

                    for (SiteSluiceInfo sluiceInfo : siteSluiceInfoList) {
                        for (SiteSluiceGateInfo siteSluiceGateInfo : siteSluiceGateInfoAll) {
                            if(sluiceInfo.getId().equals(siteSluiceGateInfo.getSsgiSluiceInfoId())){
                                if(siteSluiceGateInfo.getSiteSluiceJzMiddDevice() == null){
                                    siteSluiceGateInfo.setSiteSluiceJzMiddDevice(new SiteSluiceJzMiddDevice());
                                }
                                siteSluiceGateInfos.add(siteSluiceGateInfo);
                            }
                        }
                    }
                    //将闸门信息保存到Session
                    request.getSession().setAttribute("siteSluiceGateInfos",siteSluiceGateInfos);
                }
                for (SiteSluiceGateInfo info : siteSluiceGateInfos) {
                    siteMonitorTbody = new Object[]{info.getSsgiSluiceGateName(),info.getSsgiSluiceInfoName(), "0".equals(info.getSiteSluiceJzMiddDevice().getSsjmdSluicGateType())?"离线":"在线",
                            info.getSiteSluiceJzMiddDevice().getSsjmdSluiceHeight(), dateFormat.format(info.getSiteSluiceJzMiddDevice().getSsjmdModifyTime()==null?new Date():info.getSiteSluiceJzMiddDevice().getSsjmdModifyTime())};
                    siteMonitorList.add(siteMonitorTbody);
                }
                //封装数据
                dataMap.put("siteMonitorThead2",siteMonitorThead2);
                break;
            case 4://水质监测站
                List<WaterSurveySite> waterSurveySiteList = new ArrayList<>();
                //设置表头
                siteMonitorThead2 = new String[]{"站点名称","站点高程","水质等级","站点地址","创建时间"};
                waterSurveySiteList = (List<WaterSurveySite>) request.getSession().getAttribute("waterSurveySiteList");
                if(!downSelectVal.equals(request.getSession().getAttribute("downSelectVal"))
                        || waterSurveySiteList == null || waterSurveySiteList.size() == 0){
                    sysArea = sysAreaService.selectByPrimaryKey(downSelectVal);
                    getCode(downSelectVal);
                    sysAreaCode.add(sysArea.getAreaCode());
                    waterSurveySiteList = waterSurveySiteService.selectArea(sysAreaCode);
                    sysAreaCode.clear();

                    //将水质监测站信息保存到Session
                    request.getSession().setAttribute("waterSurveySiteList",waterSurveySiteList);
                }
                for (WaterSurveySite info : waterSurveySiteList) {
                    siteMonitorTbody = new Object[]{info.getMonitorName(),info.getElevation(), waterGradeMap.get(info.getWaterGrade()), info.getMonitorAddress(), dateFormat.format(info.getBuildTime())};
                    siteMonitorList.add(siteMonitorTbody);
                }
                //封装数据
                dataMap.put("siteMonitorThead2",siteMonitorThead2);
                break;
            case 5://气象站
                List<MeteorSurveySite> meteorSurveySiteList = new ArrayList<>();
                //设置表头
                siteMonitorThead2 = new String[]{"站点名称","站点高程","设备卡号","站点地址","创建时间"};
                meteorSurveySiteList = (List<MeteorSurveySite>) request.getSession().getAttribute("meteorSurveySiteList");
                if(!downSelectVal.equals(request.getSession().getAttribute("downSelectVal"))
                        || meteorSurveySiteList == null || meteorSurveySiteList.size() == 0){
                    sysArea = sysAreaService.selectByPrimaryKey(downSelectVal);
                    getCode(downSelectVal);
                    sysAreaCode.add(sysArea.getAreaCode());
                    meteorSurveySiteList = meteorSurveySiteService.selectAdministrativeCoding(sysAreaCode);
                    sysAreaCode.clear();
                    //将水质监测站信息保存到Session
                    request.getSession().setAttribute("meteorSurveySiteList",meteorSurveySiteList);
                }
                for (MeteorSurveySite info : meteorSurveySiteList) {
                    siteMonitorTbody = new Object[]{info.getMeteorName(),info.getElevation(), info.getSimClip(), info.getMonitorAddress(), dateFormat.format(info.getBuildTime())};
                    siteMonitorList.add(siteMonitorTbody);
                }
                //封装数据
                dataMap.put("siteMonitorThead2",siteMonitorThead2);
                break;
            case 6://墒情站
                List<MoistureSurveySite> moistureSurveySiteList = new ArrayList<>();
                //设置表头
                siteMonitorThead2 = new String[]{"站点名称","站点高程","设备卡号","站点地址","创建时间"};
                moistureSurveySiteList = (List<MoistureSurveySite>) request.getSession().getAttribute("moistureSurveySiteList");
                if(!downSelectVal.equals(request.getSession().getAttribute("downSelectVal"))
                        || moistureSurveySiteList == null || moistureSurveySiteList.size() == 0){
                    sysArea = sysAreaService.selectByPrimaryKey(downSelectVal);
                    getCode(downSelectVal);
                    sysAreaCode.add(sysArea.getAreaCode());
                    moistureSurveySiteList = moistureSurveySiteService.selectArea(sysAreaCode);
                    sysAreaCode.clear();
                    //将水质监测站信息保存到Session
                    request.getSession().setAttribute("moistureSurveySiteList",moistureSurveySiteList);
                }
                for (MoistureSurveySite info : moistureSurveySiteList) {
                    siteMonitorTbody = new Object[]{info.getMoistureName(),info.getElevation(), info.getSimClip(), info.getMoistureAddress(), dateFormat.format(info.getBuildTime())};
                    siteMonitorList.add(siteMonitorTbody);
                }
                //封装数据
                dataMap.put("siteMonitorThead2",siteMonitorThead2);
                break;
            case 7://蒸发站
                List<EvaporateSurveySite> evaporateSurveySiteList = new ArrayList<>();
                //设置表头
                siteMonitorThead2 = new String[]{"站点名称","站点高程","设备卡号","站点地址","创建时间"};
                evaporateSurveySiteList = (List<EvaporateSurveySite>) request.getSession().getAttribute("evaporateSurveySiteList");
                if(!downSelectVal.equals(request.getSession().getAttribute("downSelectVal"))
                        || evaporateSurveySiteList == null || evaporateSurveySiteList.size() == 0){
                    sysArea = sysAreaService.selectByPrimaryKey(downSelectVal);
                    getCode(downSelectVal);
                    sysAreaCode.add(sysArea.getAreaCode());
                    evaporateSurveySiteList = evaporateSurveySiteService.selectArea(sysAreaCode);
                    sysAreaCode.clear();
                    //将水质监测站信息保存到Session
                    request.getSession().setAttribute("evaporateSurveySiteList",evaporateSurveySiteList);
                }
                for (EvaporateSurveySite info : evaporateSurveySiteList) {
                    siteMonitorTbody = new Object[]{info.getEvaporateName(),info.getElevation(), info.getSimClip(), info.getEvaporateAddress(), dateFormat.format(info.getBuildTime())};
                    siteMonitorList.add(siteMonitorTbody);
                }
                //封装数据
                dataMap.put("siteMonitorThead2",siteMonitorThead2);
                break;
        }
        //封装数据
        dataMap.put("siteMonitorList",siteMonitorList);
        //保存当前下拉选val值
        request.getSession().setAttribute("downSelectVal",downSelectVal);
        return JSONObject.toJSONString(dataMap);
    }

    /**
     * 行政区递归
     * @param id
     */
    private void getCode(String id){
        List<SysArea> sa = sysAreaService.selectParentId(id);
        if(sa!=null&&sa.size()>0){
            for(SysArea as:sa){
                sysAreaCode.add(as.getAreaCode());
                getCode(as.getId());
            }
        }
    }

    /**
     * 配置页面数据查询
     * @param sign
     * @return
     */
    @RequestMapping(value = "/selTyQuery", produces =  "text/html; charset=utf-8")
    @ResponseBody
    public String selTyQuery(String sign){
        Map<String,Object> pageInfo = new HashMap<>();
        try {
            pageInfo.put("reserList",null);
            pageInfo.put("waterCourse",null);
        }catch(Exception ex){
             ex.printStackTrace();
        }
        return JSONObject.toJSONString(pageInfo);
    }
}
