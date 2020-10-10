package com.zyjz.utils.controller;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.*;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zyjz.sysmanage.entity.*;
import com.zyjz.sysmanage.service.*;
import com.zyjz.user.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.zyjz.plan.entity.WaterTreeUser;
import com.zyjz.plan.service.WaterTreeUserService;
import com.zyjz.user.entity.SysPermission;
import com.zyjz.user.entity.SysPermissionVO;
import com.zyjz.user.entity.SysRolePermission;
import com.zyjz.user.entity.SysUser;
import com.zyjz.user.entity.SysUserRole;
import com.zyjz.user.service.PermissionService;
import com.zyjz.user.service.RolePermissionService;
import com.zyjz.user.service.UserRoleService;
import com.zyjz.watersupply.entity.WaterTreeStructure;
import com.zyjz.watersupply.service.WaterTreeStructureService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @ClassName: BaseUtils
 * @Description: 页面分类公共类
 * @Author: renww
 * @Date: 2018年3月28日 上午10:29:03
 */
@Component
public class BaseUtils {

	@Autowired
	private UserRoleService userRoleService;
	@Autowired
	private RolePermissionService rolePermissionService;
	@Autowired
	private PermissionService permissionService;
	@Autowired
	private SysWaterAreaService sysWaterAreaService;
	@Autowired
	private SysAreaService sysAreaService;

	@Autowired
	private CalCanalInfoService calCanalInfoService;

	@Autowired
	private WaterTreeStructureService waterTreeStructureService;

	@Autowired
	private WaterTreeUserService waterTreeUserService;

	@Autowired
	private SiteMiddleCanalService siteMiddleCanalService;

	@Autowired
	private ReservoirManagerService reservoirManagerService;

	@Autowired
	private UserService userService;

	private static BaseUtils baseUtils;

	@PostConstruct     //关键二   通过@PostConstruct 和 @PreDestroy 方法 实现初始化和销毁bean之前进行的操作
	public void init() {
		baseUtils = this;
		baseUtils.userRoleService = this.userRoleService;   // 初使化时将已静态化的testService实例化
		baseUtils.rolePermissionService = this.rolePermissionService;
		baseUtils.permissionService = this.permissionService;
		baseUtils.sysWaterAreaService = this.sysWaterAreaService;
		baseUtils.calCanalInfoService = this.calCanalInfoService;
		baseUtils.sysAreaService = this.sysAreaService;
		baseUtils.waterTreeStructureService = this.waterTreeStructureService;
		baseUtils.waterTreeUserService = this.waterTreeUserService;
		baseUtils.siteMiddleCanalService = this.siteMiddleCanalService;
		baseUtils.userService = this.userService;
	}

