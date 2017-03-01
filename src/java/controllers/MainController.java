package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

    @RequestMapping(value = "/")
    public ModelAndView layout(ModelMap model) {
        model.addAttribute("view", "korisnik/prijava");
        ModelAndView modelAndView = new ModelAndView("logovanje");
        return modelAndView;
    }
}
