package com.zyjz.plan.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.plan.entity.TenFlow;
import com.zyjz.plan.entity.TenFlowFrequency;
import com.zyjz.plan.service.TenFlowService;
import com.zyjz.sysmanage.entity.CalCanalInfo;
import com.zyjz.sysmanage.service.CalCanalInfoService;
import com.zyjz.utils.CommonMethodUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value="/ten")
public class TenFlowController {
	
	@Autowired
	TenFlowService tenFlowService;
	@Autowired
	CalCanalInfoService calCanalInfoService;
	
	/** 视图解析页面路径 */
	protected static final String TEN_FLOW_JSP = "/plan/list";
	protected static final String ADD_FlOW_JSP = "/plan/add_month_flow";
	
	
	@RequestMapping(value="/list")
	public String list(Model model,HttpServletRequest request){
		
//		BaseUtils baseUtils = new BaseUtils();
//		baseUtils.showMenu(model, request, state);
		
		
		List<CalCanalInfo> calCanalInfoList2 = calCanalInfoService.findAllCanal();
		model.addAttribute("calCanalInfoList2", calCanalInfoList2);
		model.addAttribute("calCanalCode", calCanalInfoList2.get(0).getCanalCode());
		return TEN_FLOW_JSP;
	}
	
	@RequestMapping(value="/refresh")
	public String refresh(Model model){
		
		List<CalCanalInfo> calCanalInfoList = calCanalInfoService.findCanalsByLevel(2);
		
		model.addAttribute("calCanalInfoList", calCanalInfoList);
		model.addAttribute("calCanalCode", calCanalInfoList.get(0).getCanalCode());
		return TEN_FLOW_JSP;
	}
	
	//根据频率拿到当月的上中下旬流量
	@RequestMapping(value="/get_flow")
	public @ResponseBody List<TenFlowFrequency> getFlow(double frequency,String canalCode,int month){
		//上旬
		List<TenFlowFrequency> earlyTenFlowFrequencyList = tenFlowService.findTenFlowFrequencysByRiversCodeAndMonthAndDay(canalCode,month,1);
		//中旬
		List<TenFlowFrequency> middleTenFlowFrequencyList = tenFlowService.findTenFlowFrequencysByRiversCodeAndMonthAndDay(canalCode,month,11);
		//下旬
		List<TenFlowFrequency> lastTenFlowFrequencyList = tenFlowService.findTenFlowFrequencysByRiversCodeAndMonthAndDay(canalCode,month,21);
		
		
		TenFlowFrequency earlyTenFlowFrequency = getNearFrequency(frequency,earlyTenFlowFrequencyList);
		TenFlowFrequency middleTenFlowFrequency = getNearFrequency(frequency,middleTenFlowFrequencyList);
		TenFlowFrequency lastTenFlowFrequency = getNearFrequency(frequency,lastTenFlowFrequencyList);
		
		
		
		List<TenFlowFrequency> list = new ArrayList<TenFlowFrequency>();
		list.add(earlyTenFlowFrequency);
		list.add(middleTenFlowFrequency);
		list.add(lastTenFlowFrequency);
		
		return list;
	}
	
	
	//寻找最接近的频率
	
