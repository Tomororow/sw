package com.zyjz.remotecontrol.controller;

import com.alibaba.fastjson.JSONObject;
import com.zyjz.remotecontrol.entity.SiteSluiceControlOperationRecord;
import com.zyjz.remotecontrol.entity.SiteSluiceControlOperationRecordExcel;
import com.zyjz.remotecontrol.entity.SiteSluiceGateInfo;
import com.zyjz.remotecontrol.service.SiteSluiceControlOperationRecordService;
import com.zyjz.site.entity.SiteSluiceDynamicInfoExcel;
import com.zyjz.sysmanage.entity.SiteSluiceInfo;
import com.zyjz.sysmanage.service.SiteSluiceService;
import com.zyjz.user.entity.SysUser;
import com.zyjz.utils.ExportExcel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 远程闸门控制操作记录
 */
@Controller
@RequestMapping("/site_sluice_operation")
public class SiteSluiceControlOperationRecordController {

    @Autowired
    SiteSluiceControlOperationRecordService siteSluiceControlOperationRecordService;

    @Autowired
    SiteSluiceService siteSluiceService;

    protected static final String INDEX_JSP = "/remotecontrol/gate_control_operation_record/index";

    @RequestMapping("/operation_record_index")
    public String operationRecordIndex(){
        return INDEX_JSP;
    }

    /**
     * 按渠道查询闸门操作记录
     * @return
     */
    @RequestMapping(value = "/operation_record_query",produces = "text/html; charset=utf-8")
    public @ResponseBody String operationRecordLatestQuery(String canalCode){
        //查询符合条件的闸门站
        List<SiteSluiceInfo> siteSluiceInfoList = siteSluiceService.findSiteSluiceInfoByCanalCodeJoin(canalCode);

        List<SiteSluiceControlOperationRecord> operationRecordList = siteSluiceControlOperationRecordService.selectLatestOperationRecord();

        List<SiteSluiceControlOperationRecord> operationRecordListCopy = null;
        for(SiteSluiceInfo sluiceInfo : siteSluiceInfoList){
            operationRecordListCopy = new ArrayList<>();
            for (SiteSluiceControlOperationRecord record : operationRecordList) {
                if(record.getSiteSluiceGateInfo() != null
                        && sluiceInfo.getId().equals(record.getSiteSluiceGateInfo().getSsgiSluiceInfoId())){
                    operationRecordListCopy.add(record);
                }
            }
            sluiceInfo.setSiteSluiceControlOperationRecordList(operationRecordListCopy);
        }
        return JSONObject.toJSONString(siteSluiceInfoList);
    }

    /**
     * 根据闸门站编码查询闸门操作历史记录
     * @param sscorSluiceCode
     * @return
     */
    @RequestMapping(value = "/operation_history_record_query",produces = "text/html; charset=utf-8")
    public @ResponseBody String operationHistoryRecordQuery(String sscorSluiceCode){
        List<SiteSluiceControlOperationRecord> OperationRecordList = siteSluiceControlOperationRecordService.selectHistoryDataList(sscorSluiceCode);
        //为数据导出操作存储数据
        operationRecordExportList = OperationRecordList;
        return JSONObject.toJSONString(OperationRecordList);
    }

    /**
     * 按日期查询闸门控制操作历史数据
     * @param sscorSluiceCode 闸门站编码
     * @param startTime 开始日期
     * @param endTime 结束日期
     * @return
     */
    @RequestMapping(value = "/operation_history_record_time",produces = "text/html; charset=utf-8")
    public @ResponseBody String operationHistoryRecordQueryByDate(String sscorSluiceCode, String startTime, String endTime){
        Map<String, Object> map = new HashMap<>();
        //渠道编码
        map.put("sscorSluiceCode",sscorSluiceCode);
        //开始日期
        map.put("startTime",startTime);
        //结束日期
        map.put("endTime",endTime);
        List<SiteSluiceControlOperationRecord> OperationRecordList = siteSluiceControlOperationRecordService.selectHistoryDataListByDate(map);
        //为数据导出操作存储数据
        operationRecordExportList = OperationRecordList;
        return JSONObject.toJSONString(OperationRecordList);
    }

