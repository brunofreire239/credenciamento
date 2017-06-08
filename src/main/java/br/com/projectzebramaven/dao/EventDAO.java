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
public class EventDAO {
	@PersistenceContext(unitName="CredencialDS")
	protected EntityManager entityManager;
	
	public Event save(Event u) throws Exception {
		return entityManager.merge(u);
	}
	
	public Event getById(final Long id) {
		return entityManager.find(Event.class, id);
	}
	
	public List<Event> findAll() {
		List<Event> results = new ArrayList<Event>();
		  Query query = entityManager.createQuery(" select e from Event e ");
	        results = query.getResultList();
			
				return results;
	}
	
	public void merge(Event u) {
		try {
			entityManager.getTransaction().begin();
			entityManager.merge(u);
			entityManager.getTransaction().commit();
		} catch (Exception ex) {
			ex.printStackTrace();
			entityManager.getTransaction().rollback();
		}
	}

	public void remove(Event u) {
		try {
			u = entityManager.find(Event.class, u.getId());
			entityManager.remove(u);
		} catch (Exception ex) {
			ex.printStackTrace();
			entityManager.getTransaction().rollback();
		}
	}
	
	public void removeById(final Long id) {
		try {
			Event u = getById(id);
			entityManager.remove(u);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
