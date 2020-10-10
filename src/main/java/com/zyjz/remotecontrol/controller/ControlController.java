package com.zyjz.remotecontrol.controller;

import com.alibaba.fastjson.JSONObject;
import com.zyjz.remotecontrol.entity.SiteSluiceControlOperationRecord;
import com.zyjz.remotecontrol.entity.SiteSluiceGateInfo;
import com.zyjz.remotecontrol.entity.SiteSluiceJzMiddDevice;
import com.zyjz.remotecontrol.service.SiteSluiceControlOperationRecordService;
import com.zyjz.remotecontrol.service.SiteSluiceGateInfoService;
import com.zyjz.site.service.SiteSluiceDynamicInfoService;
import com.zyjz.sysmanage.entity.SiteSluiceInfo;
import com.zyjz.sysmanage.service.SiteSluiceService;
import com.zyjz.sysmanage.service.SiteSluiceTypeService;
import com.zyjz.user.entity.SysUser;
import com.zyjz.video.entity.SiteVideoInfo;
import com.zyjz.video.service.SiteVideoInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RequestMapping("/remote_control")
@Controller
public class ControlController {

    @Autowired
    SiteSluiceService siteSluiceService;

    @Autowired
    SiteSluiceGateInfoService siteSluiceGateInfoService;

    @Autowired
    SiteVideoInfoService siteVideoInfoService;

    @Autowired
    SiteSluiceDynamicInfoService siteSluiceDynamicInfoService;

    @Autowired
    SiteSluiceControlOperationRecordService siteSluiceControlOperationRecordService;

    @Autowired
    SiteSluiceTypeService siteSluiceTypeService;

    /**
     * 远程闸门控制
     */
    @RequestMapping("/gate_index")
    public String gateIndex(){
        return "/remotecontrol/gateControl/index";
    }

    @RequestMapping(value = "/sluice_realTime_list", produces = "text/html; charset=utf-8")
    public @ResponseBody String findsluiceRealTimeList(String canalCode){
        //查询符合条件的闸门站
        List<SiteSluiceInfo> siteSluiceInfoList = siteSluiceService.findSiteSluiceInfoByCanalCodeJoin(canalCode);
        //查询所有闸门
        List<SiteSluiceGateInfo> siteSluiceGateInfoList = siteSluiceGateInfoService.findSluiceGateAndSluiceJzMiddDevice();

        List<SiteSluiceGateInfo> gateInfoList = null;
        for (SiteSluiceInfo sluiceInfo : siteSluiceInfoList) {
            gateInfoList = new ArrayList<>();
            for (SiteSluiceGateInfo siteSluiceGateInfo : siteSluiceGateInfoList) {
                if(sluiceInfo.getId().equals(siteSluiceGateInfo.getSsgiSluiceInfoId())){
                    if(siteSluiceGateInfo.getSiteSluiceJzMiddDevice() == null){
                        siteSluiceGateInfo.setSiteSluiceJzMiddDevice(new SiteSluiceJzMiddDevice());
                    }
                    gateInfoList.add(siteSluiceGateInfo);
                }
            }
            sluiceInfo.setSiteSluiceGateInfoList(gateInfoList);
        }
        return JSONObject.toJSONString(siteSluiceInfoList);
    }

    /**
     * 闸门站视频信息
     * @param id
     * @return
     */
    @RequestMapping(value = "/sluice_video_info", produces = "text/html; charset=utf-8")
    public @ResponseBody String getVideoLiveInfo(String id){
        List<SiteVideoInfo> siteVideoInfoList = new ArrayList<>();
        //切分视频id
        String[] split = id.split(",");
        for (String s : split) {
            SiteVideoInfo siteVideoInfo = siteVideoInfoService.selectByPrimaryKey(s);
            siteVideoInfoList.add(siteVideoInfo);
        }
        return JSONObject.toJSONString(siteVideoInfoList);
    }

