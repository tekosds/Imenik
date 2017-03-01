/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import modeli.KontaktModel;
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
@RequestMapping(value = "/kontakt")
public class KontaktController {
    
    private int idLogovanog = 0;
    
    @RequestMapping(value = "/kontakt", method = RequestMethod.GET)
    public ModelAndView kontakti1(ModelMap mm) {
        
        KontaktModel km = new KontaktModel();
        List<Kontakt> kontakti = km.findPoKorisniku(idLogovanog);
        mm.addAttribute("kontakti", kontakti);
        mm.addAttribute("view", "kontakt/kontakti");
        ModelAndView modelAndView = new ModelAndView("layout", mm);
        return modelAndView;
    }
    
    @RequestMapping(value = "/kontakt/{idLogovanog}", method = RequestMethod.GET)
    public ModelAndView kontakti(@PathVariable int idLogovanog, ModelMap mm) {
        this.idLogovanog = idLogovanog;
        KontaktModel km = new KontaktModel();
        List<Kontakt> kontakti = km.findPoKorisniku(idLogovanog);
        mm.addAttribute("kontakti", kontakti);
        mm.addAttribute("view", "kontakt/kontakti");
        ModelAndView modelAndView = new ModelAndView("layout", mm);
        return modelAndView;
    }
  
    @RequestMapping(value = "/kreiraj", method = RequestMethod.GET)
    public ModelAndView kreiraj(ModelMap mm) {
        mm.addAttribute("view", "kontakt/kreiraj");
        ModelAndView modelAndView = new ModelAndView("layout", mm);
        return modelAndView;
    }

    @RequestMapping(value = "/kreiraj", method = RequestMethod.POST)
    public ModelAndView kreiraj(@ModelAttribute("form") Kontakt kontakt, ModelMap model) {
        kontakt.setKorisnik(new Korisnik());
        kontakt.getKorisnik().setId(idLogovanog);
        KontaktModel km = new KontaktModel();
        km.create(kontakt);
        return kontakti(kontakt.getKorisnik().getId(),model);
    }

    @RequestMapping(value = "/izmeni/{idKontakta}", method = RequestMethod.GET)
    public ModelAndView izmeni(@PathVariable int idKontakta, ModelMap model) {
        Kontakt k = new Kontakt();
        KontaktModel km = new KontaktModel();
        k = km.find(idKontakta);
        model.addAttribute("kontakt", k);
        model.addAttribute("view", "kontakt/izmeni");
        ModelAndView modelAndView = new ModelAndView("layout", model);
        return modelAndView;
    }

    
    @RequestMapping(value = "/izmena/{id}", method = RequestMethod.POST)
    public ModelAndView izmena_post(@PathVariable int id, @ModelAttribute("form") Kontakt kontakt, ModelMap model) {
        kontakt.setId(id);
        kontakt.setKorisnik(new Korisnik());
        kontakt.getKorisnik().setId(idLogovanog);
        KontaktModel km = new KontaktModel();
        km.update(kontakt);
        Kontakt k = km.find(kontakt.getId());
        model.addAttribute("kontakt", k);
        model.addAttribute("view", "kontakt/izmeni");
        ModelAndView modelAndView = new ModelAndView("layout", model);
        return modelAndView;
    }
    
    
    @RequestMapping(value = "/obrisi/{idKontakta}", method = RequestMethod.GET)
    public ModelAndView obrisi(@PathVariable int idKontakta, ModelMap model) {
        Kontakt k = new Kontakt();
        k.setId(idKontakta);
        KontaktModel km = new KontaktModel();
        km.delete(k);
        return kontakti(idLogovanog,model);
    }
}
