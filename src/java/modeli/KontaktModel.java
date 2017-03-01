/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import hibernate.HibernateUtil;
import java.util.List;
import pojo.Kontakt;
/**
 *
 * @author PC
 */
public class KontaktModel extends AbstractModel<Kontakt>{
     
    public KontaktModel() {
        super(Kontakt.class);
    }
    
    public List<Kontakt> findPoKorisniku(int r) {
        session = HibernateUtil.getSessionFactory().openSession();
        List<Kontakt> kontakti = session.createQuery("from pojo.Kontakt where korisnik=" + r).list();
        session.close();
        return kontakti;
    }
}
