package com.zyjz.bigdata.controller;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.zyjz.bigdata.entity.BigDataConfig;
import com.zyjz.bigdata.service.BigDataConfigService;
import com.zyjz.utils.CommonMethodUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/big_data_config")
public class BigDataConfigurationController {

    @Autowired
    BigDataConfigService BigDataConfigService;

    /**
     * 配置页（需水配水）
     *
     * @return
     */
    @RequestMapping(value = "/requiteModule")
    public String requiteModule() {
        return "/big_data/requiteModule";
    }

    /**
     * 配置页（需水配水）
     *
     * @return
     */
    @RequestMapping(value = "/comeWaterModule")
    public String comeWaterModule() {
        return "/big_data/comeWaterModule";
    }

    /**
     * 水库水源/河道水源
     *
     * @return
     */
    @RequestMapping(value = "/config_data_query", produces = "text/html; charset=utf-8")
    public @ResponseBody String bigdataConfigListQuery() {
        List<BigDataConfig> bigDataConfigs = BigDataConfigService.selectAll();
        //水库水源
        List<BigDataConfig> reservoirList = bigDataConfigs.stream().filter(x -> 0 == x.getType()).collect(Collectors.toList());
        //河道水源
        List<BigDataConfig> waterCourseList = bigDataConfigs.stream().filter(x -> 1 == x.getType()).collect(Collectors.toList());

        BigDecimal reservoirReduce = reservoirList.stream().map(x -> x.getRestWater()).reduce(new BigDecimal(0), BigDecimal::add);
        BigDecimal waterCourseReduce = waterCourseList.stream().map(x -> x.getRestWater()).reduce(new BigDecimal(0), BigDecimal::add);

        reservoirList.forEach(x->x.setSumWater(reservoirReduce));

        waterCourseList.forEach(x->x.setSumWater(waterCourseReduce));

        Map<String, List<BigDataConfig>> dataMap = new HashMap<>();
        dataMap.put("reservoirList", reservoirList);
        dataMap.put("waterCourseList", waterCourseList);
        return JSONObject.toJSONString(dataMap);
    }

    /**
     * 新增和查询
     * @return
     */
    @RequestMapping(value="/enWscInsert")
    @ResponseBody
    public int enWscInsert(String reservoirList, String waterCourseList,String reservoirDrp,String waterDrp,HttpServletRequest request){
        Date localDate = new Date();
        int countNum = 0;
        try {
            if(StringUtils.isNotBlank(reservoirList)){//水库
                List<BigDataConfig> reseList = JSONArray.parseArray(reservoirList,BigDataConfig.class);
                if(reseList.size()>0){
                    for(BigDataConfig bc:reseList){
                        bc.setType(0);
                        bc.setDrp(new BigDecimal(reservoirDrp));
                        bc.setYear(String.valueOf(CommonMethodUtils.timeFormatter(localDate,"year")));
                        bc.setCreateTime(localDate);
                        if(StringUtils.isNotBlank(bc.getRestName())){
                            countNum =  bc.getId()==null?BigDataConfigService.insertSelective(bc): BigDataConfigService.updateByPrimaryKeySelective(bc);
                        }
                    }
                }
            }
            if(StringUtils.isNotBlank(waterCourseList)){//河道
                List<BigDataConfig> waterList = JSONArray.parseArray(waterCourseList,BigDataConfig.class);
                if(waterList.size()>0){
                    for(BigDataConfig bc:waterList){
                        bc.setType(1);
                        bc.setDrp(new BigDecimal(waterDrp));
                        bc.setYear(String.valueOf(CommonMethodUtils.timeFormatter(localDate,"year")));
                        bc.setCreateTime(localDate);
                        if(StringUtils.isNotBlank(bc.getRestName())){
                            countNum =  bc.getId()==null?BigDataConfigService.insertSelective(bc): BigDataConfigService.updateByPrimaryKeySelective(bc);
                        }
                    }
                }
            }

        }catch (Exception ex){
            countNum = -1;
        }
        return countNum;
    }


    /**
     * 下拉选点击查询
     * @param id
     * @return
     */
   /* @RequestMapping(value = "/config_data_query", produces = "text/html; charset=utf-8")
    public @ResponseBody String configDataQuery(String id){
        BigDataConfig configData = BigDataConfigService.selectByPrimaryKey(Integer.valueOf(id));
        return JSONObject.toJSONString(configData);
    }*/

    /**
     * 配置页面数据新增
     *
     * @param config
     * @param type
     * @return
     */
    @RequestMapping(value = "/water_moniter_add")
    public @ResponseBody String waterMoniterAdd(BigDataConfig config, String type) {
        config.setType(Integer.valueOf(type));
        int i = BigDataConfigService.insertSelective(config);
        return String.valueOf(i);
    }

    /**
     * 配置页面数据修改
     *
     * @param config
     * @param type
     * @return
     */
    @RequestMapping(value = "/water_moniter_update")
    public @ResponseBody String waterMoniterUpdate(BigDataConfig config, String type) {
        config.setType(Integer.valueOf(type));
        int i = BigDataConfigService.updateByPrimaryKeySelective(config);
        return String.valueOf(i);
    }

    /**
     * 配置页面数据删除
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/water_moniter_delete")
    public @ResponseBody String waterMoniterDelete(int id) {
        int i = BigDataConfigService.deleteByPrimaryKey(id);
        return String.valueOf(i);
    }

}
