package br.com.projectzebramaven.basic;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "user")
@XmlRootElement
public class User {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    @XmlElement(name="id")
	private Long id;
	
	@ManyToOne
    @JoinColumn(name = "event_id")
    private Event event;

	 @Column(length = 255, name = "name")
	 @XmlElement(name="name")
	 private String name;
	 
	@Column(length = 255, name = "rua")
	@XmlElement(name = "rua")
	private String rua;

	@Column(length = 255, name = "obs")
	@XmlElement(name = "obs")
	private String obs;

	@Column(length = 255, name = "city")
	@XmlElement(name = "city")
	private String city;
	
	@Column(length = 255, name = "numero")
	@XmlElement(name = "numero")
	private String numero;
	
	@Column(length = 255, name = "telefone")
	@XmlElement(name = "telefone")
	private String telefone;
	
	@Column(length = 255, name = "edificio")
	@XmlElement(name = "edificio")
	private String edificio;
	
	@Column(length = 255, name = "apt")
	@XmlElement(name = "apt")
	private String apt;
	
	@Column(length = 255, name = "bloco")
	@XmlElement(name = "bloco")
	private String bloco;
	
	@Column(length = 255, name = "andar")
	@XmlElement(name = "andar")
	private String andar;
	
	@Column(length = 255, name = "bairro")
	@XmlElement(name = "bairro")
	private String bairro;
	
	@Column(length = 255, name = "state")
	@XmlElement(name = "state")
	private String state;

	
	@Column(length = 255, name = "valor")
	@XmlElement(name = "valor")
	private String valor;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRua() {
		return rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	public String getObs() {
		return obs;
	}

	public void setObs(String obs) {
		this.obs = obs;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Event getEvent() {
		return event;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getEdificio() {
		return edificio;
	}

	public void setEdificio(String edificio) {
		this.edificio = edificio;
	}

	public String getApt() {
		return apt;
	}

	public void setApt(String apt) {
		this.apt = apt;
	}

	public String getBloco() {
		return bloco;
	}

	public void setBloco(String bloco) {
		this.bloco = bloco;
	}

	public String getAndar() {
		return andar;
	}

	public void setAndar(String andar) {
		this.andar = andar;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

}