    /**
     * 按闸门名称和闸门编码查询闸门操作记录
     * @param canalCode 渠道编码
     * @param code 闸门站编码
     * @param name 闸门站名称
     * @return
     */
    @RequestMapping(value = "/operation_record_condition_query",produces = "text/html; charset=utf-8")
    public @ResponseBody String selectOperationRecordByCodeOrName(String canalCode, String code, String name, HttpServletRequest request){
        if("".equals(canalCode) || canalCode == null){
            SysUser sysUser = (SysUser) request.getSession().getAttribute("sysUser");
            canalCode = sysUser.getCanalCode();
        }
        //查询符合条件的闸门站
        List<SiteSluiceInfo> siteSluiceInfoList = siteSluiceService.findSiteSluiceInfoByCanalCodeByCodeOrName(canalCode,code,name);
        //按闸门名称或闸门编码查询闸门操作记录
        List<SiteSluiceControlOperationRecord> operationRecordList =
                siteSluiceControlOperationRecordService.selectLatestOperationRecord();

        List<SiteSluiceControlOperationRecord> operationRecordListCopy = null;
        for(SiteSluiceInfo sluiceInfo : siteSluiceInfoList){
            operationRecordListCopy = new ArrayList<>();
            for (SiteSluiceControlOperationRecord record : operationRecordList) {
                if(record.getSiteSluiceGateInfo() != null
                        && sluiceInfo.getId().equals(record.getSiteSluiceGateInfo().getSsgiSluiceInfoId())){
                    operationRecordListCopy.add(record);
                }
            }
            sluiceInfo.setSiteSluiceControlOperationRecordList(operationRecordListCopy);
        }
        return JSONObject.toJSONString(siteSluiceInfoList);
    }

    /**
     * 按闸门控制操作人员查询闸门操作记录
     * @param canalCode
     * @param sluiceOperatorName
     * @return
     */
    @RequestMapping(value = "/operation_record_query_operator",produces = "text/html; charset=utf-8")
    public @ResponseBody String selectOperationRecordByOperator(String canalCode, String sluiceOperatorName, HttpServletRequest request){
        if("".equals(canalCode) || canalCode == null){
            SysUser sysUser = (SysUser) request.getSession().getAttribute("sysUser");
            canalCode = sysUser.getCanalCode();
        }
        //查询符合条件的闸门站
        List<SiteSluiceInfo> siteSluiceInfoList = siteSluiceService.findSiteSluiceInfoByCanalCodeJoin(canalCode);
        //按操作人员查询闸门操作记录
        List<SiteSluiceControlOperationRecord> operationRecordList =
                siteSluiceControlOperationRecordService.selectOperationRecordByOperator(sluiceOperatorName);

        List<SiteSluiceControlOperationRecord> operationRecordListCopy = null;
        for(SiteSluiceInfo sluiceInfo : siteSluiceInfoList){
            operationRecordListCopy = new ArrayList<>();
            for (SiteSluiceControlOperationRecord record : operationRecordList) {
                if(record.getSiteSluiceGateInfo() != null
                        && sluiceInfo.getId().equals(record.getSiteSluiceGateInfo().getSsgiSluiceInfoId())){
                    operationRecordListCopy.add(record);
                }
            }
            sluiceInfo.setSiteSluiceControlOperationRecordList(operationRecordListCopy);
        }
        return JSONObject.toJSONString(siteSluiceInfoList);
    }

    /**
     * 闸门历史操作记录报表导出
     * @param sscorSluiceName
     * @param response
     */
    List<SiteSluiceControlOperationRecord> operationRecordExportList = new ArrayList<>();
    @RequestMapping("/operation_history_record_export")
    public void operationHistoryRecordExcelExport(HttpServletResponse response){
        String[] operatorSource = {"web", "微信", "c/s"};
        List<SiteSluiceControlOperationRecordExcel> operationRecordExportExcelList = new ArrayList<>();
        SiteSluiceControlOperationRecordExcel operationRecordExcel = null;
        for (SiteSluiceControlOperationRecord operationRecord : operationRecordExportList) {
            operationRecordExcel = new SiteSluiceControlOperationRecordExcel();
            operationRecordExcel.setId(operationRecord.getId());
            operationRecordExcel.setSscorSluiceCode(operationRecord.getSscorSluiceCode());
            operationRecordExcel.setSscorSluiceName(operationRecord.getSscorSluiceName());
            operationRecordExcel.setSluiceHeightChangeBefore(operationRecord.getSluiceHeightChangeBefore());
            operationRecordExcel.setSluiceHeightChangeAfter(operationRecord.getSluiceHeightChangeAfter());
            operationRecordExcel.setSluiceChangeType(operationRecord.getSluiceChangeType());
            operationRecordExcel.setSluiceOperatorName(operationRecord.getSluiceOperatorName());
            operationRecordExcel.setOperatorIp(operationRecord.getOperatorIp());
            operationRecordExcel.setOperatorSource(operatorSource[operationRecord.getOperatorSource()]);
            operationRecordExcel.setSscorCreateTime(operationRecord.getSscorCreateTime());
            operationRecordExportExcelList.add(operationRecordExcel);
        }

        //闸门状态：0:上升; 1:下降
        operationRecordExportExcelList.parallelStream().forEach(x->x.setSluiceChangeType("1".equals(x.getSluiceChangeType())?"上升":"下降"));
        //Excel导出
        ExportExcel.exportExcel(operationRecordExportExcelList, "闸门控制操作历史数据", "操作记录",
                SiteSluiceControlOperationRecordExcel.class, "闸门控制操作数据统计.xls", response);
    }
}
