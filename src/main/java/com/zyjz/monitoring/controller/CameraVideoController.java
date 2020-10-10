package com.zyjz.monitoring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cameraVideo")
public class CameraVideoController {

	@RequestMapping("/to_CameraVideoList")
	public String to_CameraVideoList(){
		return "/comeravideo/dome";
	}
}
