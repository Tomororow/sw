package com.zyjz.watersupply.controller;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.mysql.jdbc.Connection;
import com.zyjz.plan.entity.ConsumerSoil;
import com.zyjz.sitemanage.service.WaterSurveySiteService;
import com.zyjz.sitemanage.web.JsonResult;
import com.zyjz.sysmanage.entity.CalCanalInfo;
import com.zyjz.sysmanage.service.CalCanalInfoService;
import com.zyjz.sysmanage.service.SysAreaService;
import com.zyjz.utils.controller.BaseUtils;
import com.zyjz.watersupply.entity.SynWaterworks;
import com.zyjz.watersupply.entity.WaterTreeStructure;
import com.zyjz.watersupply.service.SynWaterworksService;
import com.zyjz.watersupply.service.WaterTreeStructureService;

/**
 * 水厂信息
 * @ClassName: SynWaterWorksController
 * @Description: 
 * @Author: liyue
 * @Date: 2018年5月11日 上午9:40:05
 */
@Controller
@RequestMapping("/water_supply")
public class SynWaterWorksController {
	@Autowired
	private SynWaterworksService synWaterworksService;
	
	@Autowired 
	private WaterSurveySiteService waterSurveySiteService;
	
	@Autowired
	private WaterTreeStructureService waterTreeStructureService;
	
	@Autowired
	CalCanalInfoService calCanalInfoService;
	
	@Autowired
	SysAreaService sysAreaService;
	
	private static final String LIST_JSP = "/watersupply/syn_fpud/syn_fpud_list";
	
	private static final String ADD_JSP = "/watersupply/water_works/water_works_add";
	
	private static final String MANAGE_JSP = "/watersupply/water_fee_manage/list";
	
	private static final String MAINTE_JSP = "/watersupply/mainte_nance/list";

	private static final String ADDDATA = "/watersupply/water_works/water_works_add";
	
