package com.zyjz.watersupply.controller;
import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.zyjz.sitemanage.web.JsonResult;
import com.zyjz.watersupply.entity.SynFpud;
import com.zyjz.watersupply.entity.WaterTreeStructure;
import com.zyjz.watersupply.service.SynFpudService;
import com.zyjz.watersupply.service.WaterTreeStructureService;

/**
 * 供水公司
 * @ClassName: SynFpudController
 * @Description: 
 * @Author: liyue
 * @Date: 2018年5月15日 下午2:48:05
 */
@RequestMapping("/syn_fpud")
@Controller
public class SynFpudController {
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(SynFpud.class);
	@Autowired
	private WaterTreeStructureService waterTreeStructureService;
	
	@Autowired
	private SynFpudService synFpudService;
	//新增页面
	private static final String WATER_WORKS_ADD = "/watersupply/syn_fpud/syn_fpud_add";
	//修改页面
	private static final String WATER_WORKS_UPDATE ="/watersupply/syn_fpud/syn_fpud_update";

	/*跳转至新增供水公司信息页面*/
	@RequestMapping("/addData")
	public String addData(String id,Model model){
		model.addAttribute("Addid", id);
		return WATER_WORKS_ADD;
	}
	
	//新增供水公司信息
	@RequestMapping("/insertData")
	@ResponseBody
	public JsonResult insertData(SynFpud synFpud, MultipartFile file){
		//设置图片名称不能重复UUID
		String picName = UUID.randomUUID().toString();
		//获取文件名称
		String oriName = file.getOriginalFilename();
		//获取图片后缀
		String extName = oriName.substring(oriName.lastIndexOf("."));
		//开始上传
		try{
			file.transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
			WaterTreeStructure wts = waterTreeStructureService.selectByPrimaryKey(synFpud.getSysareaId());
			WaterTreeStructure wtst = new WaterTreeStructure();
				String uid = UUID.randomUUID().toString().replace("-", "");
				wtst.setLabel(synFpud.getFpudName());
				wtst.setParentLevelId(synFpud.getSysareaId());
				wtst.setCreationTime(new Date());
				wtst.setTreeLevel(wts.getTreeLevel()+1);
				wtst.setTreeRemark(synFpud.getFpudName());
				waterTreeStructureService.insertSelective(wtst);
				synFpud.setCreationTime(new Date());
				synFpud.setId(uid);
				synFpud.setPhotos(picName + extName);
			synFpudService.insertSelective(synFpud);
				logger.info("新增供水公司信息成功："+synFpud.getFpudName());
		}catch(Exception e){
			logger.error("新增供水公司信息失败",e);
		}
		return new JsonResult();
	}
	//查询供水公司信息
	@RequestMapping("/selectData")
	@ResponseBody
	public JsonResult selectData(String id){
		List<SynFpud> list = null;
		try{
			if(id==null||id==""){
				WaterTreeStructure treeId = waterTreeStructureService.selectMin();
				 list = synFpudService.selectSysareaId(treeId.getId());
			}else{
				 list = synFpudService.selectSysareaId(id);
			}
			logger.info("查询供水公司成功：");
		}catch(Exception e){
			logger.error("查询供水公司信息失败",e);
		}
		return new JsonResult(list);
	}
	/*返回修改供水公司信息页面*/
	@RequestMapping("/updateData")
	public String  updateData(String id,Model model){
		SynFpud synFpud  = synFpudService.selectByPrimaryKey(id);
		model.addAttribute("SynFpud",synFpud);
		
		
		return WATER_WORKS_UPDATE;
	}
	/*修改供水公司信息*/
	@RequestMapping("/updataSynFpud")
	@ResponseBody
	public JsonResult updataSynFpud(SynFpud synFpud, MultipartFile file){
		try{
				if(file.getOriginalFilename()==""||file.getOriginalFilename()==null){
					System.out.println("================未更换供水公司图片=============");
				}else{
					//设置图片名称不能重复UUID
					String picName = UUID.randomUUID().toString();
					//获取文件名称
					String oriName = file.getOriginalFilename();
					//获取图片后缀
					String extName = oriName.substring(oriName.lastIndexOf("."));
					//开始上传
					file.transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
					synFpud.setPhotos(picName + extName);
				}
				synFpud.setCreationTime(new Date());
				synFpudService.updateByPrimaryKeySelective(synFpud);
				logger.info("修改供水公司信息成功");
		}catch(Exception e){
			logger.info("修改供水公司信息失败");
		}
		return new JsonResult();
	}
	/*删除供水公司信息*/
	@RequestMapping("/deleteData")
	@ResponseBody
	public JsonResult deleteData(String id){
		try{
			synFpudService.deleteByPrimaryKey(id);
			logger.info("删除供水公司信息成功：");
		}catch(Exception e){
			logger.error("删除供水公司信息失败");
		}
		return new JsonResult();
	}
}










