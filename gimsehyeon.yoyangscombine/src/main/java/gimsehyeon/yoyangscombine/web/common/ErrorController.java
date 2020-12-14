package gimsehyeon.yoyangscombine.web.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/error")
public class ErrorController {
	@GetMapping
	public String defaultError() {
		return "common/error/errorNot404";
	}

	@GetMapping("/no-resource")
	public String noResource() {
		return "common/error/error404";
	}

	@GetMapping("/server-error")
	public String serverError() {
		return "common/error/errorNot404";
	}
	
	@GetMapping("/405")
	public String error405() {
		return "common/error/errorNot404";
	}
}