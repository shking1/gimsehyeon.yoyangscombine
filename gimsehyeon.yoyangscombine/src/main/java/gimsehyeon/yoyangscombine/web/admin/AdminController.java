package gimsehyeon.yoyangscombine.web.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gimsehyeon.yoyangscombine.domain.User;
import gimsehyeon.yoyangscombine.service.communication.pager.Pager;
import gimsehyeon.yoyangscombine.service.user.UserService;

@Controller
public class AdminController {
	@Autowired private UserService userService;
	
	@RequestMapping("/admin")
	public String allUsers(Model model, @RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyWord, @RequestParam(defaultValue = "1") int curPage)
			throws Exception{
		int count = userService.calcUser(searchOption, keyWord);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		// 게시글 목록
		List<User> lists = userService.getUsers(start, end, searchOption, keyWord);
		// 맵에 자료 저장
		Map<String, Object> users = new HashMap<>();
		users.put("lists", lists);
		users.put("count", count);
		users.put("searchOption", searchOption);
		users.put("keyWord", keyWord);
		users.put("pager", pager);
		// 데이터 저장
		model.addAttribute("users", users);
		// 이동할 페이지 지정
		return "admin/main";
	}
}
