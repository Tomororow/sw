package com.zyjz.utils;
import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import com.zyjz.sitemanage.entity.WaterSurveySite;

/**
 * @ClassName: FileUtils
 * @Description: 文件上传工具类
 * @Author: zhaojx
 * @Date: 2018年3月15日 下午6:40:26
 */
public class FileUtils {
	
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(WaterSurveySite.class); 

	public static boolean saveFile(MultipartFile file, String path) {
		// 判断文件是否为空
		if (!file.isEmpty()) {
			try {
				File filepath = new File(path);
				if(!filepath.exists()){
					filepath.mkdirs();
				}
				// 转存文件
				file.transferTo(new File(path));
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}
}