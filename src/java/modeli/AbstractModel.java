/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import hibernate.HibernateUtil;
import pojo.*;
import java.io.*;
import java.util.*;
import org.hibernate.*;

@SuppressWarnings("unchecked")
public abstract class AbstractModel<T> {

    Session session;
    List<T> lista;
    private Class<T> entityClass;
    protected final SessionFactory sessionFactory = HibernateUtil
            .getSessionFactory();

    public AbstractModel(Class<T> entityClass) {
        this.entityClass = entityClass;
    }

    public AbstractModel() {
    }

    public List<T> findAll() {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            lista = session.createQuery("from " + entityClass.getName()).list();
            session.getTransaction().commit();
            session.close();
            return lista;

//            Session session = HibernateUtil.getSessionFactory().openSession();
//            List<T> lista= session.createQuery("from " + entityClass.getName()).list();
//            session.close();
//            return lista;
//            if (!sessionFactory.getCurrentSession().getTransaction().isActive())
//                sessionFactory.getCurrentSession().getTransaction().begin();            
//            return sessionFactory.getCurrentSession()
//                    .createQuery("from " + entityClass.getName()).list();
        } catch (RuntimeException re) {
            return null;
        }

    }
    
    public List<T> NadjiKontakte() {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            lista = session.createQuery("from " + entityClass.getName()).list();
            session.getTransaction().commit();
            session.close();
            return lista;

//            Session session = HibernateUtil.getSessionFactory().openSession();
//            List<T> lista= session.createQuery("from " + entityClass.getName()).list();
//            session.close();
//            return lista;
//            if (!sessionFactory.getCurrentSession().getTransaction().isActive())
//                sessionFactory.getCurrentSession().getTransaction().begin();            
//            return sessionFactory.getCurrentSession()
//                    .createQuery("from " + entityClass.getName()).list();
        } catch (RuntimeException re) {
            return null;
        }

    }

    public void update(T instance) {
        try {

            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.merge(instance);
            session.getTransaction().commit();
        } catch (RuntimeException re) {
            session.getTransaction().rollback();
            throw re;
        }
    }

    public void delete(T instance) {

        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(instance);
        session.getTransaction().commit();
        session.close();

//        try {
//            if (!sessionFactory.getCurrentSession().getTransaction().isActive()) {
//                sessionFactory.getCurrentSession().getTransaction().begin();
//            }
//            sessionFactory.getCurrentSession().delete(instance);
//            sessionFactory.getCurrentSession().getTransaction().commit();
//        } catch (RuntimeException re) {
//            sessionFactory.getCurrentSession().getTransaction().rollback();
//            throw re;
//        }
    }

    public void create(T instance) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.saveOrUpdate(instance);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
        }

        session.close();
//        try {
//            if (!sessionFactory.getCurrentSession().getTransaction().isActive()) {
//                sessionFactory.getCurrentSession().getTransaction().begin();
//            }
//            sessionFactory.getCurrentSession().persist(instance);
//            sessionFactory.getCurrentSession().getTransaction().commit();
//        } catch (RuntimeException re) {
//            sessionFactory.getCurrentSession().getTransaction().rollback();
//            throw re;
//        }
    }

    public T find(Object primarykey) {
        session = HibernateUtil.getSessionFactory().openSession();
        Object o = session.get(entityClass, (Serializable) primarykey);
        session.close();
        return (T) o;
//        try {
//            if (!sessionFactory.getCurrentSession().getTransaction().isActive()) {
//                sessionFactory.getCurrentSession().getTransaction().begin();
//            }
//            return (T) sessionFactory.getCurrentSession().get(entityClass,
//                    (Serializable) primarykey);
//        } catch (RuntimeException re) {
//            return null;
//        }
    }
}
