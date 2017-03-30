package com.pocket.sql.dao;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pocket.sql.bean.Review;
import com.pocket.util.Pagination;

/**
 * A data access object (DAO) providing persistence and search support for
 * Review entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pocket.sql.dao.Review
 * @author MyEclipse Persistence Tools
 */

public class ReviewDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(ReviewDAO.class);
	// property constants
	public static final String CONTENT = "content";

	protected void initDao() {
		// do nothing
	}
// 
	public List findMenu(Integer id){
		
	
		String queryString ="from Review where menu.id = "+id+" order by time desc";
		return getHibernateTemplate().find(queryString);
	}
	
	
	
	public void save(Review transientInstance) {
		log.debug("saving Review instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Review persistentInstance) {
		log.debug("deleting Review instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Review findById(java.lang.Integer id) {
		log.debug("getting Review instance with id: " + id);
		try {
			Review instance = (Review) getHibernateTemplate().get(
					"com.pocket.sql.dao.Review", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Review instance) {
		log.debug("finding Review instance by example");
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
		log.debug("finding Review instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Review as model where model."
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

	public List findAll() {
		log.debug("finding all Review instances");
		try {
			String queryString = "from Review";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Review merge(Review detachedInstance) {
		log.debug("merging Review instance");
		try {
			Review result = (Review) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Review instance) {
		log.debug("attaching dirty Review instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Review instance) {
		log.debug("attaching clean Review instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ReviewDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ReviewDAO) ctx.getBean("ReviewDAO");
	}
//	public List findAllByPage(final Integer page,final Integer pageCount){
//		Query queryObject =getSession().createQuery("from Userinfo");
//		queryObject.setMaxResults(pageCount);
//		queryObject.setFirstResult((page-1)*pageCount+1);
//		return queryObject.list();
	
//		return (List) getHibernateTemplate().execute(new HibernateCallback(){
//				public Object doInHibernate(Session arg0)throws HibernateException, SQLException {
//				Query queryObject =arg0.createQuery("from Review");
//				queryObject.setMaxResults(pageCount);
//				queryObject.setFirstResult((page-1)*pageCount+1);
//				
//				return queryObject.list();
//			}
//		});		
//	}
	public  Pagination findPageByQuery( final  String hsql, final int pageSize,final int startIndex){ 
	     return (Pagination)getHibernateTemplate().execute( 
	     new  HibernateCallback() { 
	       public  Object doInHibernate(Session session)  throws  HibernateException, SQLException { 
	             Query query  =  session.createQuery(hsql);
	             int totalCount=query.list().size();
	             query.setFirstResult(startIndex); 
	             query.setMaxResults(pageSize); 
	             List items  = query.list();
	             Pagination ps = new Pagination(items,totalCount, pageSize, startIndex);
	          return ps;
	             
	             } 
	       },true); 
	  }
		
	
}