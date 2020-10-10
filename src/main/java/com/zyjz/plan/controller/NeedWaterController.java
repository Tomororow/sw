package com.zyjz.plan.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.plan.entity.*;
import com.zyjz.plan.service.CollectBaseParamsService;
import com.zyjz.plan.service.CropsTypeInfoService;
import com.zyjz.plan.service.NeedWaterService;
import com.zyjz.plan.service.SoilsTypeInfoService;
import com.zyjz.sitemanage.web.JsonResult;
import com.zyjz.sysmanage.entity.CalCanalInfo;
import com.zyjz.sysmanage.entity.SiteMiddleCanal;
import com.zyjz.sysmanage.service.CalCanalInfoService;
import com.zyjz.sysmanage.service.SiteMiddleCanalService;
import com.zyjz.user.service.UserService;
import com.zyjz.utils.ExportExcel;
import com.zyjz.utils.controller.BaseUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.*;

@Controller
@RequestMapping(value="/need_water")
public class NeedWaterController {
	
	private static final Logger logger = LoggerFactory.getLogger(NeedWaterReport.class);
	
	@Autowired
	NeedWaterService needWaterService;
	@Autowired
	CalCanalInfoService calCanalInfoService;
	@Autowired
	CropsTypeInfoService cropsTypeService;
	@Autowired
	SoilsTypeInfoService soilTypeService;
	@Autowired
	CollectBaseParamsService collectBaseParamsService;

	@Autowired
	UserService userService;

	@Autowired
	SiteMiddleCanalService siteMiddleCanalService;

	/** 视图解析页面路径 */
	protected static final String NEED_WATER_JSP = "/plan/need_water_report/list";
	protected static final String ADD_REPORT_JSP = "/plan/need_water_report/add_need_water";
	protected static final String EDIT_REPORT_JSP = "/plan/need_water_report/edit_need_water";
	
