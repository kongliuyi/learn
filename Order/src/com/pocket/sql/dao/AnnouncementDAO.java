package com.pocket.sql.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pocket.sql.bean.Announcement;

/**
 * A data access object (DAO) providing persistence and search support for
 * Announcement entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pocket.sql.dao.Announcement
 * @author MyEclipse Persistence Tools
 */

public class AnnouncementDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(AnnouncementDAO.class);
	// property constants
	public static final String CONTENT = "content";
	public static final String USERNAME = "username";

	protected void initDao() {
		// do nothing
	}

	public void save(Announcement transientInstance) {
		log.debug("saving Announcement instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Announcement persistentInstance) {
		log.debug("deleting Announcement instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Announcement findById(java.lang.Integer id) {
		log.debug("getting Announcement instance with id: " + id);
		try {
			Announcement instance = (Announcement) getHibernateTemplate().get(
					"com.pocket.sql.bean.Announcement", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Announcement instance) {
		log.debug("finding Announcement instance by example");
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
		log.debug("finding Announcement instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Announcement as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findByUsername(Object username) {
		return findByProperty(USERNAME, username);
	}

	public List findAll() {
		log.debug("finding all Announcement instances");
		try {
			String queryString = "from Announcement";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Announcement merge(Announcement detachedInstance) {
		log.debug("merging Announcement instance");
		try {
			Announcement result = (Announcement) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Announcement instance) {
		log.debug("attaching dirty Announcement instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Announcement instance) {
		log.debug("attaching clean Announcement instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static AnnouncementDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (AnnouncementDAO) ctx.getBean("AnnouncementDAO");
	}

	public List findShow() {
		String queryString = "from Announcement order by time desc limit 1";
		return getHibernateTemplate().find(queryString);
	}
}