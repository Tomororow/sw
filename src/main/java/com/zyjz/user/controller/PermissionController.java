package com.zyjz.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.user.entity.SysPermission;
import com.zyjz.user.service.PermissionService;
import com.zyjz.utils.controller.BaseUtils;

/**
 * @ClassName: PermissionController
 * @Description: 
 * @Author: rww
 * @Date: 2018年3月25日 下午5:14:53
 */
@Controller
@RequestMapping("/permission")
public class PermissionController {

	@Autowired
	PermissionService permissionService;
	
	/** 视图解析页面路径 */
	protected static final String SYS_PERMISSION_JSP =  "/sysmanage/sys_permission/list";
	protected static final String ADD_PERMISSION_JSP =  "/sysmanage/sys_permission/add_permission";
	protected static final String EDIT_PERMISSION_JSP =  "/sysmanage/sys_permission/edit_permission";
	/**
	 * @Title: list
	 * @Description: 进入权限列表renww
	 * @param: @param model
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/list")
	public String list(Model model,HttpServletRequest request){
		
//		BaseUtils baseUtils = new BaseUtils();
//		baseUtils.showMenu(model, request, state);
		
		
		List<SysPermission> sysPermissionList = permissionService.findAllPermission();
		model.addAttribute("sysPermissionList", sysPermissionList);
		if(sysPermissionList!=null&&sysPermissionList.size()>0){
			model.addAttribute("id", sysPermissionList.get(0).getId());
		}else{
			model.addAttribute("id","0");
		}
		return SYS_PERMISSION_JSP;			
		
	}
	
	List<String >  sysPermissionIds = new ArrayList<>();
	@RequestMapping(value="/page")
	public @ResponseBody List<SysPermission> page(String id,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="8") Integer pageSize){
		//当前点击的区域
		//把当前的区域加入到列表中
		
			SysPermission sysPermission=permissionService.findPermissionById(id);
			getPermissions(id);
			sysPermissionIds.add(id);
			PageHelper.startPage(page, pageSize);
			List<SysPermission> list = permissionService.findPermissionByIds(sysPermissionIds);
			//清空全局list
			sysPermissionIds.clear();
			PageInfo<SysPermission> pages = new PageInfo<SysPermission>(list);
			request.getSession().setAttribute("sysPermissionPages", pages);
			
		return list;
	}
	//递归拿到所有的权限id
	public void getPermissions(String id){
		List<SysPermission>  sysPermissionList = permissionService.findPermissionByPId(id);
		if(sysPermissionList!=null&&sysPermissionList.size()>0){
			for(int i=0;i<sysPermissionList.size();i++){
				sysPermissionIds.add(sysPermissionList.get(i).getId());
				List<SysPermission>  sysPermissionList2 = permissionService.findPermissionByPId(sysPermissionList.get(i).getId());
				if(sysPermissionList2!=null&&sysPermissionList2.size()>0){
					getPermissions(sysPermissionList.get(i).getId());
				}
			}
		}
	}
	
	
	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<SysPermission> pageNav(HttpServletRequest request){
		PageInfo<SysPermission> pages = (PageInfo<SysPermission>) request.getSession().getAttribute("sysPermissionPages");
		return pages;
	}
	
	
	/**
	 * @Title: addPermissionPage
	 * @Description: 进入添加页面renww
	 * @param: @param model
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/add_page")
	public String addPermissionPage(String parentMenuId,int menuLevel,Model model){
		model.addAttribute("parentMenuId", parentMenuId);
		model.addAttribute("menuLevel", menuLevel);
		
		System.out.println("1111");
		return ADD_PERMISSION_JSP;
	}
	
	
	
	/**
	 * @throws IOException 
	 * @throws IllegalStateException 
	 * @Title: add
	 * @Description: //添加权限renww
	 * @param: @param sysPermission
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/add")
	public String add(SysPermission sysPermission,MultipartFile file) throws IllegalStateException, IOException{
		
		//设置图片名称不能重复UUID
//		String picName = UUID.randomUUID().toString();
		//获取文件名称
//		String oriName = file.getOriginalFilename();
		//获取图片后缀
//		String extName = oriName.substring(oriName.lastIndexOf("."));
		//开始上传
//		file.transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
		//将名称存入数据库
//		sysPermission.setMenuIcon(picName + extName);
		
		sysPermission.setSmCreateTime(new Date());
		int a = permissionService.addPermission(sysPermission);
		return "redirect:/permission/list";
	}
	
	/**
	 * @Title: editPermissionPage
	 * @Description: 进入编辑页面renww
	 * @param: @param model
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/edit_page")
	public String editPermissionPage(String id,Model model){
		SysPermission sysPermission = permissionService.findPermissionById(id);
		model.addAttribute("sysPermission", sysPermission);
		return EDIT_PERMISSION_JSP;
	}
	
	
	
	/**
	 * @throws IOException 
	 * @throws IllegalStateException 
	 * @Title: edit
	 * @Description: //编辑权限renww
	 * @param: @param sysPermission
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/edit")
	public String edit(SysPermission sysPermission,MultipartFile file,Model model) throws IllegalStateException, IOException{
		
		//设置图片名称不能重复UUID
//		String picName = UUID.randomUUID().toString();
		//获取文件名称
//		String oriName = file.getOriginalFilename();
		//获取图片后缀
		
//		if(oriName!=null&&!"".equals(oriName)){
//			String extName = oriName.substring(oriName.lastIndexOf("."));
//			//开始上传
//			file.transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
//			//将名称存入数据库
//			System.out.println("-----------------------------------------------"+picName + extName);
//			sysPermission.setMenuIcon(picName + extName);
//		}
		sysPermission.setSmEditTime(new Date());
		int a = permissionService.updatePermission(sysPermission);
		if(a>=1){//成功返回1
			model.addAttribute("editFlag", 1);
		}else{//失败返回0
			model.addAttribute("editFlag", 0);
		}
		return "redirect:/permission/list";
	}
	
	int flag=0;
	@RequestMapping(value="/delete")
	public @ResponseBody String delete(String id) throws Exception{
		
		deletePermissionByPId(id);
		//permissionService.delete(id);
		if(flag>0){
			return "1";
		}else{
			return "0";
		}
	}
	
	/**
	 * @Title: deleteCanalByPId
	 * @Description: 循环删除 renww
	 * @param: @param id
	 * @return: void
	 * @throws
	 */
	public void deletePermissionByPId(String id){
		
		int a = permissionService.deleteById(id);
		flag+=a;
		List<SysPermission> list = permissionService.findPermissionByPId(id);
		if(list!=null&&list.size()>0){
			for(int i=0;i<list.size();i++){
				int b = permissionService.deleteById(list.get(i).getId());
				flag+=b;
				List<SysPermission> list2 = permissionService.findPermissionByPId(list.get(i).getId());
				if(list2!=null&&list2.size()>0){
					deletePermissionByPId(list.get(i).getParentMenuId());
				}
			}
		}
	}
}