	@RequestMapping(value="/list")
	public String list(Model model,HttpServletRequest request){
		
		//水库树
		//所有提报过的年份
		List<NeedWaterReport> needWaterReportList = needWaterService.findAll();
		
		List<NeedWaterReport> needWaterReportList2 = new ArrayList<NeedWaterReport>();
		
		List<Integer> yearList = new ArrayList<Integer>();
		for(int i=0;i<needWaterReportList.size();i++){
			
			if(i>=1){
				int a = needWaterReportList.get(i).getYear();
				int b = needWaterReportList.get(i-1).getYear();
				if(a==b){
				}else{
					needWaterReportList2.add(needWaterReportList.get(i));
				}
			}else{
				needWaterReportList2.add(needWaterReportList.get(i));
			}
			yearList.add(needWaterReportList.get(i).getYear());
			
		}
		
		int year = 0;
		if(yearList.size()>0){
			 year = Collections.max(yearList);
		}
		
		model.addAttribute("year", year);
		model.addAttribute("needWaterReportList", needWaterReportList2);
//		BaseUtils baseUtils = new BaseUtils();
//		baseUtils.showMenu(model, request, state);
		
		return NEED_WATER_JSP;
	}
	
	
	@RequestMapping(value="/page")
	public @ResponseBody List<NeedWaterReport> page(String canalId,int year,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="10") Integer pageSize){
		//当前点击的区域
		//把当前的区域加入到列表中
		
//			CalCanalInfo calCanalInfo= calCanalInfoService.findCanalById(canalId);
//			String canalCode = calCanalInfo.getCanalCode();
			PageHelper.startPage(page, pageSize);
//			List<NeedWaterReport> list = needWaterService.findNeedWaterReportByCanalCodeAndYear(canalId,year);
		
			List<NeedWaterReport> list = needWaterService.findNeedWaterReportByCanalCodeAndYearJoin(canalId,year);
			
			
			soilTypeService.getSoilsList();
			
			for(NeedWaterReport needWaterReport:list){
				if(needWaterReport!=null){
					CropsTypeInfo cropsTypeInfo	=cropsTypeService.selectBycropsCode(needWaterReport.getCropsType());
					SoilTypeInfo soilTypeInfo =soilTypeService.getSoilName(needWaterReport.getSoilType());
					if(cropsTypeInfo!=null&&soilTypeInfo!=null){
						needWaterReport.setCropsType(cropsTypeInfo.getCropsName());
						needWaterReport.setSoilType(soilTypeInfo.getSoilName());
					}
				}
			}
			
			PageInfo<NeedWaterReport> pages = new PageInfo<NeedWaterReport>(list);
			request.getSession().setAttribute("needWaterReportPages", pages);
		
		return list;
	}
	
	
	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<NeedWaterReport> pageNav(HttpServletRequest request){
		PageInfo<NeedWaterReport> pages = (PageInfo<NeedWaterReport>) request.getSession().getAttribute("needWaterReportPages");
		return pages;
	}
	
	
	
	
	
	
	@RequestMapping(value="/add_need_water_page")
	public String addNeedWaterPage(String canalId,Model model){
		
		CalCanalInfo calCanalInfo=calCanalInfoService.findCanalByCode(canalId);
		String canalCode = calCanalInfo.getCanalCode();
		String canalName = calCanalInfo.getCanalName();
		model.addAttribute("canalCode", canalCode);
		model.addAttribute("canalName", canalName);
		
		List<CropsTypeInfo> cropsTypeInfoList =cropsTypeService.getCropsList();
		List<SoilTypeInfo> soilTypeInfoList =soilTypeService.getSoilsList();
		model.addAttribute("cropsTypeInfoList", cropsTypeInfoList);
		model.addAttribute("soilTypeInfoList", soilTypeInfoList);
		return ADD_REPORT_JSP;
	} 
	
	
	@RequestMapping(value="/add")
	public String add(NeedWaterReport needWaterReport,HttpServletRequest request){
		
		//拿到当前渠道编码
		String canalCode = needWaterReport.getCanalCode();
		
		//拿到当前渠道
		CalCanalInfo canalInfo = calCanalInfoService.findCanalByCode(canalCode);
		
		//拿到父一级渠道
		CalCanalInfo pCanalInfo = calCanalInfoService.findCanalById(canalInfo.getCanalParentId());
		
		while (pCanalInfo!=null){
			//拿到父级渠道code
			String pCanalCode = pCanalInfo.getCanalCode();
			NeedWaterReport pNeedWaterReport=needWaterService.findNeedWaterReportByCanalCodeAndYearAndSoilTypeAndCropsType(
					pCanalCode,
					needWaterReport.getYear(),
					needWaterReport.getSoilType(),
					needWaterReport.getCropsType());
			if(pNeedWaterReport!=null){
				//如果从在就把这次提报的亩数添加到父级的提报亩数中
				pNeedWaterReport.setArea(pNeedWaterReport.getArea().add(needWaterReport.getArea()));
				needWaterService.update(pNeedWaterReport);
			}else{
				//如果不存在就给父级渠道建一个需水报告
				NeedWaterReport needWaterReport2 = new NeedWaterReport();
				//时间戳+渠道编号+土地编号+农作物编号 作为表单编号
				Date date = new Date();
				//表单编号
				String no = date.getTime()+pCanalCode+needWaterReport.getSoilType()+needWaterReport.getCropsType();
				needWaterReport2.setReportNo(no);
				needWaterReport2.setCanalCode(pCanalInfo.getCanalCode());
				needWaterReport2.setYear(needWaterReport.getYear());
				needWaterReport2.setSoilType(needWaterReport.getSoilType());
				needWaterReport2.setCropsType(needWaterReport.getCropsType());
				needWaterReport2.setArea(needWaterReport.getArea());
				needWaterReport2.setCreateTime(new Date());
				needWaterService.insert(needWaterReport2);
			}
			pCanalInfo = calCanalInfoService.findCanalById(pCanalInfo.getCanalParentId());
		}
		//添加完所有父级渠道后再添加本级渠道
		Date date2 = new Date();
		needWaterReport.setReportNo(date2.getTime()+needWaterReport.getCanalCode()+needWaterReport.getSoilType()+needWaterReport.getCropsType() );
		needWaterReport.setCreateTime(new Date());
		needWaterService.insert(needWaterReport);

		//siteMiddleCanal中间表插入或更新
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.updateSiteMiddle("sysArea",needWaterReport.getCanalCode(),
				"report_no",needWaterReport.getReportNo(),request);
		
		return "redirect:/need_water/list?state=32";
	}

	@RequestMapping(value="/delete")
	public @ResponseBody String delete(String id){
		int i = needWaterService.deleteNeedWaterReportById(id);
		return String.valueOf(i);
	}


	@RequestMapping(value="/get_soil_type_name")
	public @ResponseBody String getSoilTypeName(String soilType){
		
		return "";
	}
	
	
	/**
	 * 跳转到修改页面
	 * @Title: editNeedWaterPage
	 * @Description: 
	 * @param: @param id
	 * @param: @param model
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/edit_need_water_page")
	public String editNeedWaterPage(String id,Model model){
		
		NeedWaterReport needWaterReport=needWaterService.selectByPrimaryKey(id);
		CalCanalInfo calCanalInfo=calCanalInfoService.findCanalByCode(needWaterReport.getCanalCode());
		String canalCode = calCanalInfo.getCanalCode();
		String canalName = calCanalInfo.getCanalName();
		model.addAttribute("canalCode", canalCode);
		model.addAttribute("canalName", canalName);
		
		List<CropsTypeInfo> cropsTypeInfoList =cropsTypeService.getCropsList();
		List<SoilTypeInfo> soilTypeInfoList =soilTypeService.getSoilsList();
		model.addAttribute("cropsTypeInfoList", cropsTypeInfoList);
		model.addAttribute("soilTypeInfoList", soilTypeInfoList);
		
		
		model.addAttribute("needWaterReport", needWaterReport);
		model.addAttribute("people", needWaterReport.getReportPeopleName());
		
		System.out.println("============================================"+needWaterReport.getReportPeopleName());
		
		return EDIT_REPORT_JSP;
	} 
	
	
	@RequestMapping(value="/edit")
	public String edit(NeedWaterReport needWaterReport,HttpServletRequest request){

		//站点修改前中间表数据修改
		int i = updateSiteMiddleCanal(needWaterReport.getId());

		//原有数据
		NeedWaterReport needWaterReport2=needWaterService.selectByPrimaryKey(needWaterReport.getId());
		String cropsType= needWaterReport2.getCropsType();
		String soilType= needWaterReport2.getSoilType();
		BigDecimal area= needWaterReport2.getArea();

		
		//int a =needWaterService.deleteNeedWaterReportById(needWaterReport2.getId());
		needWaterReport.setRepairTime(new Date());
		int a =needWaterService.update(needWaterReport);
		//拿到当前渠道编码
		String canalCode = needWaterReport.getCanalCode();
		//拿到当前渠道
		CalCanalInfo canalInfo = calCanalInfoService.findCanalByCode(canalCode);
		
		//拿到父一级渠道
		CalCanalInfo pCanalInfo = calCanalInfoService.findCanalById(canalInfo.getCanalParentId());
		System.out.println("=========pCanalInfo========="+pCanalInfo);
		while (pCanalInfo!=null){
			//拿到父级渠道code
			String pCanalCode = pCanalInfo.getCanalCode();
			NeedWaterReport pNeedWaterReport=needWaterService.findNeedWaterReportByCanalCodeAndYearAndSoilTypeAndCropsType(
					pCanalCode,
					needWaterReport.getYear(),
					soilType,
					cropsType);
				System.out.println("===============pNeedWaterReport==============="+pNeedWaterReport);
				//int b =needWaterService.update(pNeedWaterReport);
			if(pNeedWaterReport!=null){
				//如果从在就把这次提报的亩数添加到父级的提报亩数中
				
				System.out.println("----------pNeedWaterReport.getArea().subtract(area)).compareTo(new BigDecimal()------------"+(pNeedWaterReport.getArea().subtract(area)).compareTo(new BigDecimal("0")));
				if((pNeedWaterReport.getArea().subtract(area)).compareTo(new BigDecimal("0"))==0){
					int b = needWaterService.deleteNeedWaterReportById(pNeedWaterReport.getId());
					System.out.println("*****************************");
				}else{
					pNeedWaterReport.setArea(pNeedWaterReport.getArea().subtract(area));
					int c = needWaterService.update(pNeedWaterReport);
				}
				
				NeedWaterReport pNeedWaterReport2=needWaterService.findNeedWaterReportByCanalCodeAndYearAndSoilTypeAndCropsType(
						pCanalCode,
						needWaterReport.getYear(),
						needWaterReport.getSoilType(),
						needWaterReport.getCropsType());
				System.out.println("==============pNeedWaterReport2==================="+pNeedWaterReport2);
				//int c =needWaterService.update(pNeedWaterReport2);
				if(pNeedWaterReport2!=null){
					pNeedWaterReport2.setArea(pNeedWaterReport.getArea().add(needWaterReport.getArea()));
					needWaterService.update(pNeedWaterReport2);
				}else{
					System.out.println("======进来了吗=======");
					//如果不存在就给父级渠道建一个需水报告
					NeedWaterReport needWaterReport3 = new NeedWaterReport();
					//时间戳+渠道编号+土地编号+农作物编号 作为表单编号
					Date date = new Date();
					//表单编号
					String no = date.getTime()+pCanalCode+needWaterReport.getSoilType()+needWaterReport.getCropsType();
					needWaterReport3.setReportNo(no);
					needWaterReport3.setCanalCode(pCanalInfo.getCanalCode());
					needWaterReport3.setYear(needWaterReport.getYear());
					needWaterReport3.setSoilType(needWaterReport.getSoilType());
					needWaterReport3.setCropsType(needWaterReport.getCropsType());
					needWaterReport3.setArea(needWaterReport.getArea());
					needWaterReport3.setCreateTime(new Date());
					needWaterService.insert(needWaterReport3);
				}
			}
			pCanalInfo = calCanalInfoService.findCanalById(pCanalInfo.getCanalParentId());
		}

		//站点修改后中间表数据修改
		//siteMiddleCanal中间表插入或更新
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.updateSiteMiddle("sysArea",needWaterReport.getCanalCode(),
				"report_no",needWaterReport.getReportNo(),request);
		
		return "redirect:/need_water/list?state=32";
	}
	
	/**
	 * 根据渠道及相应的年查询提报信息
	 * @Title: fingNeedWaterReportByCanalCodeAndYear
	 * @Description: 
	 * @param: @param needWaterReport
	 * @param: @param canalId
	 * @param: @param year
	 * @param: @return
	 * @return: NeedWaterReport
	 * @throws
	 */
	@RequestMapping("/total_area")
	@ResponseBody
	public Double totalArea(String canalId,int year){
//		CalCanalInfo calCanalInfo = calCanalInfoService.findCanalById(canalId);
//		String canalCode = calCanalInfo.getCanalCode();
//		List<NeedWaterReport> list = needWaterService.findNeedWaterReportByCanalCodeAndYear(canalId,year);
		
		List<NeedWaterReport> list = needWaterService.findNeedWaterReportByCanalCodeAndYearJoin(canalId,year);
		BigDecimal totalArea = new BigDecimal("0");
		for(NeedWaterReport needWaterRept : list){
			totalArea = totalArea.add(needWaterRept.getArea());
		}
		return totalArea.doubleValue();
	}
	//Excel导入（需水提报）
	@RequestMapping("/ExcelImport")
	@ResponseBody
	public String ExcelImport(MultipartFile file,HttpServletRequest request){
		String message = "";
		List<NeedWaterExcel>  needList = ExportExcel.importExcel(file,1, 1,NeedWaterExcel.class );
		try{
			for(int i=0;i<needList.size();i++){
				message = ""+i;
				if(needList.get(i).getCalDitch()!=""&&needList.get(i).getCalDitch()!=null){
					CalCanalInfo cci  = calCanalInfoService.selectCanalName(needList.get(i).getCalDitch());
					NeedWaterReport nwr = new NeedWaterReport();
					nwr.setReportNo(new Date().getTime()+cci.getCanalCode());
					nwr.setCanalCode(cci.getCanalCode());
					nwr.setArea(needList.get(i).getArea());
					nwr.setCanalDecisionArea(needList.get(i).getCanalDecisionArea());
					nwr.setCreateTime(new Date());
					nwr.setCropsType(needList.get(i).getCropsType());
					nwr.setSoilType(needList.get(i).getSoilType());
					nwr.setYear(needList.get(i).getYear());
					nwr.setReportPeopleName(needList.get(i).getReportPeopleName());
					nwr.setPhoneNumber(needList.get(i).getPhoneNumber());
					nwr.setRemark(needList.get(i).getRemark());
					add(nwr,request);
				}else{
					throw new RuntimeException("所属渠道不能为空！");
				}
			}
			logger.info("Excel文件上传内容正确");
			message="success";
		}catch(Exception e){
			logger.info("Excel文件上传内容错误",e);
		}
		return message;
	}
	
	//Excel模板下载
	@RequestMapping("/downLoadExcel")
	@ResponseBody
	public JsonResult downLoadExcel(HttpServletResponse response){
		List<String> list = new ArrayList<>();
		ExportExcel.exportExcel(list, "需水提报Excel模板","需水提报",NeedWaterExcel.class,"需水提报Excel模板.xls",response );
		return new JsonResult();
	}
	/*水位流量关系表导入*/
	@RequestMapping("/excel_import")
	@ResponseBody
	public String ExcelImport(MultipartHttpServletRequest request){
		List<CollectBaseParamsExcel> list = ExportExcel.importExcel(request.getFile("file"), 1, 1, CollectBaseParamsExcel.class);
		if(list!=null){
			for(CollectBaseParamsExcel ce:list){
				CollectBaseParams cbp = new CollectBaseParams();
				cbp.setId(UUID.randomUUID().toString());
				cbp.setBaseCode("6205000002");
				cbp.setBaseName("2号基流点");
				cbp.setCreatetime(new Date());
				cbp.setFlow(ce.getFlow());
				cbp.setLevelMax(ce.getLevelMax());
				cbp.setLevelMin(ce.getLevelMin());
				cbp.setRemark("");
				cbp.setWaterNum(ce.getWaterNum());
				int i = collectBaseParamsService.insertSelective(cbp);
				if(i==1){
					System.out.println("添加成功..");
				}else{
					System.out.println("添加失败...");
				}
			}
		}
		return "";
	}


	/**
	 * 水库站点修改时中间表的数据修改
	 * @param id
	 * @return
	 */
	private int updateSiteMiddleCanal(String id){
		int state = 0;
		NeedWaterReport needWaterReportInfo = needWaterService.selectByPrimaryKey(id);
		if(needWaterReportInfo != null){
			String code = "'"+needWaterReportInfo.getReportNo()+"'";
			List<SiteMiddleCanal> siteMiddleCanalList = siteMiddleCanalService.selectMiddleCanalInfoByCode(code, "report_no");
			if(siteMiddleCanalList.size()>0){
				for (SiteMiddleCanal canal : siteMiddleCanalList) {
					canal.setReportNo("");
					int i = siteMiddleCanalService.updateByPrimaryKeySelective(canal);
					if(i == 1){
						logger.info("中间表id:"+canal.getId()+" 的数据更新成功");
					}else{
						logger.info("中间表id:"+canal.getId()+" 的数据更新失败");
					}
					state+=i;
				}
			}
		}
		return state;
	}
}