	@RequestMapping("/list")
	public String list(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		return 	LIST_JSP;
	}
	//跳转到水厂信息的新增页面
	@RequestMapping("/addData")
	public String addData(String id,Model model){
		model.addAttribute("treeId",id);
		return ADDDATA;
	}
	@RequestMapping("/insertData")
	@ResponseBody
	public JsonResult insertData(MultipartFile file,HttpServletRequest request,SynWaterworks sww){
		String value5 = request.getParameter("value5");
		WaterTreeStructure wts = waterTreeStructureService.selectByPrimaryKey(request.getParameter("syswaterareaCode"));
		return new JsonResult();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*//=======================水管区递归=========================//
	//递归
	private List<String> list = new ArrayList<String>();
	@RequestMapping("/test")
	public List<String> calCanalInfo(String id){
		List<CalCanalInfo> calCanlInfo = calCanalInfoService.findCanalByPId(id);
		for(CalCanalInfo cci :calCanlInfo){
			list.add(cci.getCanalCode());
			calCanalInfo(cci.getId());
		}
		System.out.println(list);
		return list;
	}
*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
/*	//跳转至水费管理页面
	@RequestMapping("/wate_fee_manageList")
	public String manageList(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
	return 	MANAGE_JSP;
	}
	//跳转至数据分析页面
	@RequestMapping("/data_analyze")
	public String analyze(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
	return 	ANALYZE_JSP;
	}
	//跳转到维修养护页面
	@RequestMapping("/mainte_nance")
	public String mainteNance(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		return MAINTE_JSP;
	}
	//查询树结构
	@RequestMapping("/district")
	@ResponseBody
	public List<WaterTreeMenu> district(){
		List<WaterTreeMenu> treeMenusList = waterSurveySiteService.seet();
		return treeMenusList;
	}*/
	
	private List<String> canalCodes = new ArrayList<String>();
	/**
	 * 列表页
	 * @Title: page
	 * @Description: 
	 * @param: @param canalId
	 * @param: @param request
	 * @param: @param page
	 * @param: @param pageSize
	 * @param: @return
	 * @return: List<ConsumerSoil>
	 * @throws
	 */
	@RequestMapping(value="/page")
	/*public @ResponseBody List<ConsumerSoil> page(String canalId,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="3") Integer pageSize){
		//当前点击的区域
		//把当前的区域加入到列表中
		
			CalCanalInfo calCanalInfo= calCanalInfoService.findCanalById(canalId);
			String canalCode = calCanalInfo.getCanalCode();
			String canalName =calCanalInfo.getCanalName();
			request.setAttribute("canalName", canalName);
			getCanalCode(canalId);
			canalCodes.add(canalCode);
			PageHelper.startPage(page, pageSize);
			
			List<ConsumerSoil> list = consumerSoilService.findConsumerSoilsByCanalCodes(canalCodes);
			for(ConsumerSoil consumerSoil:list){
				if(consumerSoil!=null){
					String consumerId= consumerSoil.getConsumerId();
					System.out.println("==================consumerId=============================>"+consumerId);
					DistWaterPlanConsumer sistWaterPlanConsumer=distWaterPlanConsumerService.selectByPrimaryKey(consumerId);
					if(sistWaterPlanConsumer!=null){
						consumerSoil.setConsumerId(sistWaterPlanConsumer.getName());
					}
					
					SoilTypeInfo soilTypeInfo=soilTypeService.getSoilName(consumerSoil.getSoilTypeCode());
					if(soilTypeInfo!=null){
						consumerSoil.setSoilTypeCode(soilTypeInfo.getSoilName());
					}
					
					CalCanalInfo calCanalInfoed =calCanalInfoService.findCanalByCode(consumerSoil.getCanalCode());
					if(calCanalInfoed!=null){
						consumerSoil.setCanalCode(calCanalInfoed.getCanalName());
					}
				}
				
			}
			
			//清空全局list
			canalCodes.clear();
			PageInfo<ConsumerSoil> pages = new PageInfo<ConsumerSoil>(list);
			request.getSession().setAttribute("consumerSoilPages", pages);
			
		return list;
	}*/
	//递归拿到所有
	public void getCanalCode(String id){
		//List<String> canalCodes = new ArrayList<String>();
		List<CalCanalInfo>  calCanalInfoList = calCanalInfoService.findCanalByPId(id);
		if(calCanalInfoList!=null&&calCanalInfoList.size()>0){
			for(int i=0;i<calCanalInfoList.size();i++){
				canalCodes.add(calCanalInfoList.get(i).getCanalCode());
				List<CalCanalInfo>  calCanalInfoList2 = calCanalInfoService.findCanalByPId(calCanalInfoList.get(i).getId());
				if(calCanalInfoList2!=null&&calCanalInfoList2.size()>0){
					getCanalCode(calCanalInfoList.get(i).getId());
				}
				
			}
		}
	}
	
	/**
	 * 分页
	 * @Title: pageNav
	 * @Description: 
	 * @param: @param request
	 * @param: @return
	 * @return: PageInfo<ConsumerSoil>
	 * @throws
	 */
	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<ConsumerSoil> pageNav(HttpServletRequest request){
		PageInfo<ConsumerSoil> pages = (PageInfo<ConsumerSoil>) request.getSession().getAttribute("consumerSoilPages");
		return pages;
	}
	
	/**
	 * 跳转到添加页面
	 * @Title: addPage
	 * @Description: 
	 * @param: @param model
	 * @param: @param canalId
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/add_page")
	public String addPage(Model model){
		
		return ADD_JSP;
	} 
	
	
	@RequestMapping(value="/add")
	public String add(@RequestParam("files") MultipartFile[] files) throws Exception{
		
		System.out.println("=====进来了吗？气死我了！！！======");
		
		
		
		
		
		//-------------------------------------------
		Class.forName("com.mysql.jdbc.Driver"); 
	       
	    //一开始必须填一个已经存在的数据库 
	    String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";   
	    Connection conn = (Connection) DriverManager.getConnection(url, "root", "123456"); 
	    Statement stat = conn.createStatement(); 
	       
	    //创建数据库hello 
	    stat.executeUpdate("create database hello"); 
	       
	    //打开创建的数据库 
	    stat.close(); 
	    conn.close(); 
	    url = "jdbc:mysql://localhost:3306/hello?useUnicode=true&characterEncoding=utf-8"; 
	    conn = (Connection) DriverManager.getConnection(url, "root", "123456"); 
	    stat = conn.createStatement(); 
	       
	    //创建表test 
	    stat.executeUpdate("create table test(id int, name varchar(80))"); 
	       
	    //添加数据 
	    stat.executeUpdate("insert into test values(1, '张三')"); 
	    stat.executeUpdate("insert into test values(2, '李四')"); 
	       
	    //查询数据 
	    ResultSet result = stat.executeQuery("select * from test"); 
	    while (result.next()) 
	    { 
	      System.out.println(result.getInt("id") + " " + result.getString("name")); 
	    } 
	       
	    //关闭数据库 
	    result.close(); 
	    stat.close(); 
	    conn.close(); 
		return "redirect:/water_supply/list?state=41";
	}
	
	
}
