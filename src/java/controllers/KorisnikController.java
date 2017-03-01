/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import static java.lang.System.in;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.inject.Scope;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeli.KontaktModel;
import modeli.KorisnikModel;
import org.json.JSONArray;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pojo.Kontakt;
import pojo.Korisnik;

/**
 *
 * @author PC
 */
@Controller
@RequestMapping(value = "/korisnik")
public class KorisnikController {
    
    private int idLogovanog = 0;
    
    @RequestMapping(value = "/prijava", method = RequestMethod.GET)
    public ModelAndView prijava(ModelMap mm) {
        mm.addAttribute("view", "korisnik/prijava");
        ModelAndView modelAndView = new ModelAndView("logovanje");
        return modelAndView;
    }
    
    @RequestMapping(value = "/pregled", method = RequestMethod.GET)
    public ModelAndView pregled(ModelMap mm) {
        KorisnikModel km = new KorisnikModel();
        Korisnik korisnik = km.find(idLogovanog);
        mm.addAttribute("korisnik", korisnik);
        mm.addAttribute("view", "pocetna");
        ModelAndView modelAndView = new ModelAndView("layout");
        return modelAndView;
    }

    @RequestMapping(value = "/registracija", method = RequestMethod.GET)
    public ModelAndView registracija(ModelMap mm) {
        mm.addAttribute("view", "korisnik/registracija");
        ModelAndView modelAndView = new ModelAndView("logovanje");
        return modelAndView;
    }
    
    @RequestMapping(value = "/kreiraj", method = RequestMethod.POST)
    public ModelAndView kreiraj(@ModelAttribute("form") Korisnik korisnik, ModelMap model) {
        KorisnikModel km = new KorisnikModel();
        km.create(korisnik);
        model.addAttribute("view", "korisnik/prijava");
        ModelAndView modelAndView = new ModelAndView("logovanje");
        return modelAndView;
    }
    
    @RequestMapping(value = "/pocetna/{idLogovanog}", method = RequestMethod.POST)
    public ModelAndView pocetna(@PathVariable int idLogovanog, ModelMap model) {
        KorisnikModel km = new KorisnikModel();
        Korisnik k = km.find(idLogovanog);
        model.addAttribute("korisnik", k);
        model.addAttribute("view", "pocetna");
        ModelAndView modelAndView = new ModelAndView("logovanje");
        return modelAndView;
    }
    
    @RequestMapping(value = "/prijavljivanje", method = RequestMethod.POST)
    public ModelAndView prijavljivanje(@ModelAttribute("form") Korisnik korisnik, ModelMap model, HttpServletRequest request, HttpServletResponse response) {
        KorisnikModel km = new KorisnikModel();
        korisnik.setId(0);
        List<Korisnik> korisnici = km.findKorisnika(korisnik);
        for(Korisnik k : korisnici){
            if (k.getUsername().equals(korisnik.getUsername()) && k.getPassword().equals(korisnik.getPassword())){
                korisnik.setId(k.getId());
                korisnik.setEmail(k.getEmail());
                korisnik.setPhoneNumber(k.getPhoneNumber());
            }
        }
        if(korisnik.getId()!=0){
            request.getSession().setAttribute("logovani", korisnik);
            request.setAttribute("idLogovanog", korisnik.getId());
            idLogovanog = korisnik.getId();
            model.addAttribute("korisnik", korisnik);
            model.addAttribute("view", "pocetna");
            ModelAndView modelAndView = new ModelAndView("layout");
            return modelAndView;
        }
        else {
            model.addAttribute("view", "korisnik/prijava");
            ModelAndView modelAndView = new ModelAndView("logovanje");
            return modelAndView;
        }
    }

    
}