	public TenFlowFrequency getNearFrequency(double f,List<TenFlowFrequency> tenFlowFrequencyList){
		
		BigDecimal frequency = new BigDecimal(f);
		//寻找上旬最接近的频率
		List<BigDecimal> bigDecimalList = new ArrayList<BigDecimal>(); 
		
		for(int i=0;i<tenFlowFrequencyList.size();i++){
			BigDecimal a = tenFlowFrequencyList.get(i).getFrequency();
			BigDecimal b = frequency;
			BigDecimal c = (a.subtract(b)).abs();
			bigDecimalList.add(c);
		}
		
		
		//把集合转成数组，用来排序
		BigDecimal[] array = bigDecimalList.toArray(new BigDecimal[0]);
		
		//把流量数组从大到小排列
		for(int j=0;j<array.length-1;j++){
			for(int k=0;k<array.length-j-1;k++){
				int a = array[k].compareTo(array[k+1]);
				if(a==1){//大于
					BigDecimal b = array[k];
					array[k]= array[k+1];
					array[k+1]=b;
				}
			}
		}
		
		int frequencyFlag = -1;
		
		for(int j=0;j<bigDecimalList.size();j++){
			BigDecimal d = bigDecimalList.get(j);
			int e = d.compareTo(array[0]);
			if(e==0){
				frequencyFlag = j;
				break;
			}
		}
		
		//最接近的频率为
		TenFlowFrequency tenFlowFrequency = null;
		if(frequencyFlag != -1){
			tenFlowFrequency = tenFlowFrequencyList.get(frequencyFlag);
		}else{
			if(tenFlowFrequencyList.size() > 0){
				tenFlowFrequency = tenFlowFrequencyList.get(frequencyFlag);
			}else{
				tenFlowFrequency = new TenFlowFrequency();
				tenFlowFrequency.setDescendingArrangement(new BigDecimal(0));
				tenFlowFrequency.setContrastYear(CommonMethodUtils.timeFormatter(new Date(),"year"));
			}
		}

		return tenFlowFrequency; 
	}
	
	
	
