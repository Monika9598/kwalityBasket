package com.kwalitybasket.controller;

import com.kwalitybasket.model.Role;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class JdbcTestConnectionTest {
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("ApneeHattiDB");
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();

        Role role = new Role();
        role.setRoleName("Role 1");
        em.persist(role);
        tx.commit();
        em.close();
        System.out.println("role saved");
    }

}
