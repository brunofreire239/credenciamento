package br.com.projectzebramaven.action;

import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NameNotFoundException;
import javax.naming.NamingException;

import org.apache.struts2.convention.annotation.Namespace;

import br.com.projectzebramaven.basic.Event;
import br.com.projectzebramaven.basic.User;
import br.com.projectzebramaven.dao.EventDAO;
import br.com.projectzebramaven.dao.UserDAO;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;


@SuppressWarnings("serial")
@Namespace("/event")
public class EventAction extends ActionSupport{
	private Event event = new Event();
	private String name;
	private String date;
	private EventDAO eventDao;
	private int messageEvent = 0;
	private List<Event> events;
	protected String  id;
	private int qtdTotal , voucherPercentage, manualPercentage, smartPhonePercentage;
	private Long qtdTotalEvent;
	private UserDAO userDao;
	
	public EventAction() throws NamingException {
		InitialContext ctx = new InitialContext();
		try {
			userDao = (UserDAO) ctx.lookup("java:global/credenciamento/UserDAO!br.com.projectzebramaven.dao.UserDAO");
			eventDao = (EventDAO) ctx.lookup("java:global/credenciamento/EventDAO!br.com.projectzebramaven.dao.EventDAO");
		} catch (NameNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@Action(value = "indexEvent", results = @Result(name = SUCCESS, location = "/WEB-INF/view/indexEvent.jsp"))
	public String indexEvent() throws Exception {
		events = eventDao.findAll();
		return SUCCESS;
	}
	@Action(value = "formEvent", results = @Result(name = SUCCESS, location = "/WEB-INF/view/formEvent.jsp"))
	public String index() throws Exception {
		return SUCCESS;
	}
	
	@Action(value = "save", results = {
			@Result(name = SUCCESS, location =  "/WEB-INF/view/indexEvent.jsp"),
			@Result(name = ERROR, location = "/WEB-INF/view/index.jsp") })
	public String saveEvent() throws Exception {
	if(event.getId() == null){
		  messageEvent = 1;
	}else{
		  messageEvent = 2;
	}
		event = eventDao.save(event);
		     
				indexEvent();
		return SUCCESS;
	}
	
	@Action(value = "updateEvent", results = {
			@Result(name = SUCCESS, location =  "/WEB-INF/view/formEvent.jsp")})
	public String updateEvent() throws Exception {
		setEvent(eventDao.getById(Long.valueOf(id)));
		messageEvent = 2;
		return SUCCESS;
	}
	
	/*@Action(value = "reportEvent", results = {
			@Result(name = SUCCESS, location =  "/WEB-INF/view/formReport.jsp")})
	public String reportEvent() throws Exception {
		setEvent(eventDao.getById(Long.valueOf(id)));
		qtdTotalEvent = userDao.qtdUser(Long.valueOf(id));
		qtdTotal = event.getManual() + event.getSmartPhone() + event.getVoucher();
		if(qtdTotal > 0){
		voucherPercentage = event.getVoucher() * 100 / qtdTotal;
		smartPhonePercentage = event.getSmartPhone() * 100 / qtdTotal;
		manualPercentage = event.getManual() * 100 / qtdTotal;
		}
		messageEvent = 2;
		return SUCCESS;
	}*/
	
	@Action(value = "deleteEvent", results = {
			@Result(name = SUCCESS, location =  "/WEB-INF/view/indexEvent.jsp")})
	public String deleteEvent() throws Exception {
		eventDao.removeById(Long.valueOf(id));
		indexEvent();
		return SUCCESS;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public int getMessageEvent() {
		return messageEvent;
	}

	public void setMessageEvent(int messageEvent) {
		this.messageEvent = messageEvent;
	}

	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getQtdTotal() {
		return qtdTotal;
	}

	public void setQtdTotal(int qtdTotal) {
		this.qtdTotal = qtdTotal;
	}

	public int getVoucherPercentage() {
		return voucherPercentage;
	}

	public void setVoucherPercentage(int voucherPercentage) {
		this.voucherPercentage = voucherPercentage;
	}

	public int getManualPercentage() {
		return manualPercentage;
	}

	public void setManualPercentage(int manualPercentage) {
		this.manualPercentage = manualPercentage;
	}

	public int getSmartPhonePercentage() {
		return smartPhonePercentage;
	}

	public void setSmartPhonePercentage(int smartPhonePercentage) {
		this.smartPhonePercentage = smartPhonePercentage;
	}

	public Long getQtdTotalEvent() {
		return qtdTotalEvent;
	}

	public void setQtdTotalEvent(Long qtdTotalEvent) {
		this.qtdTotalEvent = qtdTotalEvent;
	}

	
}
