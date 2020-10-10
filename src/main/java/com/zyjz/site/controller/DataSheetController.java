package com.zyjz.site.controller;

import com.zyjz.sysmanage.entity.SiteWaterInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zyjz.site.entity.DataSheet;
import com.zyjz.site.entity.DataSheetExcel;
import com.zyjz.site.service.DataSheetService;
import com.zyjz.site.service.SiteWaterDynamicService;
import com.zyjz.sitemanage.web.JsonResult;
import com.zyjz.sysmanage.service.CanalFlowHightService;
import com.zyjz.sysmanage.service.SiteWaterService;
import com.zyjz.utils.ExportExcel;
import com.zyjz.utils.controller.BaseUtils;

@RequestMapping("/data_sheet")
@Controller
public class DataSheetController {
	
private static final Logger logger  = LoggerFactory.getLogger(SiteWaterInfo.class);
	
	private static final String LIST = "/site/data_sheet/list";

	@Autowired
	private SiteWaterService siteWaterService;
	
	@Autowired
	private SiteWaterDynamicService siteWaterDynamicService;
	
	@Autowired
	private CanalFlowHightService canalFlowHightService;
	
	@Autowired
	private DataSheetService dataSheetService;

	@RequestMapping("/list")
	public String list(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		return LIST;
	}
	//查询水位站基础数据
	@RequestMapping("/selectAll")
	@ResponseBody
	public JsonResult selectAll(String year){
		Map<String,Object> pageInfo = new HashMap<>();
		List<DataSheet> List = new ArrayList<>();
		Calendar date = Calendar.getInstance();
		DataSheet ds = new DataSheet();
		try {
			if("0".equals(year)||year==null){
				year = String.valueOf(date.get(Calendar.YEAR));
				List = dataSheetService.selectAll(year);
			}else{
				List = dataSheetService.selectAll(year);
			}
			pageInfo.put("swiList", List);
			logger.info("查询成功");
		} catch (Exception e) {
			List = dataSheetService.selectAll(year);
			pageInfo.put("swiList", List);
			logger.error("查询失败",e);
		}
		return new JsonResult(pageInfo);
	}
	//Excel导出
		@RequestMapping("/excel_export")
		@ResponseBody
		public JsonResult excelExport(String year,HttpServletResponse response) throws Exception{
			//DataSheetController.testReflect();
			/*try {*/
				List<DataSheet> list = new ArrayList<>();
				Calendar date = Calendar.getInstance();
				List<DataSheetExcel> dseList = new ArrayList<>();
				if("0".equals(year)){
					year = String.valueOf(date.get(Calendar.YEAR));
					list = dataSheetService.selectAll(year);
				}else{
					list = dataSheetService.selectAll(year);
				}
				if(list!=null){
					for(DataSheet ds:list){
						DataSheetExcel dse = new DataSheetExcel();
						dse.setWaterName(ds.getWaterName());
						dse.setJanuary(ds.getJanuary());
						dse.setFebruary(ds.getFebruary());
						dse.setMarch(ds.getMarch());
						dse.setApril(ds.getApril());
						dse.setMay(ds.getMay());
						dse.setJune(ds.getJune());
						dse.setJuly(ds.getJuly());
						dse.setAugust(ds.getAugust());
						dse.setSeptember(ds.getSeptember());
						dse.setOctober(ds.getOctober());
						dse.setNovember(ds.getNovember());
						dse.setDecember(ds.getDecember());
						dse.setTotleFlow(testReflect(ds));
						dseList.add(dse);
					}
					ExportExcel.exportExcel(dseList, "数据统计", "数据统计",DataSheetExcel.class, "数据统计.xls", response);
					
				}
				
				return new JsonResult();
		}
		/*遍历实体类*/
		 public static BigDecimal testReflect(DataSheet dse) throws Exception{
			 BigDecimal totleData = new BigDecimal("0");
			 String[] fileList = new String[]{"january","february","march","april","may","june","july","august","september","october","november","december"};
            for (java.lang.reflect.Field field : dse.getClass().getDeclaredFields()) {
                field.setAccessible(true);
                if(field.get(dse)!=null&&Arrays.asList(fileList).contains(field.getName())){
                	totleData = totleData.add((BigDecimal) field.get(dse));
                }
                System.out.println(field.getName() + ":" + field.get(dse) );
            }
            return totleData;
	     }
	/** 
	 * 	根据站点编码查询 当年月累计流量数据    李玥
	 * @Title: addUpData
	 * @Description: 
	 * @param: @param devicewaterCode
	 * @param: @return
	 * @return: List<DataSheetExcel>
	 * @throws
	 */
	@RequestMapping("/addUpData")
	@ResponseBody
	public DataSheet addUpData(String devicewaterCode){
		DataSheet addUpData=dataSheetService.addUpData(devicewaterCode);
		return addUpData;
	}
	
	

}
