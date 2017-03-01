/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import hibernate.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import pojo.Kontakt;
import pojo.Korisnik;
/**
 *
 * @author PC
 */
public class KorisnikModel extends AbstractModel<Korisnik>{
     
    public KorisnikModel() {
        super(Korisnik.class);
    }

    public List<Korisnik> findKorisnika(Korisnik korisnik) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            List<Korisnik> k = session.createQuery("from pojo.Korisnik where username= '" +korisnik.getUsername() + "' and password ='" + korisnik.getPassword()+"'").list();
            session.close();
            return k;
        } catch (Exception e) {
            List<Korisnik> k = new ArrayList<>();
            k.add(new Korisnik());
            return k;
        }
    }
}
