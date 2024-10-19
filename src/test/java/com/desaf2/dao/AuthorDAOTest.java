package com.desaf2.dao;

import com.desaf2.model.AuthorModel;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import org.junit.jupiter.api.*;

import java.util.Date;

import static org.junit.jupiter.api.Assertions.*;

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
class AuthorDAOTest {
    private static EntityManagerFactory emf;
    private EntityManager em;
    private EntityTransaction tx;
    private AuthorDAO authorDAO;

    @BeforeAll
    public void initEntityManager() {
        emf = Persistence.createEntityManagerFactory("AuthorsPU");
    }

    @AfterAll
    public void closeEntityManager() {
        if (emf != null) emf.close();
    }

    @BeforeEach
    public void initTransaction() {
        em = emf.createEntityManager();
        tx = em.getTransaction();
        authorDAO = new AuthorDAO();
    }

    @AfterEach
    public void closeTransaction() {
        if (em != null) em.close();
    }

    @Test
    public void testCreateAuthor() {
        tx.begin();

        AuthorModel author = new AuthorModel();
        author.setNameAuthor("Test Author");
        author.setBirthday(new Date());
        author.setPhoneNumber(71234567);
        author.setGender("Masculino");

        authorDAO.createAuthor(author);

        tx.commit();

        Assertions.assertTrue(author.getIdAuthor() > 0);
    }
}