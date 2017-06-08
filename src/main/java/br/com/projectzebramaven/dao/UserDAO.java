package br.com.projectzebramaven.dao;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import br.com.projectzebramaven.basic.Event;
import br.com.projectzebramaven.basic.User;

@Stateless
public class UserDAO {

	@PersistenceContext(unitName="CredencialDS")
	protected EntityManager entityManager;
	
	public User save(User u) throws Exception {
		return entityManager.merge(u);
	}
	
	public User getById(final Long id) {
		return entityManager.find(User.class, id);
	}
	
	public List<User> findAll() {
		List<User> results = new ArrayList<User>();
		  Query query = entityManager.createQuery(" select e from User e ");
	        results = query.getResultList();
				return results;
	}
	
	public Long qtdUser(Long id) {
		Long qtd ;
		 Query query = entityManager.createQuery(" select count(*) from User u where u.event.id = :id");
		 query.setParameter("id", id);
		 qtd = (Long)query.getSingleResult();
		return qtd;
	}

	
	public List<User> getByCpf(String u, String eventID) {
		List<User> results = new ArrayList<User>();
		long evID = Long.parseLong(eventID);
		  Query query = entityManager.createQuery(" select u from User u  where u.cpf = :cpf and  u.event.id = :evID");
	        query.setParameter("cpf", u);
	        query.setParameter("evID", evID);
	        results = query.getResultList();
			
				return results;
	}
	
	public List<User> getByCpf(String u) {
		List<User> results = new ArrayList<User>();
		  Query query = entityManager.createQuery(" select u from User u  where u.cpf = :cpf ");
	        query.setParameter("cpf", u);
	        results = query.getResultList();
			
				return results;
	}
	
	public List<User> getByEmail(String u) {
		List<User> results = new ArrayList<User>();
		  Query query = entityManager.createQuery(" select u from User u  where u.email = :email ");
	        query.setParameter("email", u);
	        results = query.getResultList();
				return results;
	}
	
	public void merge(User u) {
		try {
			entityManager.getTransaction().begin();
			entityManager.merge(u);
			entityManager.getTransaction().commit();
		} catch (Exception ex) {
			ex.printStackTrace();
			entityManager.getTransaction().rollback();
		}
	}

	public void remove(User u) {
		try {
			entityManager.getTransaction().begin();
			u = entityManager.find(User.class, u.getId());
			entityManager.remove(u);
			entityManager.getTransaction().commit();
		} catch (Exception ex) {
			ex.printStackTrace();
			entityManager.getTransaction().rollback();
		}
	}
	
	public void removeById(final Long id) {
		try {
			User u = getById(id);
			entityManager.remove(u);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