	@RequestMapping(value="/page")
	public @ResponseBody List<TenFlowFrequency> page(String riversCode,Integer month,Integer startDay,Integer endDay,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="10") Integer pageSize){
		//当前点击的区域
		//把当前的区域加入到列表中
		   // SysWaterArea sysWaterArea=sysWaterAreaService.findWaterAreaById(id);
			PageHelper.startPage(page, pageSize);
			List<TenFlowFrequency> list = tenFlowService.findTenFlowFrequencyByDateAndRiversCode(month,startDay,month,endDay,riversCode);
			PageInfo<TenFlowFrequency> pages = new PageInfo<TenFlowFrequency>(list);
			request.getSession().setAttribute("tenFlowFrequencyPages", pages);
		
		return list;
	}
	
	
	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<TenFlowFrequency> pageNav(HttpServletRequest request){
		PageInfo<TenFlowFrequency> pages = (PageInfo<TenFlowFrequency>) request.getSession().getAttribute("tenFlowFrequencyPages");
		return pages;
	}
	
	@RequestMapping(value="/add_flows")
	public String addFlow(TenFlow tenFlow){
		int currentYear = tenFlow.getAddYear();
		
		List<TenFlowFrequency> lenFlowFrequencylist = tenFlowService.findMsgByCurrentYear(currentYear);
		if(lenFlowFrequencylist!=null&&lenFlowFrequencylist.size()>0){
			
		}
		
		return TEN_FLOW_JSP;
	} 
	
	@RequestMapping(value="/add_single_month_flow_page")
	public String addSingleMonthFlowPage(Model model,String currentRiverCode,String month){
		
		CalCanalInfo calCanalInfo=calCanalInfoService.findCanalByCode(currentRiverCode);
		
		model.addAttribute("calCanalInfo", calCanalInfo);
		model.addAttribute("month", month);
		
		return ADD_FlOW_JSP;
	} 
	
	
	@RequestMapping(value="/add_single_month_flow")
	public String addSingleMonthFlow(TenFlowFrequency tenFlowFrequency){
		//List<TenFlowFrequency> lenFlowFrequencylist = tenFlowService.findMsgByCurrentYear(currentYear);
		
		//操作上旬
		String tenName = tenFlowFrequency.getTenName();
		if("上旬".equals(tenName)){
			tenFlowFrequency.setStartDay(1);
			tenFlowFrequency.setEndMonth(tenFlowFrequency.getStartMonth());
			tenFlowFrequency.setEndDay(10);
			
		}else if("中旬".equals(tenName)){
			tenFlowFrequency.setStartDay(11);
			tenFlowFrequency.setEndMonth(tenFlowFrequency.getStartMonth());
			tenFlowFrequency.setEndDay(20);
			
			
		}else if("下旬".equals(tenName)){
			tenFlowFrequency.setStartDay(21);
			tenFlowFrequency.setEndMonth(tenFlowFrequency.getStartMonth());
			int m = tenFlowFrequency.getStartMonth();
			if(m==1||m==3||m==5||m==7||m==8||m==10||m==12){
				tenFlowFrequency.setEndDay(31);
			}else if(m==4||m==6||m==9||m==11){
				tenFlowFrequency.setEndDay(30);
			}else{
				int y = tenFlowFrequency.getCurrentYear();
				if(y%4==0){
					if(y%100==0){
						if(y%400==0){//能被400整除的，是闰年
							tenFlowFrequency.setEndDay(29);
						}else{ //能被100整除，但不能被400整除的，不是闰年
							tenFlowFrequency.setEndDay(28);
						}
					}else{//能被4整除，但不能被100整除的，不是闰年
						tenFlowFrequency.setEndDay(28);
					}
				}else{ //不能被4整除的，不是闰年
					tenFlowFrequency.setEndDay(28);
				}
			}
		}
		
		int result = tenFlowService.addTenFlowFrequency(tenFlowFrequency);
		if(result==1){
			TenFlowFrequency ten = tenFlowService.findTenFlowFrequencyById(tenFlowFrequency.getId());
			//查询出添加数据的所对应的旬的历史记录
			List<TenFlowFrequency> list = tenFlowService.findTenFlowFrequencyByDateAndRiversCode(ten.getStartMonth(),ten.getStartDay(),ten.getEndMonth(),ten.getEndDay(),ten.getRiversCode());
			
			List<BigDecimal> flowList = new ArrayList<BigDecimal>();
			
			//将每年的流量放入一个集合
			for(int i=0;i<list.size();i++){
				flowList.add(list.get(i).getTenFlow());
			}
			//把集合转成数组，用来排序
			BigDecimal[] array = flowList.toArray(new BigDecimal[0]);
			
			//把流量数组从大到小排列
			for(int j=0;j<array.length-1;j++){
				for(int k=0;k<array.length-j-1;k++){
					int a = array[k].compareTo(array[k+1]);
					if(a==-1){//小于
						BigDecimal b = array[k];
						array[k]= array[k+1];
						array[k+1]=b;
					}
				}
			}
			
			
			//根据流量数组找到对应年份数组
			int[] contrastYears = new int[array.length];
			for(int m=0;m<list.size();m++){
				List<TenFlowFrequency> tenFlowFrequencyList = tenFlowService.findContrastYearByFlowAndRiversCode(array[m],ten.getStartMonth(),ten.getStartDay(),ten.getEndMonth(),ten.getEndDay(),ten.getRiversCode());
				//如果同一个流量对应多个年份
				if(tenFlowFrequencyList.size()>1){
					int n=0;
					for(n=0;n<tenFlowFrequencyList.size();n++){
						System.out.println("1111111111"+tenFlowFrequencyList.get(n).getCurrentYear());
						contrastYears[m]=tenFlowFrequencyList.get(n).getCurrentYear();
						//System.out.println("+++++++++++++++++++++++++++++++");
					}
					m=m+n;
				}else{
					contrastYears[m]=tenFlowFrequencyList.get(0).getCurrentYear();
				}
				System.out.println("========================");
			}
			
			//将排序好的流量和年份重新更新表
			for(int l=0;l<list.size();l++){
				TenFlowFrequency tenFlowFrequency2 = list.get(l);
				tenFlowFrequency2.setDescendingArrangement(array[l]);
				tenFlowFrequency2.setNo(l+1);
				tenFlowFrequency2.setContrastYear(contrastYears[l]);
				
				//频率
				int m=l+1;
				int n=list.size();
				DecimalFormat df=new DecimalFormat("0.0000");
			    String s= df.format((double)m/(n+1)*100);
				BigDecimal c = new BigDecimal(s);
				tenFlowFrequency2.setFrequency(c);
				tenFlowService.updateTenFlowFrequency(tenFlowFrequency2);
			}
		}	
		
		return "redirect:/ten/list";
	}
	
	
	
	
}
