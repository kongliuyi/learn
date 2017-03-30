package com.pocket.sql.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pocket.sql.bean.Basket;

/**
 * A data access object (DAO) providing persistence and search support for
 * Basket entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pocket.sql.dao.Basket
 * @author MyEclipse Persistence Tools
 */

public class BasketDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(BasketDAO.class);
	// property constants
	public static final String _CID = "CId";

	protected void initDao() {
		// do nothing
	}

	public void save(Basket transientInstance) {
		log.debug("saving Basket instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Basket persistentInstance) {
		log.debug("deleting Basket instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Basket findById(java.lang.Integer id) {
		log.debug("getting Basket instance with id: " + id);
		try {
			Basket instance = (Basket) getHibernateTemplate().get(
					"com.pocket.sql.dao.Basket", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Basket instance) {
		log.debug("finding Basket instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Basket instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Basket as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCId(Object CId) {
		return findByProperty(_CID, CId);
	}

	public List findAll() {
		log.debug("finding all Basket instances");
		try {
			String queryString = "from Basket";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Basket merge(Basket detachedInstance) {
		log.debug("merging Basket instance");
		try {
			Basket result = (Basket) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Basket instance) {
		log.debug("attaching dirty Basket instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Basket instance) {
		log.debug("attaching clean Basket instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BasketDAO getFromApplicationContext(ApplicationContext ctx) {
		return (BasketDAO) ctx.getBean("BasketDAO");
	}
}