	/**
	 * 根据登录的账号拿到菜单
	 * @return
	 */
	@ResponseBody
	public List<SysPermission> menuData(HttpServletRequest request, HttpServletResponse response) {
		List<SysPermission> perList = new ArrayList<>();
		try {
			SysUser sysUser = (SysUser) request.getSession().getAttribute("sysUser");
			if (sysUser != null) {
				//从用户角色表中获取RoleId
				List<SysUserRole> sysUserRoleByUserId = baseUtils.userRoleService.findSysUserRoleByUserId(sysUser.getId());
				for (SysUserRole sysUserRole : sysUserRoleByUserId) {
					if (StringUtils.isNotBlank(sysUserRole.getRoleId())) {
						perList = baseUtils.permissionService.findMenuList(sysUserRole.getRoleId(),1);//先查询当前用户级别为1的菜单
						List<SysPermission> AllList = baseUtils.permissionService.findMenuList(sysUserRole.getRoleId(),null);//根据角色id查询当前用户的菜单
						if(perList.size()>0){
							for(SysPermission sp:perList){
								sp.setChildren(resource(sp.getId(),AllList));//将树结构的children作为实体的一个字段set进List即可
							}
						}
					}else{
						request.getRequestDispatcher("/map/map_page").forward(request, response);
					}
				}
			} else {
				request.getRequestDispatcher("/map/map_page").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return perList;
	}

	/**
	 * 根据该方法遍历出左侧菜单结构
	 * @param id
	 * @param list
	 * @return
	 */
	public List<SysPermission> resource(String id,List<SysPermission> list){
		List<SysPermission> menuList = new ArrayList<>();
		if(list.size()>0){//一级遍历
			for(SysPermission li:list){
				if(StringUtils.isNotBlank(li.getParentMenuId())){
					if(id.equals(li.getParentMenuId())){
						menuList.add(li);
					}
				}
			}
		}
		if(menuList.size()>0){//循环遍历（扫出所有的子目录）
			for(SysPermission sp:menuList){
				if(StringUtils.isNotBlank(sp.getId())){
					sp.setChildren(resource(sp.getId(),list));
				}
			}
		}
		return menuList;
	}

	/**
	 * @throws
	 * @Title: showMenu
	 * @Description: 主要方法renww
	 * @param: @param model
	 * @param: @param request
	 * @return: void
	 */
	public void showMenu(Model model, HttpServletRequest request, int state) {

		/*//加载导航页面
		SysUser sysUser = (SysUser) request.getSession().getAttribute("sysUser");
		List<SysUserRole> sysUserRoleList = baseUtils.userRoleService.findSysUserRoleByUserId(sysUser.getId());

		List<SysRolePermission> sysRolePermissionListTotal = new ArrayList<>();

		//根据角色为取出全部的角色权限
		for (int i = 0; i < sysUserRoleList.size(); i++) {
			List<SysRolePermission> sysRolePermissionList = baseUtils.rolePermissionService.findSysRolePermissionByRoleId(sysUserRoleList.get(0).getRoleId());
			sysRolePermissionListTotal.addAll(sysRolePermissionList);
		}

		//放所有的权限
		List<String> menuIds = new ArrayList<>();
		//根据角色权限取出全部的权限id
		for (int j = 0; j < sysRolePermissionListTotal.size(); j++) {
			menuIds.add(sysRolePermissionListTotal.get(j).getMenuId());
		}
		//去除重复的菜单id
		menuIds = new ArrayList<>(new HashSet<>(menuIds));

		List<SysPermission> sysPermissionListTotal = baseUtils.permissionService.findPermissionByIds(menuIds);//此用户所有的权限
		List<SysPermission> sysPermissionList1 = new ArrayList<SysPermission>();//一级目录权限
		//List<SysPermission> sysPermissionList2 = new ArrayList<SysPermission>();//二级目录权限
		List<SysPermission> sysPermissionList3 = new ArrayList<SysPermission>();//三级目录权限
		for (int k = 0; k < sysPermissionListTotal.size(); k++) {
			//SysPermission sysPermission = baseUtils.permissionService.findPermissionById(menuIds.get(k));
			//判断选中状态
			if (sysPermissionListTotal.get(k).getMenuCode() == state) {
				//将此页面二级权限的code传过去，来判断是否选中
				model.addAttribute("twoMenuCode", sysPermissionListTotal.get(k).getMenuCode());
				//拿一级权限的code
				SysPermission pSysPermission = baseUtils.permissionService.findPermissionById(sysPermissionListTotal.get(k).getParentMenuId());
				model.addAttribute("oneMenuCode", pSysPermission.getMenuCode());
			}
			if (sysPermissionListTotal.get(k).getMenuLevel() == 1) {
				sysPermissionList1.add(sysPermissionListTotal.get(k));
			}

			if (sysPermissionListTotal.get(k).getMenuLevel() == 3) {
				sysPermissionList3.add(sysPermissionListTotal.get(k));
			}
		}

		//包装权限类
		List<SysPermissionVO> sysPermissionVOList = new ArrayList<>();
		for (int l = 0; l < sysPermissionList1.size(); l++) {
			SysPermissionVO sysPermissionVO = new SysPermissionVO();
			BeanUtils.copyProperties(sysPermissionList1.get(l), sysPermissionVO);
			List<SysPermission> sysPermissionList2 = new ArrayList<>();

			for (int m = 0; m < sysPermissionListTotal.size(); m++) {
				if (sysPermissionListTotal.get(m).getParentMenuId().equals(sysPermissionList1.get(l).getId())) {
					sysPermissionList2.add(sysPermissionListTotal.get(m));
				}
			}
			sysPermissionVO.setSysChildsPermissions(sysPermissionList2);
			sysPermissionVOList.add(sysPermissionVO);
		}
		model.addAttribute("sysPermissionVOList", sysPermissionVOList);
		//三级目录控制回显(sysPermissionList3)用户所具有的3级权限
		model.addAttribute("threeLevelPermissions", sysPermissionList3);


		//树目录权限======================================================================================
		//水管区树目录回显
		String waterAreaCode = sysUser.getSyswaterareaCode();
		List<SysWaterArea> sysWaterAreaList = baseUtils.sysWaterAreaService.findSonWaterAreasByCode(waterAreaCode);
		//水管区树目录
		model.addAttribute("sysWaterAreaList", sysWaterAreaList);
		//将最高级的水管区传回前端
		model.addAttribute("id", sysWaterAreaList.get(0).getId());
		request.getSession().setAttribute("id", sysWaterAreaList.get(0).getId());
		//渠道树目录回显==================================================================================

		List<CalCanalInfo> calCanalInfoList = baseUtils.calCanalInfoService.findAllCanalsByWaterAreaCode(sysUser.getCanalCode());
		if (calCanalInfoList != null && calCanalInfoList.size() > 0) {
			model.addAttribute("canalId", calCanalInfoList.get(0).getCanalCode());
		} else {
			model.addAttribute("canalId", "0");
		}
		//渠道树目录回显
		model.addAttribute("calCanalInfoList", calCanalInfoList);
		//将最高级的渠道传回前端
		//model.addAttribute("canalId", calCanalInfoList.get(0).getId());
		request.getSession().setAttribute("canalId", calCanalInfoList.get(0).getCanalCode());
		//行政区树目录回显
		//渠道所属行政区，行政区共享不设权限
		List<SysArea> sysAreaList = baseUtils.sysAreaService.getAllSysAreaInfo();
		model.addAttribute("sysAreaList", sysAreaList);
		//最高级的id
		model.addAttribute("areaId", sysAreaList.get(0).getId());
		request.getSession().setAttribute("areaId", sysAreaList.get(0).getId());
		//供水模块树结构
		List<WaterTreeStructure> waterList = baseUtils.waterTreeStructureService.selectAll();
		model.addAttribute("waterList", waterList);
		//用水户模块树结构
		List<WaterTreeUser> waterUserList = baseUtils.waterTreeUserService.selectAll();
		model.addAttribute("waterUserList", waterUserList);*/
	}

	/**
	 * 权限去重 （
	 *
	 * @param
	 * @return
	 */
	private List<SysRolePermission> menuDereplication(List<SysRolePermission> sysRolePermissionList) {
		List<SysRolePermission> sysRolePermissionList2 = new ArrayList<>();
		for (SysRolePermission sysRolePermission : sysRolePermissionList) {
			if (!sysRolePermissionList2.contains(sysRolePermission)) {
				sysRolePermissionList2.add(sysRolePermission);
			}
		}
		return sysRolePermissionList2;
	}


	//树结构 ===================（一系列）=======================

	/**
	 * 行政区的树结构
	 * @return
	 */
	public String areaTreeList(String areaCode,String id,HttpServletRequest request) {
        List<SysArea> list = new ArrayList<>();
        try {
            if(!StringUtils.isNotBlank(areaCode)&&!StringUtils.isNotBlank(id)){
                HttpSession session = request.getSession();
                SysUser sysUser = (SysUser)session.getAttribute("sysUser");
                areaCode = sysUser.getSysareaCode();
                id = sysUser.getSysareaId();
            }
            list = baseUtils.sysAreaService.selectByIdOrCode(id,areaCode);
            List<SysArea> listAll = baseUtils.sysAreaService.getAllSysAreaInfo();
            if(list.size()>0){
                for(SysArea sw:list){
                    sw.setChildren(getAreaTreeList(sw.getId(),listAll));
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
		return JSON.toJSONString(list);
	}

	/**
	 * 行政区的树结构调用方法
	 * @param id
	 * @param menuList
	 * @return
	 */
	private List<SysArea> getAreaTreeList(String id,List<SysArea> menuList){

        List<SysArea> meyList = new ArrayList<>();
        if(menuList.size()>0){
            for(SysArea sw:menuList){
                if(id.equals(sw.getParentAreaId())){
                    meyList.add(sw);
                }
            }
        }
        if(meyList.size()>0){
            for(SysArea sw:meyList){
                sw.setChildren(getAreaTreeList(sw.getId(),menuList));
            }
        }
		return meyList;
	}

	/**
	 * 水管区的树结构
	 * @param waterCode 水管编码
	 * @param id 水管区id
	 * @return
	 */
	public String waterTreeList(String waterCode,String id,HttpServletRequest request) {
		List<SysWaterArea> list = new ArrayList<>();
		try {
			if(!StringUtils.isNotBlank(waterCode)&&!StringUtils.isNotBlank(id)){
				HttpSession session = request.getSession();
				SysUser sysUser = (SysUser)session.getAttribute("sysUser");
				waterCode = sysUser.getSyswaterareaCode();
				id = sysUser.getSyswaterareaId();
			}
			list = baseUtils.sysWaterAreaService.selectByPrimaryWater(id,waterCode);
			List<SysWaterArea> listAll = baseUtils.sysWaterAreaService.findAllWaterAreas();
			if(list.size()>0){
				for(SysWaterArea sw:list){
					sw.setChildren(waterAreaResource(sw.getId(),listAll));
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return JSONObject.toJSONString(list);
	}
	/**
	 * 水管区域树结构的调用方法
	 * @param id
	 * @param menuList
	 * @return
	 */
	public List<SysWaterArea> waterAreaResource(String id,List<SysWaterArea> menuList){
		List<SysWaterArea> meyList = new ArrayList<>();
		if(menuList.size()>0){
			for(SysWaterArea sw:menuList){
				if(id.equals(sw.getParentWaterareaId())){
					meyList.add(sw);
				}
			}
		}
		if(meyList.size()>0){
			for(SysWaterArea sw:meyList){
				sw.setChildren(waterAreaResource(sw.getId(),menuList));
			}
		}
		return meyList;
	}

	/**
	 * 渠道的树结构
	 * @param canalCode 渠道编码
	 * @param canalId 渠道id
	 * @return
	 */
	public String canalTreeList(String canalCode,String canalId,HttpServletRequest request) {
		List<CalCanalInfo> list = new ArrayList<>();
		try {
            if(!StringUtils.isNotBlank(canalCode)){
				HttpSession session = request.getSession();
				SysUser sysUser = (SysUser)session.getAttribute("sysUser");
				canalCode = sysUser.getCanalCode();
            }
			list = baseUtils.calCanalInfoService.selectByPrimaryKey(canalId,canalCode);
			List<CalCanalInfo> listAll = baseUtils.calCanalInfoService.findAllCanal();
			for (CalCanalInfo canalInfo : list) {
				canalInfo.setChildren(calCanalResource(canalInfo.getId(),listAll));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return JSONObject.toJSONString(list);
	}

	/**
	 * 渠道的树子菜单调用方法
	 * @param id
	 * @param menuList
	 * @return
	 */
	public List<CalCanalInfo> calCanalResource(String id, List<CalCanalInfo> menuList){
		List<CalCanalInfo> calList = new ArrayList<>();
		for (CalCanalInfo canalInfo : menuList) {
			if(id.equals(canalInfo.getCanalParentId())){
				calList.add(canalInfo);
			}
		}
		for (CalCanalInfo canalInfo : calList) {
			canalInfo.setChildren(calCanalResource(canalInfo.getId(),menuList));
		}
		return calList;
	}

	/**
	 * 水库树菜单取得
	 * @param id
	 * @param reservoirCode
	 * @param request
	 * @return
	 */
	public String reservoirTreeList(String id, String reservoirCode, HttpServletRequest request){
		List<SiteReservoirInfo> siteReservoirInfoList = new ArrayList<>();
		//查询出所有水库,全为同一等级
		List<SiteReservoirInfo> list = reservoirManagerService.findAllReservoir();

		return JSONObject.toJSONString(list);
	}


	/**
	 * 编码生成方法
	 * @param code
	 * @param level
	 * @return
	 */
	public String codeGeneration(String type,String code,String level){
		//最高级编码
		if(StringUtils.isEmpty(code)){
			//行政区
			if("sysArea".equals(type)){
				//更新sysUser表
				return "620700000000";
			}
			//水管区
			if("sysWaterArea".equals(type)){
				return "620600000000";
			}
			//渠道
			if("calCanalArea".equals(type)){
				return "620800000000";
			}
		}

		//行政区编码
		if("6207".equals(substrCode(code,"0"))){
			//查询子权限最后一条编码
			SysArea sysArea = baseUtils.sysAreaService
					.selectChildSysAreaByCode(substrCode(code,level), String.valueOf((Integer.parseInt(level)+1)));
			if(sysArea != null){
				//子权限最后一个编码code加1
				return concatCodeIncr(sysArea.getAreaCode(),String.valueOf((Integer.parseInt(level)+1)),true);
			}
		}
		//水管区编码
		if("6206".equals(substrCode(code,"0"))){
			//查询子权限最后一条编码
			SysWaterArea sysWaterArea = baseUtils.sysWaterAreaService
					.selectChildSysWaterAreaByCode(substrCode(code,level), String.valueOf((Integer.parseInt(level)+1)));
			if(sysWaterArea != null){
				//子权限最后一个编码code加1
				return concatCodeIncr(sysWaterArea.getWaterAreaCode(),String.valueOf((Integer.parseInt(level)+1)),true);
			}
		}
		//渠道编码
		if("6208".equals(substrCode(code,"0"))){
			//查询子权限最后一条编码
			CalCanalInfo calCanalInfo = baseUtils.calCanalInfoService
					.selectChildCalCanalByCode(substrCode(code,level), String.valueOf((Integer.parseInt(level)+1)));
			if(calCanalInfo != null){
				//子权限最后一个编码code加1
				return concatCodeIncr(calCanalInfo.getCanalCode(),String.valueOf((Integer.parseInt(level)+1)),true);
			}
		}
		//其他编码
		//。。。。。。。。。

		//该权限下无子区域，返回该权限下的第一个子区域
		return concatCodeIncr(substrCode(code,level),"",false);
	}

	/**
	 * 根据权限级别截取编码
	 * @param code
	 * @param level
	 * @return
	 */
	private String substrCode(String code,String level){
		if(StringUtils.isNotBlank(code)){
			switch (level){
				case "0"://一级权限
					code = code.substring(0,4);
					break;
				case "1"://二级权限
					code = code.substring(0,6);
					break;
				case "2"://三级权限
					code = code.substring(0,8);
					break;
				case "3"://四级权限
					code = code.substring(0,10);
					break;
				default:;//TODO  其他权限
			}
		}
		return code;
	}

	/**
	 * 根据权限级别截取编码
	 * @param code
	 * @param level
	 * @return
	 */
	private String concatCodeIncr(String code,String level,boolean flag){
		StringBuilder strCode = new StringBuilder();
		//当前行政区域下存在子行政区域
		if(StringUtils.isNotBlank(code)){
			if(flag){
				switch (level){
					case "1"://二级权限
						strCode =strCode.append(Integer.valueOf(code.substring(0,6))+1);
						break;
					case "2"://三级权限
						strCode = strCode.append(Integer.valueOf(code.substring(0,8))+1);
						break;
					case "3"://四级权限
						strCode = strCode.append(Integer.valueOf(code.substring(0,10))+1);
						break;
					default:;//TODO  其他权限
				}
			}else{
				strCode = strCode.append(code).append("01");
			}
			//不满12位补0
			while(strCode.length() < 12){
				strCode.append('0');
			}
		}
		return strCode.toString();
	}

	/**
	 * 站点新增时中间表的插入和更新
	 * @param tableName
	 * @param canalCode
	 * @param columnName 中间表列名
	 * @param code
	 * @return
	 */
	@Transactional
	public int updateSiteMiddle(String tableName, String canalCode,String columnName,String code,HttpServletRequest request){
		SysUser sysUser = (SysUser) request.getSession().getAttribute("sysUser");
		Class<? extends SiteMiddleCanal> clazz = null;
		Method method = null;
		//列名转属性名
		StringBuilder str = new StringBuilder();
		boolean flag = false;
		//将首字母及“_”后字母转大写
		for (char c : columnName.toCharArray()) {
			if('_' != c){
				if(flag){
					str.append(StringUtils.upperCase(String.valueOf(c)));
				}else{
					str.append(c);
				}
				flag = false;
			}else{
				flag = true;
			}
		}
		//反射调用set方法首字母大写
		String propertyName = str.substring(0, 1).toUpperCase() + str.substring(1);
		//遍历获得该canalCode及父区域canalCode
		List<String> canalCodeList = getCanalCodes(tableName, canalCode);
		int state = 0;
		SiteMiddleCanal siteMiddleCanal = null;
		//遍历插入或更新中间表
		for (String canal : canalCodeList) {
			//查询当前canalCode和对应列为空的数据
			String updateCanalCode = "'"+canal+"'";
			List<SiteMiddleCanal> siteMiddleCanalList = baseUtils.siteMiddleCanalService
					.selectCanalInfoByCodeIsNull(updateCanalCode, columnName);
			//该canalCode当前存在多余数据
			if(siteMiddleCanalList.size() > 0){
				//SiteMiddleCanal表更新
				siteMiddleCanal = siteMiddleCanalList.get(0);
				//反射为该列赋值
				try {
					clazz = siteMiddleCanal.getClass();
					Field declaredField = clazz.getDeclaredField(str.toString());
					declaredField.setAccessible(true);
					declaredField.set(siteMiddleCanal,code);
				} catch (Exception e) {
					e.printStackTrace();
				}

				//中间表更新
				state = baseUtils.siteMiddleCanalService.updateByPrimaryKeySelective(siteMiddleCanal);
			}else{
				//SiteMiddleCanal表新增
				siteMiddleCanal = new SiteMiddleCanal();
				siteMiddleCanal.setCanalCode(canal);
				//反射为该列赋值
				try {
					clazz = siteMiddleCanal.getClass();
					Field declaredField = clazz.getDeclaredField(str.toString());
					declaredField.setAccessible(true);
					declaredField.set(siteMiddleCanal,code);
				} catch (Exception e) {
					e.printStackTrace();
				}
				siteMiddleCanal.setRemark(sysUser.getUserName());
				//中间表新增
				state = baseUtils.siteMiddleCanalService.insertSelective(siteMiddleCanal);
			}
		}
		return state;
	}

	/**
	 * 遍历获取所有canalCode
	 * @param tableName
	 * @param canalCode
	 * @return
	 */
	private List<String>  getCanalCodes(String tableName, String canalCode){
		//行政区Id或水管区Id集合List
		List<String> sysIdList = new ArrayList<>();
		//渠道信息集合
		List<CalCanalInfo> calCanalInfoList = new ArrayList<>();
		//canCodeList集合
		Set<String> canalCodeList = null;
		//查询该渠信息
		CalCanalInfo calCanalInfo= baseUtils.calCanalInfoService.findCanalByCode(canalCode);
		if(calCanalInfo != null){
			//水管区添加站点
			if("sysWaterArea".equals(tableName)){
				//查询当前水管区信息
				SysWaterArea sysWaterArea = baseUtils.sysWaterAreaService.findWaterAreaById(calCanalInfo.getSyswaterareaId());
				if(sysWaterArea != null){
                    sysIdList.add(sysWaterArea.getId());
                    //当前水管区存在父水管区
                    while(StringUtils.isNotBlank(sysWaterArea.getParentWaterareaId())){
                        sysWaterArea = baseUtils.sysWaterAreaService.findWaterAreaById(sysWaterArea.getParentWaterareaId());
                        sysIdList.add(sysWaterArea.getId());
                    }
                    //根据水管区Id查询所有渠道信息
                    calCanalInfoList = baseUtils.calCanalInfoService.findCanalsBySysWaterAreaCode(sysIdList);
                }
			}

			//行政区添加站点
			if("sysArea".equals(tableName)){
				//查询当前行政区信息
				SysArea sysArea = baseUtils.sysAreaService.findAreaById(calCanalInfo.getSysareaId());
				if(sysArea != null){
                    sysIdList.add(sysArea.getId());
                    //当前行政区存在父行政区
                    while(StringUtils.isNotBlank(sysArea.getParentAreaId())){
                        sysArea = baseUtils.sysAreaService.findAreaById(sysArea.getParentAreaId());
                        sysIdList.add(sysArea.getId());
                    }
                    //根据行政区Id查询所有渠道信息
                    calCanalInfoList = baseUtils.calCanalInfoService.findCanalsBySysAreaCode(sysIdList);
                }
			}

			//按渠道添加
			if("calCanal".equals(tableName)){
				calCanalInfoList.add(calCanalInfo);
				//当前渠道的父渠道存在
				while(StringUtils.isNotBlank(calCanalInfo.getCanalParentId())){
					calCanalInfo = baseUtils.calCanalInfoService.findCanalById(calCanalInfo.getCanalParentId());
					calCanalInfoList.add(calCanalInfo);
				}
            }
		}
		canalCodeList = calCanalInfoList.stream().map(x -> x.getCanalCode()).collect(Collectors.toSet());
		System.out.println(canalCodeList);
		//根据渠道编码查询该渠道数据
		return new ArrayList<>(canalCodeList);
	}
}