    /**
     * 远程闸门控制状态更新
     * @param data 当前闸门实时数据
     * @return
     */
/*    @RequestMapping("/remote_status_update")
    public @ResponseBody String updateRemoteControlStatus(String data){
        if(!"".equals(data)) {
            SiteSluiceDynamicInfo siteSluiceDynamicInfo = JSONObject.parseObject(data, SiteSluiceDynamicInfo.class);
            //将当前开度设置为远程控制后的开度
            siteSluiceDynamicInfo.setSsdiCollectTime(new Date());
            siteSluiceDynamicInfo.setSsdiCreateTime(new Date());
            return siteSluiceDynamicInfoService.insertSelective(siteSluiceDynamicInfo) + "";
        }
        return "0";
    }*/

    /**
     *
     * @param data
     * @param sluiceHeightChangeBefore
     * @return
     */
    @RequestMapping("/remote_operation_record_update")
    public @ResponseBody String updateRemoteControlOperationRecord(HttpServletRequest request, String data, String sluiceHeightChangeBefore, String sluiceChangeType){
        SysUser sysUser = (SysUser) request.getSession().getAttribute("sysUser");
        if(!"".equals(data)) {
            SiteSluiceGateInfo siteSluiceGateInfo = JSONObject.parseObject(data, SiteSluiceGateInfo.class);
            SiteSluiceControlOperationRecord operationRecord = new SiteSluiceControlOperationRecord();
            operationRecord.setSscorSluiceCode(siteSluiceGateInfo.getSsgiSluiceGateCode());
            operationRecord.setSscorSluiceName(siteSluiceGateInfo.getSsgiSluiceGateName());
            operationRecord.setSluiceHeightChangeBefore(new BigDecimal(sluiceHeightChangeBefore));
            operationRecord.setSluiceHeightChangeAfter(siteSluiceGateInfo.getSiteSluiceJzMiddDevice().getSsjmdSluiceHeight());
            operationRecord.setSluiceChangeType(sluiceChangeType);
            operationRecord.setSluiceOperatorName(sysUser.getRealName());
            operationRecord.setSluiceOperatorCode(sysUser.getUserName());
            operationRecord.setOperatorIp(request.getRemoteAddr());
            operationRecord.setOperatorSource(0);
            operationRecord.setSscorCreateTime(new Date());
            return siteSluiceControlOperationRecordService.insertSelective(operationRecord) + "";
        }
        return "0";
    }

    @RequestMapping(value = "/sluice_condition_query",produces = "text/html; charset=utf-8")
    public @ResponseBody String sluiceConditionQuery(String canalCode, String code, String name, HttpServletRequest request){

        if("".equals(canalCode) || canalCode == null){
            SysUser sysUser = (SysUser) request.getSession().getAttribute("sysUser");
            canalCode = sysUser.getCanalCode();
        }

        //查询符合条件的闸门站
        List<SiteSluiceInfo> siteSluiceInfoList = siteSluiceService.findSiteSluiceInfoByCanalCodeByCodeOrName(canalCode, code, name);
        //查询所有闸门
        List<SiteSluiceGateInfo> siteSluiceGateInfoList = siteSluiceGateInfoService.findSluiceGateAndSluiceJzMiddDevice();

        List<SiteSluiceGateInfo> gateInfoList = null;
        for (SiteSluiceInfo sluiceInfo : siteSluiceInfoList) {
            gateInfoList = new ArrayList<>();
            for (SiteSluiceGateInfo siteSluiceGateInfo : siteSluiceGateInfoList) {
                if(sluiceInfo.getId().equals(siteSluiceGateInfo.getSsgiSluiceInfoId())){
                    if(siteSluiceGateInfo.getSiteSluiceJzMiddDevice() == null){
                        siteSluiceGateInfo.setSiteSluiceJzMiddDevice(new SiteSluiceJzMiddDevice());
                    }
                    gateInfoList.add(siteSluiceGateInfo);
                }
            }
            sluiceInfo.setSiteSluiceGateInfoList(gateInfoList);
        }
        return JSONObject.toJSONString(siteSluiceInfoList);
    }

    @RequestMapping(value = "/user_info", produces =  "text/html; charset=utf-8")
    public @ResponseBody String getUserInfo(HttpServletRequest request){
        SysUser sysUser = (SysUser) request.getSession().getAttribute("sysUser");
        return JSONObject.toJSONString(sysUser);
    }

}
