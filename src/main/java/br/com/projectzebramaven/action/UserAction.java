package br.com.projectzebramaven.action;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NameNotFoundException;
import javax.naming.NamingException;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;

import org.apache.struts2.convention.annotation.Namespace;

import br.com.projectzebramaven.basic.Event;
import br.com.projectzebramaven.basic.User;
import br.com.projectzebramaven.dao.EventDAO;
import br.com.projectzebramaven.dao.UserDAO;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;


@SuppressWarnings("serial")
@Namespace("/usuario")
public class UserAction extends ActionSupport{
	
	private User user = new User();
	private Event event = new Event();
	private UserDAO userDao;
	private String name;
	private String cpf;
	private String email;
	private String state;
	private String city;
	private String errorJavaToAjax;
	private int msg = 0;
	private String eventId;
	private String fileCSV;
	private String imp;
	private List<Event> events;
	private EventDAO eventDao;
	private List<User> usuarios;
	protected String  id,valor;
	private long conf;
	
	public UserAction() throws NamingException {
		InitialContext ctx = new InitialContext();
		try {								
			userDao = (UserDAO) ctx.lookup("java:global/credenciamento/UserDAO!br.com.projectzebramaven.dao.UserDAO");
			eventDao = (EventDAO) ctx.lookup("java:global/credenciamento/EventDAO!br.com.projectzebramaven.dao.EventDAO");
		} catch (NameNotFoundException e) {
			e.printStackTrace();
		}
	}
	@Action(value = "indexUsuario", results = @Result(name = SUCCESS, location = "/WEB-INF/view/indexUsuario.jsp"))
	public String indexUsuario() throws Exception {
		usuarios = userDao.findAll();
		return SUCCESS;
	}
	
	@Action(value = "updateUser", results = {
			@Result(name = SUCCESS, location =  "/WEB-INF/view/formUsuario.jsp")})
	public String updateUser() throws Exception {
		setUser(userDao.getById(Long.valueOf(id)));
		events = eventDao.findAll();
		return SUCCESS;
	}
	
	@Action(value = "deleteUser", results = {
			@Result(name = SUCCESS, location =  "/WEB-INF/view/indexUsuario.jsp")})
	public String deleteUser() throws Exception {
		userDao.removeById(Long.valueOf(id));
		indexUsuario();
			msg = 3;
		return SUCCESS;
	}
	
	@Action(value = "formUsuario", results = @Result(name = SUCCESS, location = "/WEB-INF/view/formUsuario.jsp"))
	public String index() throws Exception {
		events = eventDao.findAll();
		return SUCCESS;
	}
	
	@Action(value = "tablet", results = @Result(name = SUCCESS, location = "/WEB-INF/view/credencial.jsp"))
	public String tablet() throws Exception {
		return SUCCESS;
	}
	
	@Action(value = "formZebra", results = @Result(name = SUCCESS, location = "/WEB-INF/view/formZebra.jsp"))
	public String indexZebra() throws Exception {
		return SUCCESS;
	}
	
	@Action(value = "formCSV", results = @Result(name = SUCCESS, location = "/WEB-INF/view/formCSV.jsp"))
	public String indexCSV() throws Exception {
		events = eventDao.findAll();
		return SUCCESS;
	}
	
	@Action(value = "save", results = {
			@Result(name = SUCCESS, location =  "/WEB-INF/view/indexUsuario.jsp"),
			@Result(name = ERROR, location = "/WEB-INF/view/formUsuario.jsp") })
	public String save() throws Exception {
		Event e = new Event();
		e.setId(Long.parseLong(eventId));
				user.setEvent(e);
				if(user.getId() == null){
					msg = 1;
				}else{
					msg = 2;
				}
				List<User> u = new ArrayList<User>();
				List<User> u2 = new ArrayList<User>();
				
				if(u.size() > 0 && u.get(0).getId() != user.getId()){
					msg = 5;
					index();
					return ERROR;
				}else{
		        user = userDao.save(user);
				}
		        indexUsuario();
		return SUCCESS;
	}
	
	@Action(value = "zebra", results = {
			@Result(name = SUCCESS, location =  "/WEB-INF/view/formZebra.jsp"),
			@Result(name = ERROR, location = "/WEB-INF/view/index.jsp") })
	public String zebra() throws Exception {
		User u = null;
		u = userDao.getById(Long.parseLong(id));
			if(u != null){
		
				  PrintService psZebra;
			        String sPrinterName = "";
			        psZebra = null;
		        	sPrinterName = "ZDesigner GC420t (EPL)";
			        PrintService[] services = PrintServiceLookup.lookupPrintServices(null,null);
			        PrintService aprintservice[];
			       // System.out.println(services.length);
			        int k = (aprintservice = services).length;
			      
			        for(int j = 0; j < k; j++)
			        {
			            PrintService ps = aprintservice[j];
			       
			            if(sPrinterName.equalsIgnoreCase(ps.getName()))
			                psZebra = ps;
			        }
		
			        if(psZebra == null)
			        {
			            msg = 3;
			            return SUCCESS;
			        }
			        try
			        {
			            DocPrintJob job = psZebra.createPrintJob();
			            String s = "";
			          
			            msg = 1;
			            s = "TESTE";
			            byte by[] = s.getBytes();
			            DocFlavor flavor = javax.print.DocFlavor.BYTE_ARRAY.AUTOSENSE;
			            javax.print.Doc doc = new SimpleDoc(by, flavor, null);
			            job.print(doc, null);
			            System.out.println("RECIBO GERADO COM SUCESSO ! ");
			        }
			        catch(Exception e)
			        {
			            e.printStackTrace();
			      }
		
			}else{
				msg = 2;
			}
		return SUCCESS;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getErrorJavaToAjax() {
		return errorJavaToAjax;
	}
	public void setErrorJavaToAjax(String errorJavaToAjax) {
		this.errorJavaToAjax = errorJavaToAjax;
	}
	public int getMsg() {
		return msg;
	}
	public void setMsg(int msg) {
		this.msg = msg;
	}

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public String getFileCSV() {
		return fileCSV;
	}

	public void setFileCSV(String fileCSV) {
		this.fileCSV = fileCSV;
	}
	public List<Event> getEvents() {
		return events;
	}
	public void setEvents(List<Event> events) {
		this.events = events;
	}
	public List<User> getUsuarios() {
		return usuarios;
	}
	public void setUsuarios(List<User> usuarios) {
		this.usuarios = usuarios;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getImp() {
		return imp;
	}
	public void setImp(String imp) {
		this.imp = imp;
	}
	public Event getEvent() {
		return event;
	}
	public void setEvent(Event event) {
		this.event = event;
	}
	public long getConf() {
		return conf;
	}
	public void setConf(long conf) {
		this.conf = conf;
	}
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}
	
	
}
