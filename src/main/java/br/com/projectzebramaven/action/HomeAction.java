package br.com.projectzebramaven.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
@Namespace("/")
public class HomeAction extends ActionSupport {


	@Action(value = "", results = @Result(name = SUCCESS, location = "view/index.jsp"))
	public String index() throws Exception {
		return SUCCESS;
	}

}
