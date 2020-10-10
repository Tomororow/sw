package com.zyjz.plan.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.plan.entity.BpTenFlowFrequency;

import com.zyjz.plan.service.BpTenFlowFrequencyService;
import com.zyjz.sysmanage.entity.CalCanalInfo;

import com.zyjz.sysmanage.service.CalCanalInfoService;
import com.zyjz.utils.controller.BaseUtils;

/**
 * 神经网络算法——水库来水预测
 * @ClassName: BPTenFlowController
 * @Description: 
 * @Author: 李玥
 * @Date: 2018年6月29日 上午11:24:57
 */
@Controller
@RequestMapping("/BP_ten")
public class BPTenFlowController {

	@Autowired
	CalCanalInfoService calCanalInfoService;
	
	@Autowired
	BpTenFlowFrequencyService bpTenFlowFrequencyService;
	
	/** 视图解析页面路径 */
	protected static final String BPTEN_FLOW_JSP = "/plan/bp_ten/list";
	protected static final String ADD_BP_JSP = "/plan/bp_ten/add";
	
	
	/**
	 * 神经网络算法——水库来水预测--列表页面
	 * @Title: list
	 * @Description: 
	 * @param: @param model
	 * @param: @param request
	 * @param: @param state
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/list")
	public String list(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		List<CalCanalInfo> calCanalInfoList2 = calCanalInfoService.findAllCanal();
		model.addAttribute("calCanalInfoList2", calCanalInfoList2);
		model.addAttribute("calCanalCode", calCanalInfoList2.get(0).getCanalCode());
		return BPTEN_FLOW_JSP;
	}
	
	
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
	public @ResponseBody List<BpTenFlowFrequency> page(String canalId,HttpServletRequest request,
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
			
		//	List<ConsumerSoil> list = consumerSoilService.findConsumerSoilsByCanalCodes(canalCodes);
			
			List<BpTenFlowFrequency> list = bpTenFlowFrequencyService.findBpTenFlowFrequencyByCanalCodes(canalCodes);
			//清空全局list
			canalCodes.clear();
			PageInfo<BpTenFlowFrequency> pages = new PageInfo<BpTenFlowFrequency>(list);
			request.getSession().setAttribute("Pages", pages);
			
		return list;
	}
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
	public @ResponseBody PageInfo<BpTenFlowFrequency> pageNav(HttpServletRequest request){
		PageInfo<BpTenFlowFrequency> pages = (PageInfo<BpTenFlowFrequency>) request.getSession().getAttribute("Pages");
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
	public String addPage(Model model,String canalId){
		CalCanalInfo calCanalInfo= calCanalInfoService.findCanalById(canalId);
		model.addAttribute("canalCode", calCanalInfo.getCanalCode());
		model.addAttribute("canalName", calCanalInfo.getCanalName());
		return ADD_BP_JSP;
	} 
	
	/**
	 * 添加
	 * @Title: add
	 * @Description: 
	 * @param: @param consumerSoil
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/add")
	public String add(BpTenFlowFrequency bpTenFlowFrequency){
		bpTenFlowFrequency.setPredictiontime(new Date());
	//	int a = consumerSoilService.addConsumerSoil(consumerSoil);
		return "redirect:/plan/bp_ten/list";
	} 
			
}
