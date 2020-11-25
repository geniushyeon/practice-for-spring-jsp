package shop.jamielee.springonintellij.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
//import shop.jamielee.springonintellij.service.TodoService;

@Controller
@RequestMapping("/")
public class IndexController {

//    private final TodoService todoService;
//
//    public IndexController(TodoService todoService) {
//        this.todoService = todoService;
//    }

    @GetMapping
    public String index() { // 경로가 /이고 HTTP 메소드가 GET인 경우
        return "index"; // view name
    }

    @GetMapping("/new-page")
    public String newPage() {
        return "abc";
    }

    @GetMapping("/user-info")
    public String userInfo(Model model) {
        model.addAttribute("name", "지니어스현");
        model.addAttribute("email", "jhlee0912@icloud.com");
        return "userView";
    }
}
